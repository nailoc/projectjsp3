<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style_introduce.css"></link>
<link rel="stylesheet" href="css/style_login_form.css"></link>
<style>
</style>
</head>
<body>
 
<%@ include file="header.jsp" %>

<%
if(session.getAttribute("userid") == null) {
	
%>

			
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
								<form id="login" action="login_control.jsp" method="GET">
								<input type="text" name="userid" id="userid" placeholder="아이디">
								<input type="password" name="userpw" id="userpw" placeholder="비밀번호">
								</form>
							</div>
								<button class="logbt" type="button" onclick="login();">로그인</button>
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
								<button class="btn_member_join" onclick="location.href='reg.jsp' ">회원가입</button>
							</li>
							<li>
								<button class="btn_member_white" onclick="location.href='scid.jsp' ">아이디 찾기</button>
							</li>
							<li>
								<button onclick="location.href='scpw.jsp' " class="btn_member_white">비밀번호 찾기</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		
		
<%
} else {
	out.println("<script> alert('이미 로그인된 상태입니다!'); location.href='mypage.jsp';</script>");
}
%>






<%@ include file="footer.jsp" %>

</body>
<script>
function login() {
	id = document.getElementById("userid").value;
	pw = document.getElementById("userpw").value;
	if(id=="") {
		alert("아이디를 입력하시오!");
		return;
	}else if(pw=="") {
		alert("패스워드를 입력하시오!");
		return;
	}else{
		loginfrm = document.getElementById("login");
		loginfrm.submit();
	}
}

</script>
</html>