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
<link rel="stylesheet" href="css/style_accessory.css"></link>
</head>
<style></style>
<%
	String keyword = "";
	String kind = "";
	String bname = "";
	String sort = "regdate";
	String cPage = "1";
	ProductDao prodao = ProductDao.getInstance();
	List<ProductVo> newItems = prodao.getProductList(keyword, kind, bname, sort, cPage);
	sort = "sell_count";
	List<ProductVo> weekItems = prodao.getProductList(keyword, kind, bname, sort, cPage);
	kind = "20";
	List<ProductVo> glassesItems = prodao.getProductList(keyword, kind, bname, sort, cPage);
%>
<body>
	<%@ include file="front/header.jsp"%>
	
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
			<div class="slideImg slideFendi" style="text-align: center;">
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
				<div style="padding-left:15px; margin-bottom:15px; text-align:left;">
					<span style="font-size:24px; font-weight:bold;">이달의 이벤트</span> &nbsp;
					<span>MONTHLY EVENT</span>
				</div>
				<a class="eventButton eventLeft" href="">&#10094;</a>
				<a class="eventButton eventRight" href="">&#10095;</a>
				<div class="slideEventList">
					<div class="slideEvent">
						<a href="sunglass.jsp?bname=carrera" class="" style="background:url('images/index/eventCarrera.jpg') no-repeat; background-size:416px;"></a>
						<div class="eventText">
							<p class="eventTitle">CARRERA</p>
							<p class="eventContent">까레라 모든 상품 보기
						</div>
					</div>
					
					<div class="slideEvent">
						<a href="sunglass.jsp?bname=carrera" class="" style="background:url('images/index/eventPolaroid.jpg') no-repeat; background-size:416px;"></a>
						<div class="eventText">
							<p class="eventTitle">POLAROID</p>
							<p class="eventContent">폴라로이드 모든 상품 보기
						</div>
					</div>
					
					<div class="slideEvent">
						<a href="sunglass.jsp?bname=jimmy" class="" style="background:url('images/index/eventJimmychoo.jpg') no-repeat; background-size:416px;"></a>
						<div class="eventText">
							<p class="eventTitle">JIMMY CHOO</p>
							<p class="eventContent">지미추 모든 상품 보기
						</div>
					</div>
				</div> 
			</div> <!-- slideEventBox end -->


			<div class="slideNewBox">
				<div style="padding-left:15px; margin-bottom:15px;">
					<h2 style="margin-bottom:5px;">이달의 신상품</h2>
					<span style="color: gray;">MONTHLY NEW GOODS</span>
				</div>
				<div class="slideNewList">
					<a class="newButton newLeft" href="" style="top:145px;">&#10094;</a>
					<a class="newButton newRight" href="" style="top:145px;">&#10095;</a>
					<%
						for(int i=0; i<4; i++) {
					%>
					<div onmouseout="changeImg1(event,'<%=newItems.get(i).getMain_img1().replaceAll("\\\\","/")%>')" onmouseover="changeImg2(event,'<%=newItems.get(i).getMain_img2().replaceAll("\\\\","/")%>')">
						<a class="slideNew" href="item.jsp?pno=<%=newItems.get(i).getPno()%>">
							<!-- div class="onCursor">
								<div class="onCursorText">
									[<%=newItems.get(i).getBname() %>]<br>
									<%=newItems.get(i).getName() %><br>
									<%=String.format("%,d",newItems.get(i).getPrice()) %>원
								</div>
							</div-->
							<span id="img" class="img" style="background:url('<%=newItems.get(i).getMain_img1().replaceAll("\\\\","/")%>');" ></span>
						</a>
					</div>
					<%
						}
					%>
				</div> 
			</div> <!-- newItemBox end -->
			
			
			<div class="weekItemBox">
				<h2 style="margin-bottom:5px;">주간 판매 베스트</h2>
				<span style="color: gray;">한 주 동안 사랑을 많이 받은 제품입니다</span>
				<ul class="weekList">
					<%
						for(int i=0; i<10; i++) {
					%>
					<li>
						<div class="weekImgBox">
							<a class="weekImg" href="item.jsp?pno=<%=weekItems.get(i).getPno()%>" style="background:url('<%=weekItems.get(i).getMain_img1().replaceAll("\\\\","/")%>');" onmouseout="changeImg1(event,'<%=weekItems.get(i).getMain_img1().replaceAll("\\\\","/")%>')" onmouseover="changeImg2(event,'<%=weekItems.get(i).getMain_img2().replaceAll("\\\\","/")%>')"></a>
						</div>
						<div class="weekContentBox">
							<div>
								<span style="line-height: 30px;"><strong>[<%=weekItems.get(i).getBname() %>]</strong> <span>Safilo Group</span></span>
								<br>
								<a href="item.jsp?pno=<%=weekItems.get(i).getPno()%>" style="margin-top:20px; word-break:keep-all"><%=weekItems.get(i).getName() %></a>
							</div>
							<div><strong><%=String.format("%,d",weekItems.get(i).getPrice()) %>원</strong></div>
						</div>
					</li>
					<%
						}
					%>
				</ul>
			</div>
			
			
			<!-- Slideshow container -->
			<div class="slideshow-container">
			
				<!-- Full-width images with number and caption text -->
				<div class="mySlides fade">
					<div class="numbertext">1 / 8</div>
					<a href="sunglass.jsp?bname=fendi"><img src="images/index/fendi.jpg" style="width:100%"></a>
					<div class="text">펜디 / FENDI</div>
				</div>
			
				<div class="mySlides fade">
					<div class="numbertext">2 / 8</div>
					<a href="sunglass.jsp?bname=polaroid"><img src="images/index/polaroid.jpg" style="width:100%"></a>
				    <div class="text">폴라로이드 / POLAROID</div>
				</div>
				
				<div class="mySlides fade">
					<div class="numbertext">3 / 8</div>
				    <a href="sunglass.jsp?bname=dior"><img src="images/index/dior.jpg" style="width:100%"></a>
				    <div class="text">디올 / DIOR</div>
				</div>
				
				<div class="mySlides fade">
					<div class="numbertext">4 / 8</div>
				    <a href="sunglass.jsp?bname=jimmy"><img src="images/index/jimmy choo.jpg" style="width:100%"></a>
				    <div class="text">지미추 / JIMMY CHOO</div>
				</div>
				
				<div class="mySlides fade">
					<div class="numbertext">5 / 8</div>
				    <a href="sunglass.jsp?bname=maxmara"><img src="images/index/maxmara.jpg" style="width:100%"></a>
				    <div class="text">막스마라 / MAXMARA</div>
				</div>
				
				<div class="mySlides fade">
					<div class="numbertext">6 / 8</div>
				    <a href="sunglass.jsp?bname=givenchy"><img src="images/index/givenchy.jpg" style="width:100%"></a>
				    <div class="text">지방시 / GIVENCHY</div>
				</div>
				
				<div class="mySlides fade">
					<div class="numbertext">7 / 8</div>
				    <a href="sunglass.jsp?bname=hugo"><img src="images/index/hugoBoss.jpg" style="width:100%"></a>
				    <div class="text">휴고 보스 / HUGOBOSS</div>
				</div>
				
				<div class="mySlides fade">
					<div class="numbertext">8 / 8</div>
				    <a href="sunglass.jsp?bname=carrera"><img src="images/index/carrera.jpg" style="width:100%"></a>
				    <div class="text">까레라 / CARRERA</div>
				</div>
				
				<!-- Next and previous buttons -->
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
				<a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<br>
			
			<!-- The dots/circles -->
			<div style="text-align:center; box-sizing:border-box; margin-bottom: 80px;">
				<span class="dot" onclick="currentSlide(1)"></span>
				<span class="dot" onclick="currentSlide(2)"></span>
				<span class="dot" onclick="currentSlide(3)"></span>
				<span class="dot" onclick="currentSlide(4)"></span>
				<span class="dot" onclick="currentSlide(5)"></span>
				<span class="dot" onclick="currentSlide(6)"></span>
				<span class="dot" onclick="currentSlide(7)"></span>
				<span class="dot" onclick="currentSlide(8)"></span>
			</div>
			
			
			<div class="glassesItemBox">
				<div style="padding-left:15px; margin-bottom:15px;">
					<h2 style="margin-bottom:5px;">안경테</h2>
					<span style="color: gray;">인기있는 안경테 모음</span>
				</div>
				<ul class="glassesList">
					<%
						for(int i=0; i<20; i++) {
					%>
					<li>
						<div class="glassesImgBox">
							<a class="glassesImg" href="item.jsp?pno=<%=glassesItems.get(i).getPno()%>" style="background:url('<%=glassesItems.get(i).getMain_img1().replaceAll("\\\\","/")%>');" onmouseout="changeImg1(event,'<%=glassesItems.get(i).getMain_img1().replaceAll("\\\\","/")%>')" onmouseover="changeImg2(event,'<%=glassesItems.get(i).getMain_img2().replaceAll("\\\\","/")%>')"></a>
						</div>
						<div class="glassesContentBox" style="font-size:13px;">
							<div style="margin: 15px 0 10px 0; line-height: 18px;">
								<a href="item.jsp?pno=<%=glassesItems.get(i).getPno()%>" style="margin-top:20px; word-break:keep-all"><strong><%=glassesItems.get(i).getName() %></strong></a>
							</div>
							<div><strong><%=String.format("%,d",glassesItems.get(i).getPrice()) %>원</strong></div>
						</div>
					</li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	
	<%@ include file="front/footer.jsp"%>
</body>
<script>
	function changeImg1(event, img1) {
		event.target.style.background = "url('"+img1+"')";
	}
	function changeImg2(event, img2) {
		event.target.style.background = "url('"+img2+"')";
	}
	
	
	
	var slideIndex = 1;
	showSlides(slideIndex);

	// Next/previous controls
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	// Thumbnail image controls
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	}
</script>
</html>