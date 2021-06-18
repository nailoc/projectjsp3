<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate(); 
		out.println("<script>	alert('로그아웃!');</script>");
		response.sendRedirect("login.jsp");
	%>
</body>
</html>