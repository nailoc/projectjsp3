<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="com.hk.jsp.util.*" %>
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
	String qnano = request.getParameter("qnano");
	
	ProQnaDao proqnadao = ProQnaDao.getInstance();
	
	ProQnaVo rowshow = proqnadao.getProQnaByNo(qnano);
	
	int rst = proqnadao.delAnswer(qnano);
	
	if(rst==1) {
		out.println("<script>alert('성공'); location.href='proqnalist.jsp'; </script>");
	} else {
		out.println("<script>alert('실패'); location.href='proqnalist.jsp'; </script>");
	} 
	
	%>

</body>
<script>

</script>
</html>