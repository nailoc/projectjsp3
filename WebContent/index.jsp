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
<link rel="stylesheet" href="css/style.css"></link>
</head>
<style>
	.mainContainerBox {
		padding: 0;
		margin: 0;
	}
	
	.slideImgBox {
		height: 540px;
		position: relative;
		border-bottom: 1px solid lightgray;
		margin-bottom: 80px;
	}
	.slideImg {
		position: relative;
		/*z-index: -2;*/
		transform: translate(-107px, -210px);
	}
	.slideImgNav {
		position: absolute;
		bottom: 0;
		left: 50%;
		z-index: 5;
		transform: translateX(-50%);
	}
	.slideImgNav>ul {
		list-style: none;
		width: 852px;
		height: 54px;
		border: 1px solid lightgray;
		border-width: 1px 0 0 1px;
		margin: 0;
		background-color: #fff;
		padding-left: 0;
		position: relative;
	}
	.slideImgNav>ul li {
		float: left;
		width: 169.4px;
		height: 100%;
		border-right: 1px solid lightgray;
	}
	.slideImgNav>ul li a {
		display: block;
		width: 100%;
		height: 100%;
		text-align: center;
		line-height: 54px;
		text-decoration: none;
		color: #777;
		font-size: 13px;
	}
	.slideImgNav>ul li a:hover {
		color: #33353d;
		font-weight: bold;
	}
	.slideImg div {
		position: absolute;
		top: 330px;
		left: 230px;
	}
	.slideImg div h3 {
		color: #555;
	}
	.slideImg div a {
		display: block;
		text-decoration: none;
		margin-top: 40px;
		width: 200px;
		height: 55px;
		text-align: center;
		background-color: #343434;
		color: #fff;
		line-height: 55px;
		
	}
	
	
	/* 메인 */
	.mainContainer {
		width: 1250px;
		margin: 0 auto;
	}
	
	/* 이벤트슬라이드 */
	.slideEventBox {
		height: 312px;
		margin-bottom: 60px;
		position: relative;
	}
	.slideEvent {
		position: relative;
		width: 416px;
		height: 312px;
		box-sizing: border-box;
		float: left;
		padding-left: 15px;
	}
	.slideEvent a {
		display: block;
		width: 100%;
		height: 238px;
		background-color: orange;
	}
	.eventText {
		background-color: #fff;
		position: absolute;
		left: 50%;
		transform: translateX(-48%);
		width: 334px;
		height: 87px;
		bottom: 22px;
		text-align: center;
	}
	.eventText p.eventTitle {
		font-weight: 600;
		font-size: 16px;
	}
	.eventText p.eventContent {
		color: #777;
	}
	a.eventButton {
		display: block;
		width: 52px;
		height: 52px;
		position: absolute;
		background-color: rgb(255,255,255, 0.5);
		z-index: 5;
		border: 1px solid gray;
		text-align: center;
		line-height: 52px;
		font-size: 22px;
		top: 50%;
		transform: translateY(-50%);
		text-decoration: none;
		color: #111;
	}
	a.eventButton:hover {
		 background-color: rgb(255,255,255, 1);
	}
	a.eventLeft {
		left: -20px;
	}
	a.eventRight {
		right: -20px;
	}
	
	
	
	/* 신상 */
	.newItemBox {
		height: 420px;
		background-color: blue;
	}
	
	/* 주간 베스트 */
	.weekItemBox {
		min-height: 200px;
		background-color: red;
		text-align: center;
	}
	ul.weekList {
		list-style: none;
		overflow: auto;
		border: 1px solid black;
		padding-left: 25px;
	}
	ul.weekList li {
		width: 600px;
		height: 302px;
		border-sizing: border-box;
		background-color: pink;
		float: left;
	}
	
	/* 슬라이드 이미지 */
	div.slideImg2Box {
		width: 2000px;
		height: 450px;
		margin: 0 auto;
		background-color: green;
		transform: translateX(-375px);
	}
	
	/* 안경테 */
	div.glassesItemBox {
		min-height: 200px;
		background-color: red;
		text-align: center;
	}
	ul.glassesList {
		list-style: none;
		overflow: auto;
		padding-left: 0px;
	}
	ul.glassesList li {
		width: 312.5px;
		height: 408.5px;
		border-sizing: border-box;
		background-color: pink;
		float: left;
	}
</style>
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
			</div>

			<div class="newItemBox">
				
			</div>

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