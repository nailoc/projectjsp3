style_review.css<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀프로젝트</title>
<link rel="stylesheet" href="../css/style_accessory.css"></link>
<style></style>
</head>
<body>
<!-- 상단 콘텐츠 -->
	<div class="top-contents">
		<div class="top-text">
			<header>
				<div id="logo"><img src="images/logo.png">
					
				</div>
				
				<nav>
				<ul class="menu">
					<li><a href="introduce.jsp">회사소개</a></li>
					<li><a href="">패션 선글라스</a>
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
	
	<div class="middle-contents">
		<div class="location_wrap">
			<div class="location_cont">
				<em>HOME</em>
				<span> > </span>
				<div class="location_select">
					<select>
						<option>악세서리</option>
						<option>패션 선글라스</option>
						<option>안경테</option>
						<option>기타잡화</option>
					</select>
				</div>
				<span> > </span>
				<div class="location_select">
					<select>
						<option>케이스 & 파우치</option>
						<option>관리용품</option>
					</select>
				</div>
			</div>
		</div>
		
		<div class="itemlist">
			<div class="itemlist_title">
				<h2>관리용품</h2>
			</div>
			<div class="itemlist_category">
				<ul>
					<li><a href="">케이스 & 파우치 (0)</a></li>
					<li><a href="" class="bold">관리용품 (0)</a></li>
				</ul>
			</div>
		</div>
		
		<div class="goods_list">
			<span class="goods_list_num">
			상품 <strong>0</strong> 개
			</span>
			
			<div class="goods_list_box">
				<ul>
					<li><a href="">추천순</a></li>
					<li><a href="">판매인기순</a></li>
					<li><a href="">낮은가격순</a></li>
					<li><a href="">높은가격순</a></li>
					<li><a href="">상품평순</a></li>
					<li><a href="">등록일순</a></li>
				</ul>
			</div>
			
			<div class="the_number">
				<select>
					<option>10개씩보기</option>
					<option selected="selected">20개씩보기</option>
					<option>30개씩보기</option>
					<option>40개씩보기</option>
				</select>	
			</div>
		</div>
		
		<div class="goods_no_data">
			<strong>상품이 존재하지 않습니다.</strong>
		</div>
	</div>
	
	<div class="bottom-contents">
		<div class="bottom1">
			<div class="tabwrap">
				<ul class="tabs group">
					<li><a class="active" href="">NOTICE</a></li>
				</ul>
				<div id="panelsbo">
					<div id="one">
						<ul>
							<li><a href="">[휴무안내] 10월 9일 한글날 휴무로 상담과 배송이 중단됩니다...</a></li>
							<li><a href="">[휴무안내] 9월 29일(화) ~ 10월 4일(일) 추석휴무로...</a></li>
							<li><a href="">[휴무안내] 4월 30일(목) ~ 5월 5일(화) 6일간 전체 ...</a></li>
							<li><a href="">[배송공지] 크리스마스 & 연말연시 관련 배송안내 </a></li>
							<li><a href="">[배송공지] 개천절 및 한글날 배송관련 안내</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="bottom2">
			<div class="tabwrap">
				<ul class="tabs group">
					<li><a class="active" href="">REVIEW</a></li>
				</ul>
				<div id="panelsbo">
					<div id="one">
						<ul>
							<li><a href="">깔끔하고, 정말 고급스러운 안경테입니다</a></li>
							<li><a href="">이제품 다른색상쓰는데 면세에만 잇엇어서 구하고 싶은데... ㅠㅠ 이...</a></li>
							<li><a href="">배송이 무지 빨라요.</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="bottom3">
			<h4>고객센터</h4>
			<span class="num_big" style="letter-spacing:0px">
				02-563-8268
			</span>
			<h4>상담 가능 시간</h4>
			<span class="num_medium">AM<strong>10:00</strong> ~ PM<strong>5:00</strong></span>
			<br>
			<span class="num_small">* 점심시간 12:30 ~ 13:30
			<br>* 토 / 일 / 공휴일 휴무</span>
		</div>
		<div class="bottom4">
			<h4>계좌안내</h4>
			<span class="num_medium">신한은행</span>
			<span class="num_big" style="letter-spacing:0px">100-033-300279</span>
			<br>
			<span class="num_medium">예금주 : (주)파르마인터내셔널</span>
		</div>
	</div>
	
	<div class="bottom_contents2">
		<div class="guide_contents">
			<ul class="utilmenu">
				<li><a href="">홈</a></li>
				<li><a href="">회사소개</a></li>
				<li><a href="">이용약관</a></li>
				<li><a href=""><strong>개인정보처리방침</strong></a></li>
				<li><a href="">이용안내</a></li>
				<li><a href="">광고/제휴 문의</a></li>
			</ul>
		</div>
	</div>
	
	<div class="bottom_contents3">
		<div class="guide_contents">
			<strong>(주)사필로코리아</strong>
			<span>서울특별시 강남구 테헤란로19길 77-9 B1</span>
			<div class="foot_info">
				<dl>
					<dt>대표 :</dt>
					<dd>김태중</dd>
				</dl>
				<dl>
					<dt>통신판매업신고번호 :</dt>
					<dd></dd>
				</dl>
				<dl>
					<dt>사업자등록번호 :</dt>
					<dd>840-81-01712<a href="">사업자번호조회 ></a></dd>
				</dl>
				<dl>
					<dt>개인정보관리자 :</dt>
					<dd>김태중</dd>
				</dl>
			</div>
			<div class="foot_info">
				<dl>
					<dt>대표번호 : </dt>
					<dd><strong>070-4044-3581</strong></dd>
				</dl>
				<dl>
					<dt>팩스번호 : </dt>
					<dd></dd>
				</dl>
				<dl>
					<dt>메일 : </dt>
					<dd><a href="">vivian.sung@safilo.com</a></dd>
				</dl>
				<dl>
					<dt></dt>
					<dd>호스팅제공 : 엔에이치엔고도(주)</dd>
				</dl>
			</div>
			<p> copyright (c) <strong>2face.co.kr</strong> all rights reserved</p>
		</div>
	</div>
	
	
	<footer>
		<address>
			&copy;copyright (c) 2face.co.kr all rights reserved.
		</address>
	</footer>
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