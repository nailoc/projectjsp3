<%@ page language="java" contentType="text/html; charset=UTF-8"%>	
	<div class="top-contents">
		<div class="header_top">
			<ul class="top_member_box">
				<%
			if(session.getAttribute("userid") == null) {
			%>
				<li><a href="login.jsp">로그인</a>
					<span class="txt_bar"></span>
				</li>
				<li><a href="reg.jsp">회원가입</a>
					<span class="txt_bar"></span>
				</li>
				<%} else { %>	
				<li><a href="logout.jsp">로그아웃</a>
					<span class="txt_bar"></span>
				</li> 
				<li><a href="mypage.jsp">마이페이지</a>
					<span class="txt_bar"></span>
				</li> 
				<%}%>
				<li>
					<div class="mypage_contents">
						<span><a href="order.jsp">주문조회</a></span>
					</div>
				</li>
				<li><a href="cart.jsp">장바구니</a>
					<span class="txt_bar"></span>
				</li>
				<li><a href="notice.jsp">공지사항</a>
					<span class="txt_bar"></span>
				</li>
			</ul>
		</div>
		<div class="top-text">
			<header>
				<div id="logo">
					<img src="images/logo.png">
				</div>
				
				<form method="get" action="sunglass.jsp">
					<div class="top_search">
						<input type="text" name="keyword" value="">
						<input type="submit" value="검색">
					</div>
				</form>
				
				<nav>
				<ul class="menu">
					<li><a href="introduce.jsp">회사소개</a></li>
					<li><a href="sunglass.jsp">패션 선글라스</a>
						<ul class="sub">
							<li><a href="sunglass.jsp?bname=fendi&kind=10">FENDI</a></li>
							<li><a href="sunglass.jsp?bname=dior&kind=10">DIOR</a></li>
							<li><a href="sunglass.jsp?bname=jimmy&kind=10">JIMMY CHOO</a></li>
							<li><a href="sunglass.jsp?bname=maxmara&kind=10">MAXMARA</a></li>
							<li><a href="sunglass.jsp?bname=carrera&kind=10">CARRERA</a></li>
							<li><a href="sunglass.jsp?bname=givenchy&kind=10">CIVENCHY</a></li>
							<li><a href="sunglass.jsp?bname=hugo&kind=10">HUGO BOSS</a></li>
							<li><a href="sunglass.jsp?bname=tommy&kind=10">TOMMY HILFIGER</a></li>
							<li><a href="sunglass.jsp?bname=polaroid&kind=10">POLAROID</a></li>
						</ul>
					</li>
					<li><a href="sunglass.jsp?kind=20">안경테</a>
						<ul class="sub">
							<li><a href="sunglass.jsp?bname=fendi&kind=20">FENDI</a></li>
							<li><a href="sunglass.jsp?bname=dior&kind=20">DIOR</a></li>
							<li><a href="sunglass.jsp?bname=jimmy&kind=20">JIMMY CHOO</a></li>
							<li><a href="sunglass.jsp?bname=maxmara&kind=20">MAXMARA</a></li>
							<li><a href="sunglass.jsp?bname=carrera&kind=20">CARRERA</a></li>
							<li><a href="sunglass.jsp?bname=givenchy&kind=20">CIVENCHY</a></li>
							<li><a href="sunglass.jsp?bname=hugo&kind=20">HUGO BOSS</a></li>
							<li><a href="sunglass.jsp?bname=tommy&kind=20">TOMMY HILFIGER</a></li>
							<li><a href="sunglass.jsp?bname=polaroid&kind=20">POLAROID</a></li>
						</ul>
					</li>
					<li><a href="accessory.jsp">악세서리</a>
						<ul class="sub">
							<li><a href="accessory.jsp">케이스&파우치</a></li>
							<li><a href="accessory2.jsp">관리용품</a></li>
						</ul>
					</li>
					<li><a href="othergoods.jsp">기타잡화</a></li>
					<li><a href="genuine.jsp">정품등록</a>
						<ul class="sub">
							<li><a href="genuine.jsp">정품등록</a></li>
							<li><a href="notice.jsp">공지사항</a></li>
							<li><a href="event.jsp">이벤트 & 갤러리</a></li>
							<li><a href="inquiry.jsp">상품문의</a></li>
							<li><a href="review.jsp">상품후기</a></li>
							<li><a href="guide.jsp">이용안내 FAQ</a></li>
						</ul>
					</li>
				</ul>
				</nav>
			</header>
		</div>
	</div>