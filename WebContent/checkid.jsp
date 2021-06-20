<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ page import="com.hk.jsp.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.ck {
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
</head>
<body>
	<div class="ck">
	<h3>아이디 중복 체크</h3>
	</div>
	<% 
		String id = request.getParameter("id");
		out.println("<h3>"+id+"</h3>");
		
		MemberDao memdao = MemberDao.getInstance();
		int result = memdao.checkMemberById(id);
		if(result==0) {
			out.println(id+"는 사용 가능한 아이디입니다");
		}else{
			out.println(id+"는 사용 불가한 아이디입니다");
		}
	%>
	<p><input type="button" style="	border: 1px solid #555; color:gray; background-color:white; height:31px;" value="종료" onclick="closeChkIdWin(<%= result%>);">
</body>
<script>

	function closeChkIdWin(result		/* 
		opener.document.getElementById("checkid_ok").value= result;
		if(result!=0) {
			opener.document.getElementById("regid").value="";
		} */) {

		self.close();
	}

</script>
</html>