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
String name = request.getParameter("name");
MemberDao memdao = MemberDao.getInstance();
String searchid = memdao.ScId(email, name);

%>
<%= searchid %>
</body>
<script></script>
</html>