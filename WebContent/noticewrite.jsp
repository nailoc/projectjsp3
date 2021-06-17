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

	<h2>공지사항 작성</h2>

	<form class="iboard-form" id="frm_write" method="POST" action="noticewritepro.jsp"
		      enctype="multipart/form-data"> 
		      
		<p>제목</p>      
		<input type="text" id="title" name="title" value="">
		<p>ID (작성자)</p> 
		<input type="text" id="writer" name="writer" value="">
		<p>비밀번호</p> 
		<input type="password" id="passwd" name="passwd" value="">      
		<p>상세내용</p>
		<textarea style="height:250px" cols="40" name="contents" id="contents"></textarea>
		<p>첨부파일</p>     
		<input type="file" id="attach1" name="attach1" value="">		 
		
		
			<div class="left">
				<button type="button" onclick="history.back();">돌아가기</button>
			</div>
			
			<div class="right">
				<button type="button" onclick="bbs_write();">저장하기</button>
			</div>		    
		      
	</form>

</body>
<script>

CKEDITOR.replace('iboard_content');

function bbs_write() {
	
	title = document.getElementById("title").value;
	writer = document.getElementById("writer").value;
	passwd = document.getElementById("passwd").value;
	
	if(title=="") {
		alert("제목을 입력하세요");
		return;
	}
	if(writer=="") {
		alert("작성자를 입력하세요");
		return;
	}
	if(passwd=="") {
		alert("비밀번호를 입력하세요");
		return;
	}
	
	frm = document.getElementById("frm_write");
	frm.submit();
}


</script>
</html>