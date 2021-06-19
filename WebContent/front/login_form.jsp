<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="../css/style_login_form.css"></link>
<style></style> 
</head>
<body> 
	<%@ include file="header.jsp" %>
		
		<div class="content_box">
			<div class="member_wrap">
				<div class="member_tit">
					<h2>로그인</h2>
				</div> 
				<div class="member_cont">
					<div class="member_login_box">
						<h3>회원 로그인</h3>
						
						<div class="login_input">
							<div>
								<input type="text" placeholder="아이디">
								<input type="text" placeholder="비밀번호">
							</div>
							<button type="submit">로그인</button>
						</div>
						<div class="id_chk">
							<span class="form_element">
								<input type="checkbox">
								<label>아이디 저장</label>
							</span>
						</div>
					</div>
					
					
					<div class="btn_login_box">
						<ul>
							<li>
								<button class="btn_member_join">회원가입</button>
							</li>
							<li>
								<button class="btn_member_white">아이디 찾기</button>
							</li>
							<li>
								<button class="btn_member_white">비밀번호 찾기</button>
							</li>
						</ul>
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