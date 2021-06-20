<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*"%>
<%@ page import="com.hk.jsp.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style_introduce.css"></link>
<link rel="stylesheet" href="css/style_id.css"></link>
</head>

<body>

<%@ include file="front/header.jsp" %>

<div class="content_box">
			<div class="member_wrap">
				<div class="member_tit">
					<h2>비밀번호 찾기</h2>
				</div> 
				<div class="member_cont">
					<div class="member_login_box">
						<h3>회원 비밀번호 찾기</h3>
						
						<div class="sc_input">
							<div>
								<input type="text" name="id" id="id" placeholder="아이디">
								<input type="text" name="email" id="email" placeholder="이메일">
							</div>
							<button type="button" onclick="scpw()">비밀번호</button>
						</div>
						<div class="id_chk">
							<span class="form_element">
							</span>
						</div>
					</div>
					
					
					<div class="btn_login_box">
						<ul>
							<li>
								<button onclick="location.href='login.jsp'" class="btn_member_white">로그인하기</button>
							</li>
							<li>

						</ul>
					</div>
				</div>
			</div>
		</div>

<%@ include file="front/footer.jsp" %>
</body>

<script>
function scpw() {
	var id = document.getElementById("id").value;
	var email = document.getElementById("email").value;
	var encemail = encodeURI(email);
	var enid = encodeURI(id);
	if(email) {
		url = "scpwpro.jsp?email="+encemail+"&id="+enid;
		window.open(url, "서치 pw", "width=400,height=250");
	}else{
		alert("값을 입력하시오!");
	}
}
</script>
</html>