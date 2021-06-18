<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀프로젝트</title>
<link rel="stylesheet" href="../css/style_event.css"></link>
<style></style>
</head>
<body>

	<%@ include file="header.jsp" %>
	
	<div class="middle-contents">
		
		<div class="board">
			<div class="board_title">
				<h2>이벤트 & 갤러리</h2>
			</div>
			<div class="board_list">
				<table class="board_table" style="width:100%">
					<colgroup>
						<col style="width:6%">
						<col style="width:37%">
						<col style="width:12%">
						<col style="width:7%">
						<col style="width:15%">
						<col style="width:6%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>작성자</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				
				<div class="board_list_no">
					게시글이 존재하지 않습니다.
				</div>
				
				<div class="board_search">
					<select>
						<option value="subject">제목</option>
						<option value="contents">내용</option>
						<option value="writer">작성자</option>
					</select>
					<input type="text" >
					<button class="btn">검색</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer.jsp" %>
		
</body>
<script src="js/jquery-3.6.0.min.js"></script>
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
</script>
</html>