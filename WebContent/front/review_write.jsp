<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀프로젝트</title>
<link rel="stylesheet" href="../css/style_write.css"></link>
<style></style>
</head>
<body>
<!-- 상단 콘텐츠 -->
	
	<%@ include file="header.jsp" %>
		
	<div class="middle-contents">
		
		<div class="board">
			<div class="board_title">
				<h2>상품후기</h2>
			</div>
			<div class="board_list">
				<table class="board_table" style="width:100%">
					<colgroup>
						<col style="width:15%">
						<col style="width:85%">
					</colgroup>
					<tbody>
						<tr>
							<th>작성자</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password">
							</td>
						</tr>
						<tr>
							<th>상품선택</th>
							<td>
								<div class="goods_select">
									<span>선택된 상품이 없습니다.</span>
									<a href="">상품 선택</a>
								</div>
							</td>
						</tr>
						<tr>
							<th>평가</th>
							<td>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>본문</th>
							<td>
								<div class="secret">
									<input type="checkbox">
									<label>비밀글</label>
								</div>
								<textarea id="editor" cols="30" rows="10"></textarea>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<input type="text">
								<input type="file">
							</td>
						</tr>
						<tr>
							<th>자동등록방지</th>
							<td>
								
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
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
			<button type="button" class="before"><strong>이전</strong></button>
			<button type="submit" class="save"><strong>저장</strong></button>
		</div>
		
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/ckeditor.js"></script>
<script>
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