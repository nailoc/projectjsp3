<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	if(session.getAttribute("userid") == null) {
		out.println("<script> alert('로그인이 필요합니다!'); location.href='login.jsp';</script>");
	} else{
		session.invalidate(); 
		out.println("<script>	alert('로그아웃!');</script>");
		response.sendRedirect("login.jsp");}
	%>
</body>
</html>