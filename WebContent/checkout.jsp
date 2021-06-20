<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="css/style_accessory.css"></link>
<link rel="stylesheet" href="css/style_checkout.css"></link>
<style>
	p#hidden {
		display: none;
	}
</style>
</head>
<body>

	<%
		String id = (String) session.getAttribute("userid");
		if(id==null) {
			out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
		}
		CartDao cartdao = CartDao.getInstance();
		List<CartItemVo> row = cartdao.getCartItemList(id);
		
		int proPrice = 0;
		for(int i=0; i<row.size(); i++) {
			proPrice+=row.get(i).getTotalPrice();
		}
		int deliFee = 0;
		if(proPrice < 50000) {
			deliFee = 2500;
		}
		
		MemberDao memdao = MemberDao.getInstance();
		MemberVo memvo = memdao.memberInfo(id);
	%>
	<%@ include file="front/header.jsp" %>
	
	<div class="mainContainerBox">
		<div class="orderTitle">
			<h2>주문 / 결제</h2>
			<ol>
				<li>
					<span>01</span>
					장바구니
					<span class="arrow">&#10095;</span>
				</li>
				<li class="active">
					<span>02</span>
					주문서 작성/결제
					<span class="arrow">&#10095;</span>
				</li>
				<li>
					<span>03</span>
					주문완료
				</li>
			</ol>
		</div>
		
		<div class="orderList">
			<table>
				<colgroup>
					<col width="120px;">
					<col width="750px;">
					<col width="150px;">
					<col width="100px;">
				</colgroup>
				<%
						for(int i=0; i<row.size(); i++) {
				%>
					<tr>
						<td><img src="<%=row.get(i).getMain_img1() %>" style="width:80px;"></td>
						<td><a href="item.jsp?pno=<%=row.get(i).getPno()%>"><%=row.get(i).getName() %></a></td>
						<td><%=row.get(i).getQuantity() %></td>
						<td><%=String.format("%,d",row.get(i).getTotalPrice())+"원" %></td>
					</tr>
				<%
					}
				%>
			</table>
		</div>
		
		<form id="pay" method="get" action="checkoutPro.jsp">
			<input type="radio" name="deliway" value="택배" checked="checked">택배
			<input type="radio" name="deliway" value="방문수령">방문수령
			<h3>배송지 정보</h3>
			<table class="info">
				<colgroup>
					<col width="170px;">
				</colgroup>
				<tbody>
					<tr>
						<td class="title">배송지 선택</td>
						<td><input type="radio" name="address" checked="checked">기본 배송지 <input type="radio" name="address">신규배송지</td>
					</tr>
					
					<tr>
						<td class="title">받으시는분</td>
						<td><%=memvo.getName() %></td>
					</tr>
					
					<tr>
						<td class="title">배송주소</td>
						<td>
							<%=memvo.getAddress()%>  <%=memvo.getAddress2()%>
						</td>
					</tr>
					
					<tr>
						<td class="title">전화번호</td>
						<td><%=memvo.getPhn() %></td>
					</tr>
					
					<tr>
						<td class="title">배송 시 요청사항</td>
						<td><input id="req" type="text" onkeyup="javascript:checkSize();" name="etc" value="" placeholder="요청사항을 입력해주세요"></td>
					</tr>
				</tbody>
			</table>
			
			
			<h3>할인 및 포인트</h3>
			<div class="disAndPointBox">
				<table class="disAndPoint">
					<colgroup>
						<col width="170px;">
					</colgroup>
					<tbody>
						<tr>
							<td rowspan="2" class="title">쿠폰할인</td>
							<td class="dapContent1">상품 / 주문 쿠폰
								<span class="dapContent2"><input type="text" value="0">원 &nbsp;&nbsp;&nbsp;<button type="button" disabled="disabled">쿠폰사용</button>
								</span>
							</td>
						</tr>
						
						<tr>
							<td class="dapContent1">배송비 쿠폰 
								<span class="dapContent2"><input type="text" value="0">원 &nbsp;&nbsp;&nbsp;<button type="button" disabled="disabled">쿠폰사용</button></span>
							</td>
						</tr>
						
						<tr>
							<td rowspan="2" class="title">포인트 결제</td>
							<td class="dapContent1">보유
								<span class="dapContent2"><%=String.format("%,d",memvo.getPoint())%>원</span>
							</td>
						</tr>
						
						<tr>
							<td class="dapContent1">사용
								<span class="dapContent2"><input id="point" type="text" value="0">원 &nbsp;&nbsp;&nbsp;<button type="button">전액사용</button></span>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="resultBox">
					<table>
						<tbody>
							<tr>
								<td style="border-right: 1px solid lightgray;">
									<div class="payWayBox">
										<h3>결제 수단</h3>
										<p>간편결제 선택
										<input type="radio" name="payway" value="카카오페이">카카오페이
										<input type="radio" name="payway" value="payco">payco
										</p>
										<p>일반결제 선택
										<input type="radio" name="payway" value="신용카드">신용카드
										<input type="radio" name="payway" value="무통장입금">무통장입금
										<input type="radio" name="payway" value="실시간계좌이체">실시간계좌이체
										<input type="radio" name="payway" value="휴대폰결제">휴대폰결제
										<input type="radio" name="payway" value="가상계좌">가상계좌
									</div>
								</td>
								
								<td>
									<h3>최종결제금액</h3>
									<ul>
										<li><span>상품금액</span><strong style="float:right;"><%=String.format("%,d",proPrice) %>원</strong></li>
										<li style="display:none"><input type="text" name="proPrice" value="<%=proPrice%>"></li>
										<li><span>배송비</span><strong style="float:right;"><%=String.format("%,d",deliFee) %>원</strong></li>
										<li style="display:none"><input type="text" name="deliFee" value="<%=deliFee%>"></li>
										<li><span>사용포인트</span><strong style="float:right;">0원</strong></li>
										<li><span>최종금액</span><strong style="float:right;"><%=String.format("%,d",proPrice+deliFee)%>원</strong></li>
										<li style="display:none"><input type="text" name="price" value="<%=proPrice + deliFee%>"></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			
			<div class="payReult">
				<button type="button" onclick="pay()">결제하기</button>
			</div>
		</form>
	</div>
	
	<%@ include file="front/footer.jsp" %>
</body>
<script>
	function pay() {
		var payway = "";
		
		const payNodeList
		= document.getElementsByName('payway');
	  
		payNodeList.forEach((node) => {
		if(node.checked)  {
			payway = node.value;
	    }
		})
		
		if(payway=="") {
			alert("결제방법을 선택해주세요");
		} else if(confirm("결제하시겠습니까?")==true){
			var frm = document.getElementById("pay");
			frm.submit();
		}			
	}
	function checkSize() {
		var textObj = document.getElementById("req");
		var resize = textObj.value.length+20;
		textObj.setAttribute('size',resize);
	}
</script>
</html>