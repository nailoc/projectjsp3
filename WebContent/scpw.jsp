<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<form>
<input type="text" name="id" id="id" placeholder="아이디를입력해 주세요.">
<input type="text" name="email" id="email" placeholder="이메일을 입력해 주세요.">

<button onclick="scpw()">비밀번호 찾기</button>
<button onclick="location.href='admin.jsp'">돌아가기</button>
</form>

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