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
<!-- 상단 콘텐츠 -->
	
	<%@ include file="header.jsp" %>
		
	<div class="middle-contents">
		
		<div class="board">
			<div class="board_title">
				<h2>공지사항</h2>
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
						<tr>
							<td><img src="images/icon_board_notice.png" alt="공지"></td>
							<td><a href=""><strong>[무이자할부] 투페이스 - 신용카드 무이자 할부 이용안내</strong></a></td>
							<td>2019.06.12</td>
							<td>관리자</td>
							<td>948</td>
						</tr>
						<tr>
							<td>8</td>
							<td><a href="">
								<strong>[휴무안내] 10월 9일 한글날 휴무로 상담과 배송이 중단됩니다.</strong> 
								<img src="images/icon_board_attach_img.png" alt="이미지첨부">
							</a></td>
							<td>2020.10.08</td>
							<td>관리자</td>
							<td>79</td>
						</tr>
						<tr>
							<td>7</td>
							<td><a href="">
								<strong>[휴무안내] 9월 29일(화) ~ 10월 4일(일) 추석 휴무로 상담과 배송이 중단됩니다.</strong> 
								<img src="images/icon_board_attach_img.png" alt="이미지첨부">
							</a></td>
							<td>2020.09.21</td>
							<td>관리자</td>
							<td>93</td>
						</tr>
						<tr>
							<td>6</td>
							<td><a href="">
								<strong>[휴무안내] 4월 30일(목) ~ 5월 5일(화) 6일간 전체 휴무로 상담과 배송이 중단됩니다.</strong> 
								<img src="images/icon_board_attach_file.png" alt="파일첨부"> 
								<img src="images/icon_board_hot.png" alt="인기글">
							</a></td>
							<td>2020.04.22</td>
							<td>관리자</td>
							<td>191</td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="">
								<strong>[배송공지] 크리스마스 & 연말연시 관련 배송안내</strong>
								<img src="images/icon_board_attach_file.png" alt="파일첨부"> 
								<img src="images/icon_board_hot.png" alt="인기글">
							</a></td>
							<td>2019.12.23</td>
							<td>관리자</td>
							<td>222</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="">
								<strong>[배송공지] 개천절 및 한글날 배송관련 안내</strong>
								<img src="images/icon_board_attach_file.png" alt="파일첨부"> 
								<img src="images/icon_board_hot.png" alt="인기글">	
							</a></td>
							<td>2019.10.01</td>
							<td>관리자</td>
							<td>266</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="">
								<strong>[배송공지] 2019년 추석 명절 관련 배송안내</strong>
								<img src="images/icon_board_attach_file.png" alt="파일첨부"> 
								<img src="images/icon_board_hot.png" alt="인기글">	
							</a></td>
							<td>2019.08.30</td>
							<td>관리자</td>
							<td>307</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="">
								<strong>[하계휴무 공지] 8월 15일 ~ 8월 18일까지 하계 휴무로 모든 업무가 중단됩니다.</strong>
								<img src="images/icon_board_attach_file.png" alt="파일첨부"> 
								<img src="images/icon_board_hot.png" alt="인기글">
							</a></td>
							<td>2019.08.14</td>
							<td>관리자</td>
							<td>300</td>
						</tr>
						<tr>
							<td><img src="images/icon_board_notice.png" alt="공지"></td>
							<td><a href="">
								<strong>[무이자할부] 투페이스 - 신용카드 무이자 할부 이용안내</strong>
								<img src="images/icon_board_attach_img.png" alt="이미지첨부"> 
								<img src="images/icon_board_hot.png" alt="인기글">
							</a></td>
							<td>2019.06.12</td>
							<td>관리자</td>
							<td>948</td>
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