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
				<h2>상품후기</h2>
			</div>
			
			
	<form id="frm_write" method="POST" action="provWpro.jsp"
		enctype="multipart/form-data">
			
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
							<th>평가</th>
							<td>
							<input type="radio" name="score" value="5">★ ★ ★ ★ ★ <br/>
							<input type="radio" name="score" value="4">☆ ★ ★ ★ ★ <br/>
							<input type="radio" name="score" value="3">☆ ☆ ★ ★ ★ <br/>
							<input type="radio" name="score" value="2">☆ ☆ ☆ ★ ★ <br/>
							<input type="radio" name="score" value="1">☆ ☆ ☆ ☆ ★ <br/>
							</td>
						</tr>						
						<tr>
							<th>상세내용</th>
							<td>						
								<textarea cols="30" rows="10" name="contents" id="editor"></textarea>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<input type="file" id="attach1" name="attach1" value="">
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			
			</form>
			
		</div>
		
		<div class="agree">
			<h5>비회원 개인정보 수집동의</h5>
			<textarea cols="30" rows="5">
			- 수집항목: 이름, 전화번호, 이메일주소 -수집/이용목적: 게시글 접수 및 결과 회신
			- 이용기간: 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.
			단, 관계법령의 규정에 의하여 보전할 필요가 있는 경우 일정기간 동안 개인정보를 보관할 수 있습니다.
			그 밖의 사항은 (주) 000 개인정보처리방침을 준수합니다.
			</textarea>
		</div>
		
		<div class="agree_check">
			<input type="checkbox">
			<label>비회원 글작성에 대한 개인정보 수집 및 이용동의</label>
			<a href="">전체보기 ></a>
		</div>
		
		<div class="button">
			<div class="left">
				<button type="button" onclick="history.back();" class="before">돌아가기</button>
			</div>
			
			<div class="right">
				<button type="button" onclick="bbs_write();" class="save">저장하기</button>
			</div>
		</div>
		
	</div>	

	<%@ include file="footer.jsp" %>

</body>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/ckeditor.js"></script>
<script>

function bbs_write() {
	var i =0;
	score = document.getElementsByName("score");
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
	
	for(i=0; i<score.length; i++) {
		
		if(score[i].checked==true) {
			break;
		} else if(score[0].checked==false&&score[1].checked==false&&
				score[2].checked==false&&score[3].checked==false&&
				score[4].checked==false) {
			alert("별점을 선택하세요");
			return;
		}
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