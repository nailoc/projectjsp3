<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<%@ page import="com.hk.jsp.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
if(session.getAttribute("userid") == null) {
	out.print("<script>alert('로그인이 필요합니다!');</script>");
	response.sendRedirect("login.jsp");
} else {
	MemberDao mem = MemberDao.getInstance();
	String id = (String)session.getAttribute("userid");
	String email = request.getParameter("email");
	mem.Modify_email(id, email);
	out.print("<script>alert('변경완료!'); location.href='userinfo.jsp';</script>");

}
%>
</body>
<script></script>
</html>