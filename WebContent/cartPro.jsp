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
<style></style>
</head>
<body>
	<%
		String id = "user1";
		String oper = request.getParameter("oper");
		String pno = request.getParameter("pno");
		String add = request.getParameter("add");
		String quantity = request.getParameter("quantity");
		CartDao cartdao = CartDao.getInstance();
		if(oper.equals("0")) {
			int result = cartdao.addCart(id, pno, quantity);
			if(result!=-1 && result!= 0) {
				out.println("장바구니에 추가되었습니다");
			}else {
				out.println("장바구니담기에 실패했습니다");
			}
		}else if(oper.equals("1")) {
			cartdao.addItemQuantity(id, pno, add);
			response.sendRedirect("cart.jsp");
		}else if(oper.equals("2")) {
			cartdao.removeItem(id, pno);
			out.println("<script>alert('상품을 삭제했습니다'); location.href='cart.jsp';</script>");
		}else if(oper.equals("3")) {
			cartdao.removeItemAll(id);
			out.println("<script>alert('상품을 전부 삭제했습니다'); location.href='cart.jsp';</script>");
		}
	%>
	<p><button type="button" onclick="closeWindow()">닫기</button></p>
</body>
<script>
	function closeWindow() {
		self.close();
	}
</script>
</html>