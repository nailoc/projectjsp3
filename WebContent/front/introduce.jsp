<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀프로젝트</title>
<link rel="stylesheet" href="../css/style_introduce.css"></link>
<style></style>
</head>
<body>
<!-- 상단 콘텐츠 -->

	<%@ include file="header.jsp" %>
	
	<div class="middle-contents">
		<h2>회사소개</h2>
	</div>
	<div class="introduce">
		<p>안녕하세요.</p>
		<p>해외 명품 선글라스, 안경테 전문 쇼핑몰 2FACE(투페이스)입니다.</p>
		<p><br></p>
		<p>저희 2FACE는 세계에서 가장 유명한 선글라스 제조/유통사중 한 곳인 "SAFILO Group(사필로 그룹)"의 한국 지사인 "SAFILO KOREA(사필로 코리아)"의 공식 파트너로</p>
		<p>지미추, 막스마라, 지방시, 휴고보스 및 까레라, 폴라로이드등의 선글라스 및 안경테를 취급하고 있습니다.</p>
		<p><br></p>
		<p>저희는 오랜 기간 아이웨어가 필요한 현장에서 소비자들을 만나고 있으며,</p>
		<p>제품에 대한 상담과 구매를 도와드리기 위해 항상 준비하고 있습니다.</p>
		<p><br></p>
		<p>궁금한 사항이 있다면 언제든지 연락주세요.</p>
		<p><br></p>
		<p>가능한 빠른 답변 드리겠습니다.</p>
		<p><br></p>
		<p><strong>2FACE(투페이스) : 070-4044-3581</strong></p>
		<p><br></p>
		<p>* 상담 가능시간 : 평일 오전 10:00 ~ 오후 5:00</p>
		<p>* 점심시간 : 오후 12:30 ~ 1:30</p>
		<p>* 토요일, 일요일 및 공휴일은 휴무입니다.</p>
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