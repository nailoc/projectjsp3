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
		String passwd = request.getParameter("pwd");
		ProDao prodao = ProDao.getInstance();		
		String pwd = prodao.chkPwd(revno);
				
		if(passwd.equals(pwd)) {
			int result = prodao.delPRV(revno);
			if(result==1) {
				out.println("<script>alert('글삭제 성공'); location.href='prolist.jsp'; </script>");
			} else {
				out.println("<script>alert('글삭제 실패'); location.href='prolist.jsp'; </script>");
			}
		} else {
			out.println("<script>alert('비밀번호가 다릅니다'); location.href='prolist.jsp'; </script>");
		}
	%>

</body>
<script>

</script>
</html>