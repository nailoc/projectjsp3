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
		String deliway = request.getParameter("deliway");
		String etc = request.getParameter("etc");
		if(etc.equals("")) {
			etc="입력사항 없음";
		}
		String payway = request.getParameter("payway");
		String proPrice = request.getParameter("proPrice");
		String deliFee = request.getParameter("deliFee");
		String price = request.getParameter("price");
		
		CartDao cartdao = CartDao.getInstance();
		int result = cartdao.orderCart(id, proPrice, deliFee, price, deliway, payway, etc);
		if(result !=0 && result != -1){
			out.println("<script>alert('결제 완료되었습니다'); location.href='cart.jsp';</script>");		
		}

	%>
</body>
<script></script>
</html>