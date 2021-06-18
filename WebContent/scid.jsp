<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*"%>
<%@ page import="com.hk.jsp.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%

%>



<body>
<form>
<input type="text" name="email" id="email" placeholder="이메일을 입력해 주세요."><p>
<input type="text" name="name" id="name" placeholder="이름을 입력해 주세요."><p>
<button onclick="scid()">아이디 찾기</button>
<button onclick="location.href='login.jsp'">돌아가기</button>
</form>
</body>
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