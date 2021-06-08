<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.dao.BoardDao" %>
<%@ page import="com.hk.jsp.vo.BoardVo" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
</head>
<style></style>
<body>

	<%
		String no = request.getParameter("no");
		BoardDao bodao = BoardDao.getInstance();
		bodao.delBoard(no);		
		response.sendRedirect("noticelist.jsp");
	%>
</body>
<script>

</script>
</html>