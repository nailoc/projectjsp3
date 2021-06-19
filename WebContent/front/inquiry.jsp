<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀프로젝트</title>
<link rel="stylesheet" href="../css/style_inquiry.css"></link>
<style></style>
</head>
<body>
<!-- 상단 콘텐츠 -->
	
	<%@ include file="header.jsp" %>
		
	<div class="middle-contents">
		
		<div class="board">
			<div class="board_title">
				<h2>상품문의</h2>
			</div>
			
			<div class="date_check">
				<h3>조회기간</h3>
				<div class="check_list">
					<button type="button">오늘</button>
					<button type="button">7일</button>
					<button type="button">15일</button>
					<button type="button">1개월</button>
					<button type="button">3개월</button>
					<button type="button">1년</button>
				</div>
				<div class="check_list2">
					<input type="text">
					~
					<input type="text">
				</div>
				<button type="submit">
					조회
				</button>
			</div>
			
			<div class="board_list">
				<table class="board_table" style="width:100%">
					<colgroup>
						<col style="width:10%">
						<col style="width:15%">
						<col>
						<col style="width:10%">
						<col style="width:10%">
					</colgroup>
					<thead>
						<tr>
							<th>문의날짜</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>문의상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2020.11.25</td>
							<td>[상품]</td>
							<td><a href="">
								<img src="images/icon_board_secret.png">
								<strong>막스마라안경</strong>
								<img src="images/icon_board_attach_file.png">
							</a></td>
							<td>김문금</td>
							<td>답변완료</td>
						</tr>
					</tbody>
				</table>
				
				<div class="number">
					<ul>
						<li>
							<span>1</span>
						</li>
					</ul>
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