<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	input {
		width: 200px;
		padding: 5px;
		border: 1px solid #cccccc;
		margin-bottom: 5px;
	}

</style>
</head>
<body>

<%
if(session.getAttribute("userid") == null) {
	
%>
	<form id="login" action="login_control.jsp" method="GET">
		<input type="text" name="userid" id="userid" placeholder="아이디">		
		<input type="password" name="userpw" id="userpw" placeholder="비밀번호">
		<button type="button" onclick="login();">로그인</button>
		</form>
		<button onclick="location.href='reg.jsp' ">회원가입</button>
		<button onclick="scid.jsp">아이디 찾기</button>
		<button onclick="scpw.jsp">비밀번호 찾기</button>
<%
} else {
	out.print("<script>alert('로그인된 상태입니다!');</script>");
	response.sendRedirect("mypage.jsp");
}
%>
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