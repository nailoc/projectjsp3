<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="com.hk.jsp.util.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style_delBpro.css"></link>

</head>
<style></style>
<body>

	<%@ include file="header.jsp" %>

<%
	String qnano = request.getParameter("qnano");
	ProQnaDao proqnadao = ProQnaDao.getInstance();
	ProQnaVo rowshow = proqnadao.getProQnaByNo(qnano);
	
%>
	<div class="middle_contents"> 
		<div class="">
			<h2>글 삭제</h2>
		</div>
			<form id="form1" method="GET" action="delQNA.jsp">
				<p>
					<strong>비밀번호를 입력하세요</strong>
				</p>
				<input type="password" name="pwd" id="pwd">
				<div class="btn_check">
					<button type="button" class="cancel" onclick="history.back()">뒤로가기</button>
					<button type="button" class="ok" onclick="deleteB()">확인</button>
				</div>
			</form>
	</div>
	<%@ include file="footer.jsp" %>
	
</body>
<script>

function deleteB() {
	ok = confirm("삭제 ? " , "");
	var passwd = document.getElementById("pwd").value;
	if(ok==true) {
		location.href="delQNA.jsp?qnano="+<%= rowshow.getQnano() %>+"&pwd="+passwd;
	} else {
		
	}
}

</script>
</html>