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
<h2>상품문의</h2>

	<form id="frm_write" method="GET" action="proqnapro.jsp">
		
		<p>상품명</p>
		<input type="text" id="proname" name="proname" value="">  
		<p>제목</p>      
		<input type="text" id="title" name="title" value="">
		<p>ID (작성자)</p> 
		<input type="text" id="writer" name="writer" value="">
		<p>비밀번호</p> 
		<input type="password" id="passwd" name="passwd" value="">      
		<p>상세내용</p>
		<textarea style="height:250px" cols="40" name="contents" id="contents"></textarea>		
		
			<div class="left">
				<button type="button" onclick="history.back();">돌아가기</button>
			</div>
			
			<div class="right">
				<button type="button" onclick="bbs_write();">저장하기</button>
			</div>		    
		      
	</form>

</body>
<script>

function bbs_write() {
	
	proname = document.getElementById("proname").value;
	title = document.getElementById("title").value;
	writer = document.getElementById("writer").value;
	passwd = document.getElementById("passwd").value;
	
	if(proname=="") {
		alert("상품명을 입력하세요");
		return;
	}
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