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
		String no = request.getParameter("no");
		String passwd = request.getParameter("pwd");
		BoardDao bodao = BoardDao.getInstance();		
		String pwd = bodao.chkPwd(no);
				
		if(passwd.equals(pwd)) {
			int result = bodao.delBoard(no);
			if(result==1) {
				out.println("<script>alert('글삭제 성공'); location.href='noticelist.jsp'; </script>");
			} else {
				out.println("<script>alert('글삭제 실패'); location.href='noticelist.jsp'; </script>");
			}
		} else {
			out.println("<script>alert('비밀번호가 다릅니다'); location.href='noticelist.jsp'; </script>");
		}
	%>

</body>
<script>

</script>
</html>