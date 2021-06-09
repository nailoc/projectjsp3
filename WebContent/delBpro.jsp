<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.dao.BoardDao" %>
<%@ page import="com.hk.jsp.vo.BoardVo" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
</head>
<style></style>
<body>
	
	<%
	String no = request.getParameter("no");
	BoardDao bodao = BoardDao.getInstance();
	BoardVo rowshow = bodao.getBoardByNo(no);
	%>
	
	<form id="form1" method="GET" action="delB.jsp">
		<p>비밀번호를 입력하세요</p>
		<input type="password" name="pwd" id="pwd">
		<button type="button" onclick="deleteB()">확인</button>
		<button type="button" onclick="history.back()">뒤로가기</button>
	</form>
	
	
</body>
<script>

function deleteB() {
	ok = confirm("삭제 ? " , "");
	var passwd = document.getElementById("pwd").value;
	if(ok==true) {
		location.href="delB.jsp?no="+<%= rowshow.getNo() %>+"&pwd="+passwd;
	} else {
		
	}
}

</script>
</html>