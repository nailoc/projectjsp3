<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<%@ page import="com.hk.jsp.dao.*"%>
<%@ page import="com.hk.jsp.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
String email = request.getParameter("email");
String id = request.getParameter("id");
MemberDao memdao = MemberDao.getInstance();
String searchpw = memdao.ScPw(id, email);

out.print("비밀번호 찾기");
out.print(searchpw);
%>

	
</body>
<script></script>
</html>