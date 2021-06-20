<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*"%>
<%@ page import="com.hk.jsp.vo.*"%>
<!DOCTYPE html>
<html>
<style>
.sc {
background-color:#00498c;
height:50px;
color:white;
margin:0 auto;
text-align:center;
}

body {
text-align:center;
}
</style>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="sc">
<h3>아이디 확인</h3>
</div>
<%
String email = request.getParameter("email");
String name = request.getParameter("name");
MemberDao memdao = MemberDao.getInstance();
String searchedid = memdao.ScId(email, name);

out.print(searchedid);
%>
<hr>
<p><input type="button" style="	border: 1px solid #555; color:gray; background-color:white; height:31px;" value="종료" onclick="closeChkIdWin();">


</body>
<script>
function closeChkIdWin() {
		self.close();
	}
</script>
</html>