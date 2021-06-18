<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>
	<%
		String id = "user1";
		CartDao cartdao = CartDao.getInstance();
		List<CartItemVo> row = cartdao.getCartItemList(id);
		
		int totalPrice = 0;
		for(int i=0; i<row.size(); i++) {
			totalPrice+=row.get(i).getTotalPrice();
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
			if(row.size()==0) {
		%>
			<h3>담긴 상품이 없습니다.</h3>
		<%
			}else {
				for(int i=0; i<row.size(); i++) {
		%>
			<tr>
				<td><img src="<%=row.get(i).getMain_img1() %>" style="width:80px;"></td>
				<td><a href="item.jsp?pno=<%=row.get(i).getPno()%>"><%=row.get(i).getName() %></a></td>
				<td>
					<button type="button" id="<%=row.get(i).getPno() %>" onclick="addItem(this.id, -1)">-</button>
					<input type="text" value="<%=row.get(i).getQuantity() %>" size="1">
					<button type="button" id="<%=row.get(i).getPno() %>" onclick="addItem(this.id, 1)">+</button>
				</td>
				<td><%=String.format("%,d",row.get(i).getTotalPrice())+"원" %></td>
				<td><button type="button" id="<%=row.get(i).getPno() %>" onclick="removeItem(this.id)">삭제</button></td>
			</tr>
		<%
				}
			}
		%>
		
	</table>
	<p><button type="button" onclick="removeItemAll()">전체 삭제하기</button></p>
	<h3>총 결제금액 : <%= String.format("%,d",totalPrice)+"원"%></h3>
	<p><button type="button" onclick="checkout(<%=row.size()%>)">결제하기</button></p>
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