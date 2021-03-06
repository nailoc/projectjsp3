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
<link rel="stylesheet" href="css/style_write.css"></link>
</head>
<style></style>
<body>

	<%@ include file="header.jsp" %>


	<div class="middle-contents">		
		<div class="board">
			<div class="board_title"> 
				<h2>상품문의</h2>
			</div>
			
			
	<form id="frm_write" method="GET" action="proqnapro.jsp">
			
			<div class="board_list">
				<table class="board_table" style="width:100%">
					<colgroup>
						<col style="width:15%">
						<col style="width:85%">
					</colgroup>
					<tbody>
						<tr>
							<th>상품명</th>
							<td>
								<div class="goods_select">
								<input type="text" id="proname" name="proname" value="">  
								</div>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" id="title" name="title" value="">
							</td>
						</tr>
						<tr>
							<th>ID (작성자)</th>
							<td>
								<input type="text" id="writer" name="writer" value="">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" id="passwd" name="passwd" value="">
							</td>
						</tr>										
						<tr>
							<th>상세내용</th>
							<td>						
								<textarea cols="30" rows="10" name="contents" id="editor"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			
			</div>
			
				</form>
				
			</div>		
		
		<div class="button">
				<button type="button" onclick="history.back();" class="before">돌아가기</button>
				<button type="button" onclick="bbs_write();" class="save">저장하기</button>
		</div>


	</div>

	<%@ include file="footer.jsp" %>

</body>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/ckeditor.js"></script>
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

$(document).ready(function(){
	$("ul.menu li").hover(
		function(){ 
			$('ul:not(:animated)',this).stop().show();
		},
		function(){ 
			$('ul',this).stop().hide();
		}
	);
});

CKEDITOR.replace('editor');

</script>
</html>