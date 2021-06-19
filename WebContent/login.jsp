<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style_introduce.css"></link>
<style>
.login {
	width:800px;
	text-align:center;
	margin:0px auto;
	margin-bottom:400px;

}

.login_idpw button {
padding:20px;
}

.login_idpw input {
display: block;
    width: 292px;
    height: 36px;
    margin: 15px 0 10px 0;
    padding: 0 0 0 8px;
    border: 1px solid #d0d0d0;
    color: #979d9d;
}

.logbt {
float: right;
    width: 158px;
    height: 91px;
    margin: 15px 0 0 0;
    border: 1px solid #e40000;
    background: #e40000;
    color: #ffffff;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
}
</style>
</head>
<body>

<%@ include file="front/header.jsp" %>

<%
if(session.getAttribute("userid") == null) {
	
%>
		<div class="login">
		<p>회원가입</p><hr>
		<div class="login_idpw">
		<form id="login" action="login_control.jsp" method="GET">
		<input type="text" name="userid" id="userid" placeholder="아이디"><p>	
		<input type="password" name="userpw" id="userpw" placeholder="비밀번호"><p>
		<button class="logbt" type="button" onclick="login();">로그인</button>
		</form>
		</div>
		<button onclick="location.href='reg.jsp' ">회원가입</button>
		<button onclick="location.href='scid.jsp'">아이디 찾기</button>
		<button onclick="location.href='scpw.jsp'">비밀번호 찾기</button>
		<hr>
		</div>
		
		
<%
} else {
	out.println("<script> alert('이미 로그인된 상태입니다!'); location.href='mypage.jsp';</script>");
}
%>






<%@ include file="front/footer.jsp" %>

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