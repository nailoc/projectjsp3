<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>javaweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
</head>
<body>
<form id="emailchange" action="modify_emailpro.jsp" method="GET">
<input type="text" placeholder="바꿀 이메일" id="email" name="email">
<button type="button" onclick="changeE();">변경</button>

</form>
</body>

<script>
function changeE() {
		email = document.getElementById("email").value;
		emailchange = document.getElementById("emailchange");
		emailchange.submit()
}
</script>
</html>