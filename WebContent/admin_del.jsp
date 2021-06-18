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
		String id = request.getParameter("idck");
		MemberDao memdao = MemberDao.getInstance();
		int result = memdao.delMember(id);
		out.print("<script>alert('회원 탈퇴 되었습니다.'); location.href='admin.jsp'</script>");
%>
</body>
<script></script>
</html>