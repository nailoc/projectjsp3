<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
		String id = request.getParameter("idck");
		MemberDao memdao = MemberDao.getInstance();
		int result = memdao.delMember(id);
		out.print("<script>alert('회원 탈퇴 되었습니다.'); location.href='admin.jsp'</script>"); }
%>
</body>
<script></script>
</html>