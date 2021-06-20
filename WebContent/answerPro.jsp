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
<link rel="stylesheet" href="css/style_guide.css"></link>

</head>
<style></style>
<body>

	<%@ include file="header.jsp" %>

	<%
	String qnano = request.getParameter("qnano");
	String cont = request.getParameter("coments");
	
	ProQnaDao proqnadao = ProQnaDao.getInstance();
	
	ProQnaVo rowshow = proqnadao.getProQnaByNo(qnano);
	int rst = proqnadao.saveAnswer(cont,qnano);
	
	if(rst==1) {
		out.println("<script>alert('성공'); location.href='proqnalist.jsp'; </script>");
		} else {
			out.println("<script>alert('실패'); location.href='proqnalist.jsp'; </script>");
		} 
	
	
	%>

	<%@ include file="footer.jsp" %>

</body>
<script>

</script>
</html>