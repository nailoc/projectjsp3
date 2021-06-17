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
<style>
	p#hidden {
		display: none;
	}
</style>
</head>
<body>
	<%
		String id = "user1";
		CartDao cartdao = CartDao.getInstance();
		List<CartItemVo> row = cartdao.getCartItemList(id);
		
		int proPrice = 0;
		for(int i=0; i<row.size(); i++) {
			proPrice+=row.get(i).getPrice();
		}
		int deliFee = 0;
		if(proPrice < 50000) {
			deliFee = 2500;
		}
	%>
	
	<p>상품 갯수 : <%=row.size() %></p>
	<table>
		<colgroup>
			<col width="80px;">
			<col width="600px;">
			<col width="60px;">
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
	<form id="pay" method="get" action="checkoutPro.jsp">
		<input type="radio" name="deliway" value="택배" checked="checked">택배
		<input type="radio" name="deliway" value="방문수령">방문수령
		
		<h3>배송지 정보</h3>
		<p>배송지 선택 <input type="radio" name="address" checked="checked">기본 배송지 <input type="radio" name="address">신규배송지</p>
		<p>회원이름</p>
		<p>회원전화번호</p>
		<p>회원 주소</p>
		<p><input type="text" name="etc" value="" placeholder="요청사항을 입력해주세요"></p>
		
		<h3>할인 및 포인트</h3>
		<p>쿠폰 할인</p>
		<p>상품/주문쿠폰 <input type="text" value="0">원 <button type="button" disabled="disabled">쿠폰사용</button></p>
		<p>배송비 쿠폰 <input type="text" value="0">원 <button type="button" disabled="disabled">쿠폰사용</button></p>
		
		<p>포인트 결제</p>
		<p>보유 <input type="text" value="0">원</p>
		<p>사용 <input id="point" type="text" value="0">원<button type="button">전액사용</button></p>
		
		<p>상품금액 <label id="proPrice"><%=String.format("%,d",proPrice) %></label>원</p>
		<p id="hidden"><input type="text" name="proPrice" value="<%=proPrice%>"></p>
		<p>배송비 <label id="deliFee"><%=String.format("%,d",deliFee) %></label>원</p>
		<p id="hidden"><input type="text" name="deliFee" value="<%=deliFee%>"></p>
		<p>사용포인트 - 0원</p>
		<p>최종금액 <label><%=String.format("%,d",proPrice+deliFee)%></label>원</p>
		<p id="hidden"><input type="text" name="price" value="<%=proPrice + deliFee%>"></p>
		
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
		
		<button type="button" onclick="pay()">결제하기</button>
	</form>
	
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
</script>
</html>