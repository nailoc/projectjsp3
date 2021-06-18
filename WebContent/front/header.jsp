<%@ page language="java" contentType="text/html; charset=UTF-8"%>	
	<div class="top-contents">
		<div class="header_top">
			<ul class="top_member_box">
				<li><a href="">로그인</a>
					<span class="txt_bar"></span>
				</li>
				<li><a href="">회원가입</a>
					<span class="txt_bar"></span>
				</li>
				<li>
					<div class="mypage_contents">
						<span><a href="">이용현황</a></span>
						<ul>
							<li><a href="">주문조회</a></li>
							<li><a href="">내정보수정</a></li>
							<li><a href="">찜리스트</a></li>
							<li><a href="guide_write.jsp">1:1문의</a></li>
						</ul>
					</div>
				</li>
				<li><a href="cart.jsp">장바구니(0)</a>
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
							<li><a href="">FENDI</a></li>
							<li><a href="">DIOR</a></li>
							<li><a href="">JIMMY CHOO</a></li>
							<li><a href="">MAXMARA</a></li>
							<li><a href="">CARRERA</a></li>
							<li><a href="">CIVENCHY</a></li>
							<li><a href="">HUGO BOSS</a></li>
							<li><a href="">TOMMY HILFIGER</a></li>
							<li><a href="">POLAROID</a></li>
						</ul>
					</li>
					<li><a href="">안경테</a>
						<ul class="sub">
							<li><a href="">FENDI</a></li>
							<li><a href="">DIOR</a></li>
							<li><a href="">JIMMY CHOO</a></li>
							<li><a href="">MAXMARA</a></li>
							<li><a href="">CARRERA</a></li>
							<li><a href="">CIVENCHY</a></li>
							<li><a href="">HUGO BOSS</a></li>
							<li><a href="">TOMMY HILFIGER</a></li>
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