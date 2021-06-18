<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<% String id = request.getParameter("idck"); %>
<body>

<form action="admin_modifypro.jsp" method="GET">
		현재 아이디 : <%=id %>
		<p>
		 <input type="hidden" name="id" id="id" value=<%=id %>> 
		<input type="password" name="passwd" id="passwd" placeholder="변경할 비밀번호"><p>
		<input type="text" name="email" id="email" placeholder="변경할 이메일"><p>
		<input type="text" name="zipcode" id="zipcode" placeholder="변경할  우편번호"><p>
		<input type="text" name="address" id="address" placeholder="변경할 주소"><p>
		<input type="text" name="address2" id="address2" placeholder="변경할 주소2"><p>
		<input type="text" name="phn" id="phn" placeholder="변경할 휴대폰 번호"><p>
		<button>변경</button>
</form>
</body>
<script></script>
</html>