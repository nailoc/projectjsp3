<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀프로젝트</title>
<link rel="stylesheet" href="../css/style_guide.css"></link>
<style></style>
</head>
<body>
<!-- 상단 콘텐츠 -->
	
	<%@ include file="header.jsp" %>
		
	<div class="middle-contents">
		
		<div class="board">
			<div class="search_question">
				<div class="search_left">
					<h2>자주묻는 질문 검색</h2>
						<input type="text" placeholder="검색어를 입력하세요">
						<button type="submit">검색</button>
				</div>						
				<div class="search_right">
					<p><strong>찾으시는 질문이 없다면?</strong></p>
					<p><span><a href="guide_write.jsp">1:1 문의하기</a></span></p>
				</div>
			</div>	
			
			<div class="board_list">
				<h3>FAQ</h3>
				
				<div class="title_list">
					<ul>
						<li><a href="" class="none">전체</a></li>
						<li><a href="">회원가입/정보</a></li>
						<li><a href="">결제/배송</a></li>
						<li><a href="">교환/반품/환불</a></li>
						<li><a href="">마일리지 적립</a></li>
						<li><a href="">기타</a></li>
					</ul>
				</div>
				
				<table class="board_table" style="width:100%">
					<colgroup>
						<col style="width:67px">
						<col style="width:144px">
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>내용</th>
						</tr>
					</thead>
				</table>
				
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