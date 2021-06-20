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
<%@ include file="header.jsp" %>

<div class="content_box">
			<div class="member_wrap">
				<div class="member_tit">
					<h2>아이디 찾기</h2>
				</div> 
				<div class="member_cont">
					<div class="member_login_box">
						<h3>회원 아이디 찾기</h3>
						
						<div class="sc_input">
							<div>
								<input type="text" name="name" id="name" placeholder="이름">
								<input type="text" name="email" id="email" placeholder="이메일">
							</div>
							<button type="button" onclick="scid()">아이디 찾기</button>
						</div>
						<div class="id_chk">
							<span class="form_element">
							</span>
						</div>
					</div>
					
					
					<div class="btn_login_box">
						<ul>
							<li>
								<button onclick="location.href='scpw.jsp'" style="font-size:12px;" class="btn_member_join">비밀번호 찾기</button>
							</li>
							<li>
								<button onclick="location.href='login.jsp'" class="btn_member_white">로그인하기</button>
							</li>
							<li>

						</ul>
					</div>
				</div>
			</div>
		</div>

<%@ include file="footer.jsp" %>
</body>




 


<script src="js/jquery-3.6.0.min.js"></script>
<script>

function scid() {
	var email = document.getElementById("email").value;
	var name = document.getElementById("name").value;
	var encemail = encodeURI(email);
	var enname = encodeURI(name);
	if(email) {
		url = "scidpro.jsp?email="+encemail+"&name="+enname;
		window.open(url, "서치 id", "width=400,height=250");
	}else{
		alert("값을 입력하시오!");
	}
}

 
</script>
</html>