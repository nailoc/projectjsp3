<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="com.hk.jsp.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
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
	
	// 파일을 업로드 하는 경우 cos.jar 사용해서 전송값 저장
	// "C:\\Users\\zhekq\\git\\projectjsp3\\WebContent\\upload";

	String uploadPath = "C:\\Users\\zhekq\\git\\projectjsp3\\WebContent\\upload";
	int maxSize = 1024*1024*10;	// 10메가
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize,
			"UTF-8", new DefaultFileRenamePolicy());
	
	String title = multi.getParameter("title");
	String writeName = multi.getParameter("writer");
	String password = multi.getParameter("passwd");
	String ck_contents = multi.getParameter("contents");
	String upfileName = multi.getFilesystemName("attach1");

	// 데이터베이스에 저장
	BoardVo writeVo = new BoardVo();
			
	writeVo.setTitle(title);
	writeVo.setWriter(writeName);
	writeVo.setPasswd(password); 
	writeVo.setContents(ck_contents);
	writeVo.setAttach1(upfileName);	
	
	BoardDao brddao = BoardDao.getInstance();
	int result = brddao.saveBoard(writeVo);
	
	if(result==1) {
		out.println("<script>alert('글저장 성공'); location.href='noticelist.jsp'; </script>");
	} else {
		out.println("<script>alert('글저장 실패'); location.href='noticewrite.jsp'; </script>");
	}
	
	%>
	
	<%@ include file="footer.jsp" %>	
	
</body>
<script>

</script>
</html>