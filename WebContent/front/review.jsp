<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀프로젝트</title>
<link rel="stylesheet" href="../css/style_review.css"></link>
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
						<col style="width:60px">
						<col>
						<col style="width:100px">
						<col style="width:80px">
						<col style="width:60px">
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
				</table>
				
				<div class="product_review">
					<div class="gallery">
						<ul>
							<li style="width:25%">
								<div class="gallery_list">
									<div class="image">
										<a href="">
											<img src="images/TOMMY HILFIGER_102702R805718.jpg" alt="이미지">
										</a>
									</div>
									<div class="gallery_info">
										<div class="star">
											<span><img src="images/icon_star_fill.png" alt="별다섯개"></span>
										</div>
										<div class="title">
											<a href="">
												<strong>깔끔하고, 정말 고급스러운 안경테입니다</strong>
												<img src="images/icon_board_hot.png" alt="인기글">
											</a>
										</div>
										<div class="name_day">
											<span class="name">네이버페이 구매자</span>
											<span class="day">2020.03.01</span>
										</div>
										<div class="view">
											<span>조회 208</span>
										</div>
									</div>
								</div>
							</li>
							
							<li style="width:25%">
								<div class="gallery_list">
									<div class="image">
										<a href="">
											<img src="images/HUGOBOSS_200971WCN63IR.jpg" alt="이미지">
										</a>
									</div>
									<div class="gallery_info">
										<div class="star">
											<span><img src="images/icon_star_fill.png" alt="별다섯개"></span>
										</div>
										<div class="title">
											<a href="">
												<strong>이제품 다른색상쓰는데 면세에만 잇엇어서 구하고싶은데.....</strong>
												<img src="images/icon_board_attach_img.png" alt="이미지첨부">
												<img src="images/icon_board_hot.png" alt="인기글">
											</a>
										</div>
										<div class="name_day">
											<span class="name">네이버페이 구매자</span>
											<span class="day">2019.09.25</span>
										</div>
										<div class="view">
											<span>조회 413</span>
										</div>
									</div>
								</div>
							</li>
							
							<li style="width:25%">
								<div class="gallery_list">
									<div class="image">
										<a href="">
											<img src="images/GIVENCHY_200144YB761T4.jpg" alt="이미지">
										</a>
									</div>
									<div class="gallery_info">
										<div class="star">
											<span><img src="images/icon_star_fill.png" alt="별다섯개"></span>
										</div>
										<div class="title">
											<a href="">
												<strong>배송이 무지 빨라요.</strong>
												<br>
												<img src="images/icon_board_attach_img.png" alt="이미지첨부">
												<img src="images/icon_board_hot.png" alt="인기글">
											</a>
										</div>
										<div class="name_day">
											<span class="name">네이버페이 구매자</span>
											<span class="day">2019.08.08</span>
										</div>
										<div class="view">
											<span>조회 442</span>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="number">
					<ul>
						<li>
							<span>1</span>
						</li>
					</ul>
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
				
				<div class="write">
					<button type="button" onclick="move();">
						<strong>글쓰기</strong>
					</button>
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
	
	function move() {
		location.href='review_write.jsp';
	}
</script>
</html>