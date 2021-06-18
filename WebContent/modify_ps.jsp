<%@ page import="com.hk.jsp.dao.*"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h3>비밀번호 변경</h3>
<form id="pschange" action="modify_pspro.jsp" method="GET">
<input type="password" placeholder="바꿀 비밀번호" id="pw" name="pw">
<input type="password" placeholder="바꿀 비밀번호 확인" id="pwc" name="pwc">
<button type="button" onclick="change();">변경</button>
</form>
</body>
<script>
function change() {
	pw = document.getElementById("pw").value;
	pwc = document.getElementById("pwc").value;
	if(pw==pwc) {
		pschange = document.getElementById("pschange");
		pschange.submit()
	}else {
		alert("비밀번호를 확인하세요!");
		return;
	}
}

</script>
</html>