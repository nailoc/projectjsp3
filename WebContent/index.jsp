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
<title>메인페이지</title>
<link rel="stylesheet" href="css/style_index.css"></link>
</head>
<style></style>
<body>
	<div class="mainContainerBox">
		<div class="slideImgBox">
			<div class="slideImgNav">
				<ul>
					<li><a href="">펜디 FENDI</a></li>
					<li><a href="">디올 DIOR</a></li>
					<li><a href="">지미추 JIMMY CHOO</a></li>
					<li><a href="">지방시 GIVENCHY</a></li>
					<li><a href="">막스마라 MAXMARA</a></li>
				</ul>
			</div>
			<div class="slideImg slideFendi">
				<div>
					<h2>FENDI</h2>
					<h3>
					펜디(FENDI)는 전세계의 모든 연령층에서<br>
					가장 오랜 기간, 가장 많은 사랑을 받고 있는<br>
					대표적인 브랜드입니다.
					<a href="">전체 상품 보기</a>
					</h3>
				</div>
				<img src="images/index/slideFendi.jpg" style="height:750px;">
			</div>
		</div>
		
		<div class="mainContainer">
			<div class="slideEventBox">
				<div style="padding-left:15px; margin-bottom:15px;"><span style="font-size:24px; font-weight:bold;">이달의 이벤트</span> &nbsp;<span>MONTHLY EVENT</span></div>
				<a class="eventButton eventLeft" href="">&#10094;</a>
				<a class="eventButton eventRight" href="">&#10095;</a>
				<div class="slideEventList">
					<div class="slideEvent">
						<a href="" class="" style="background:url('images/index/eventCarrera.jpg') no-repeat; background-size:416px;"></a>
						<div class="eventText">
							<p class="eventTitle">CARRERA</p>
							<p class="eventContent">까레라 모든 상품 보기
						</div>
					</div>
					
					<div class="slideEvent">
						<a href="" class="" style="background:url('images/index/eventPolaroid.jpg') no-repeat; background-size:416px;"></a>
						<div class="eventText">
							<p class="eventTitle">POLAROID</p>
							<p class="eventContent">폴라로이드 모든 상품 보기
						</div>
					</div>
					
					<div class="slideEvent">
						<a href="" class="" style="background:url('images/index/eventJimmychoo.jpg') no-repeat; background-size:416px;"></a>
						<div class="eventText">
							<p class="eventTitle">JIMMY CHOO</p>
							<p class="eventContent">지미추 모든 상품 보기
						</div>
					</div>
				</div> 
			</div> <!-- slideEventBox end -->

			<div class="slideNewBox">
				<div style="padding-left:15px; margin-bottom:15px;"><p style="font-size:24px; font-weight:bold;">이달의 신상품</p><p>MONTHLY NEW GOODS</p></div>
				<a class="newButton newLeft" href="">&#10094;</a>
				<a class="newButton newRight" href="">&#10095;</a>
				<div class="slideEventList">
					<div class="slideNew">
						<a href="" class="" style="background:url('images/index/eventCarrera.jpg') no-repeat; background-size:416px;"></a>
					</div>
					
					<div class="slideNew">
						<a href="" class="" style="background:url('images/index/eventPolaroid.jpg') no-repeat; background-size:416px;"></a>
					</div>
					
					<div class="slideNew">
						<a href="" class="" style="background:url('images/index/eventJimmychoo.jpg') no-repeat; background-size:416px;"></a>
					</div>
					
					<div class="slideNew">
						<a href="" class="" style="background:url('images/index/eventJimmychoo.jpg') no-repeat; background-size:416px;"></a>
					</div>
				</div> 
			</div> <!-- newItemBox end -->

			<div class="weekItemBox">
				<h2>주간 판매 베스트</h2>
				<ul class="weekList">
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			
			<div class="slideImg2Box">
			</div>
			
			<div class="glassesItemBox">
				<h2>안경테</h2>
				<ul class="glassesList">
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
		</div>
		
	</div>
</body>
<script>

</script>
</html>