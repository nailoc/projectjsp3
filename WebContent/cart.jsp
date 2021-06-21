<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="css/style_cart.css"></link>
<link rel="stylesheet" href="css/headerfooter.css"></link>
<style></style>
</head>
<body>
	<%
		String id = (String) session.getAttribute("userid");
		if(id==null) {
			out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp'</script>;");
		}
		CartDao cartdao = CartDao.getInstance();
		List<CartItemVo> row = cartdao.getCartItemList(id);
		
		int totalPrice = 0;
		for(int i=0; i<row.size(); i++) {
			totalPrice+=row.get(i).getTotalPrice();
		}
		
		int totalQuantity = 0;
		for (int i=0; i<row.size(); i++) {
			totalQuantity += row.get(i).getQuantity();
		}
		
		int deliFee = 0;
		if(totalPrice==0 || totalPrice > 50000) {
			deliFee = 0;
		}else {
			deliFee = 2500;
		}
	%>
	<%@ include file="header.jsp"%>
	
	<div class="mainContainerBox">
		<div class="cartTitle">
			<h2>
				<span>장바구니</span> &nbsp;<span style="font-size: 16px; font-weight:normal;">상품 갯수 : <%=row.size() %></span>
			</h2>
			<ol>
				<li class="active">
					<span>01</span>
					장바구니
					<span class="arrow">&#10095;</span>
				</li>
				<li>
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
		<div class="cartListBox">
			<table>
				<colgroup>
					<col width="120px;">
					<col width="750px;">
					<col width="150px;">
					<col width="100px;">
				</colgroup>
				<%
					if(row.size()==0) {
				%>
					<tr>
						<td colspan="4" style="text-align:center; padding: 15px 0 0 100px;">
							<h2>장바구니에 담은 상품이 없습니다.</h2>
						</td>
					</tr>
				<%
					}else {
						for(int i=0; i<row.size(); i++) {
				%>
					<tr>
						<td><img src="<%=row.get(i).getMain_img1() %>" style="width:90px;"></td>
						<td><a href="item.jsp?pno=<%=row.get(i).getPno()%>"><%=row.get(i).getName() %></a></td>
						<td>
							<button type="button" class="add" id="<%=row.get(i).getPno() %>" onclick="addItem(this.id, -1)">-</button>
							<input type="text" value="<%=row.get(i).getQuantity() %>" size="1">
							<button type="button" class="add" id="<%=row.get(i).getPno() %>" onclick="addItem(this.id, 1)">+</button>
						</td>
						<td><%=String.format("%,d",row.get(i).getTotalPrice())+"원" %></td>
						<td><button class="delete" type="button" id="<%=row.get(i).getPno() %>" onclick="removeItem(this.id)">삭제</button></td>
					</tr>
				<%
						}
					}
				%>
			</table>
		</div>
		<a href="sunglass.jsp?kind=10" class="goShop">&lt; 쇼핑 계속하기</a>
		<%
			if(row.size()>1) {
		%>
			<div class="delAllBox"><button type="button" class="delAll" onclick="removeItemAll()">전체 삭제하기</button></div>
		<%
			}
		%>
		
		<div class="resultWrap">
			<div class="resultBox">
				<div class="result">
					<dl>
						<dt>총 <strong><%=totalQuantity %></strong> 개의 상품금액</dt>
						<dd><strong><%= String.format("%,d",totalPrice)%></strong>원</dd>
					</dl>
					
					<span>+</span>
					
					<dl>
						<dt>배송비</dt>
						<dd><strong><%= String.format("%,d",deliFee)%></strong>원</dd>
					</dl>
					
					<span>=</span>
					
					<dl>
						<dt>합계</dt>
						<dd><strong><%= String.format("%,d",totalPrice+deliFee)%></strong>원</dd>
					</dl>
				</div>
			</div>
		<%
			if(row.size()!=0) {
		%>
		<button type="button" class="pay" onclick="checkout(<%=row.size()%>)">결제하기</button>
		<%
			}
		%>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
</body>
<script>
	function addItem(pno, add) {
		location.href="cartPro.jsp?oper=1&pno="+pno+"&add="+add;
	}
	function removeItem(pno) {
		var ok = confirm("상품을 삭제하시겠습니까");
		if(ok==true) {
			location.href="cartPro.jsp?oper=2&pno="+pno;			
		}
	}
	function removeItemAll() {
		var ok = confirm("모든 상품을 삭제하시겠습니까");
		if(ok==true) {
			location.href="cartPro.jsp?oper=3";		
		}
	}
	function checkout(item) {
		if(item==0) {
			alert("담긴 상품이 없습니다.")
		}else {
			location.href="checkout.jsp";
		}
	}
</script>
</html>