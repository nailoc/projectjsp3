<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
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
	String revno = request.getParameter("revno");
	ProDao prodao = ProDao.getInstance();
	
	int result = prodao.delPRV(revno);
	
	if(result==1) {
		out.println("<script>alert('삭제 성공 (관리자)'); location.href='prolist.jsp'; </script>");
	} else {
		out.println("<script>alert('삭제 실패 (관리자)'); location.href='prolist.jsp'; </script>");
	}
	
	%>
	
</body>
<script>

</script>
</html>