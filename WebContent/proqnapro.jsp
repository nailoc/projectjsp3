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
		String proname = request.getParameter("proname");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String passwd = request.getParameter("passwd");
		String contents = request.getParameter("contents");
		
		ProQnaVo writeVo = new ProQnaVo();
		
		writeVo.setPno(proname);
		writeVo.setTitle(title);
		writeVo.setId(writer);
		writeVo.setPasswd(passwd); 
		writeVo.setContents(contents);
		
		ProQnaDao proqnadao = ProQnaDao.getInstance();
		int result = proqnadao.saveBoard(writeVo);
		
		if(result==1) {
			out.println("<script>alert('글저장 성공'); location.href='proqnalist.jsp'; </script>");
		} else {
			out.println("<script>alert('글저장 실패'); location.href='proqna.jsp'; </script>");
		}
		
	%>
	
</body>
<script>

</script>
</html>