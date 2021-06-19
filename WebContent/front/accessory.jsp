<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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

	<%@ include file="header.jsp" %>
	
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
				<h2>악세사리</h2>
			</div>
			<div class="itemlist_category">
				<ul>
					<li><a href="">케이스 & 파우치 (0)</a></li>
					<li><a href="">관리용품 (0)</a></li>
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