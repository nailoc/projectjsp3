<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style_guide.css"></link>

</head>
<body>

	<%@ include file="header.jsp" %>

	<%
		String no = request.getParameter("no");
		BoardDao bodao = BoardDao.getInstance();
		
		int result = bodao.delBoard(no);
			if(result==1) {
				out.println("<script>alert('글삭제 성공'); location.href='noticelist.jsp'; </script>");
			} else {
				out.println("<script>alert('글삭제 실패'); location.href='noticelist.jsp'; </script>");
			}
		 
	%>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>