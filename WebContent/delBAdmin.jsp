<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String no = request.getParameter("no");
		BoardDao bodao = BoardDao.getInstance();
		
		int result = bodao.delBoard(no);
			if(result==1) {
				out.println("<script>alert('�ۻ��� ����'); location.href='noticelist.jsp'; </script>");
			} else {
				out.println("<script>alert('�ۻ��� ����'); location.href='noticelist.jsp'; </script>");
			}
		 
	%>
	
</body>
</html>