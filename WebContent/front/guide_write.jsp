<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀프로젝트</title>
<link rel="stylesheet" href="css/style_write.css"></link>
<style></style>
</head>
<body>
<!-- 상단 콘텐츠 -->
	<div class="top-contents">
		<div class="top-text">
			<header>
				<div id="logo">
					<img src="images/logo.png">
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
		
		<div class="board">
			<div class="board_title">
				<h2>1:1문의</h2>
			</div>
			<div class="board_list">
				<table class="board_table" style="width:100%">
					<colgroup>
						<col style="width:15%">
						<col style="width:85%">
					</colgroup>
					<tbody>
						<tr>
							<th>말머리</th>
							<td>
								<select>
									<option>회원/정보관리</option>
									<option>주문/결제</option>
									<option>배송</option>
									<option>반품/환불/교환/AS</option>
									<option>영수증/증빙서류</option>
									<option>상품/이벤트</option>
									<option>기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password">
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr>
							<th>본문</th>
							<td>
								<div class="secret">
									<input type="checkbox">
									<label>비밀글</label>
								</div>
								<textarea id="editor" cols="30" rows="10"></textarea>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<input type="text">
								<input type="file">
							</td>
						</tr>
						<tr>
							<th>자동등록방지</th>
							<td>
								
							</td>
						</tr>
					</tbody>
				</table>
				
			</div>
		</div>
		
		<div class="agree">
			<h5>비회원 개인정보 수집동의</h5>
			<textarea cols="30" rows="5">
			- 수집항목: 이름, 전화번호, 이메일주소 -수집/이용목적: 게시글 접수 및 결과 회신
			- 이용기간: 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.
			단, 관계법령의 규정에 의하여 보전할 필요가 있는 경우 일정기간 동안 개인정보를 보관할 수 있습니다.
			그 밖의 사항은 (주) 000 개인정보처리방침을 준수합니다.
			</textarea>
		</div>
		
		<div class="agree_check">
			<input type="checkbox">
			<label>비회원 글작성에 대한 개인정보 수집 및 이용동의</label>
			<a href="">전체보기 ></a>
		</div>
		
		<div class="button">
			<button type="button" class="before"><strong>이전</strong></button>
			<button type="submit" class="save"><strong>저장</strong></button>
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
<script src="js/ckeditor.js"></script>
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
	
	CKEDITOR.replace('editor');
</script>
</html>