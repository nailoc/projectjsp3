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
<link rel="stylesheet" href="css/style.css"></link>
</head>
<style></style>
<body>
	

	<%
	
	// 파일을 업로드 하는 경우 cos.jar 사용해서 전송값 저장
	String uploadPath = "C:\\Users\\zhekq\\git\\projectjsp3\\WebContent\\upload";
	int maxSize = 1024*1024*10;	// 10메가
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize,
			"UTF-8", new DefaultFileRenamePolicy());

	String proname = multi.getParameter("proname");
	String title = multi.getParameter("title");
	String writeName = multi.getParameter("writer");
	String password = multi.getParameter("passwd");
	String score = multi.getParameter("score");
	String ck_contents = multi.getParameter("contents");
	String upfileName = multi.getFilesystemName("attach1");
	int scores = Integer.parseInt(score);

	// 데이터베이스에 저장
	ProReviewVo writeVo = new ProReviewVo();
	
	writeVo.setPno(proname);
	writeVo.setTitle(title);
	writeVo.setId(writeName);
	writeVo.setPasswd(password); 
	writeVo.setContents(ck_contents);
	writeVo.setAttach1(upfileName);	
	writeVo.setScore(scores);
	
	ProDao prodao = ProDao.getInstance();
	int result = prodao.saveBoard(writeVo);
	
	if(result==1) {
		out.println("<script>alert('글저장 성공'); location.href='prolist.jsp'; </script>");
	} else {
		out.println("<script>alert('글저장 실패'); location.href='proviewwrite.jsp'; </script>");
	}
	
	%>
</body>
<script>

</script>
</html>