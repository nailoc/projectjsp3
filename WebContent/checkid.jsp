<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>
	<% 
		out.println("<h3>중복체크화면</h3>");
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
	<p><input type="button" value="종료" onclick="closeChkIdWin(<%= result%>);">
</body>
<script>


	function closeChkIdWin(result) {
		
		opener.document.getElementById("checkid_ok").value= result;
		if(result!=0) {
			opener.document.getElementById("regid").value="";
		}
		self.close();
	}

</script>
</html>