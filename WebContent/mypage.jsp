<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style_introduce.css"></link>
<link rel="stylesheet" href="css/style_mypage.css"></link>
<style>
</style>
</head>
<body>
<%@ include file="header.jsp" %>

<%
if(session.getAttribute("userid") == null) {
	out.println("<script> alert('로그인이 필요합니다!'); location.href='login.jsp';</script>");
}
else {
%>
 
<div class="middle_contents">
<h3>마이페이지</h3>

<button onclick="location.href='userinfo.jsp'">회원정보</button>
<button onclick="location.href='delete.jsp'">회원탈퇴</button>
<button onclick="location.href='logout.jsp'">로그아웃</button>
<button onclick="location.href='cart.jsp'">장바구니</button>
<button onclick="location.href='order.jsp'">구매내역</button>

<%
String id = (String)session.getAttribute("userid");
if(id.equals("admin")) {
%>

<button onclick="location.href='admin.jsp'">회원관리</button>
<%	} }%>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>