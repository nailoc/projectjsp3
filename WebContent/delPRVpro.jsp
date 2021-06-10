<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="com.hk.jsp.util.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String revno = request.getParameter("revno");
	ProDao prodao = ProDao.getInstance();
	ProReviewVo rowshow = prodao.getProVByNo(revno);
	
%>
	
	<form id="form1" method="GET" action="delPRV.jsp">
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
		location.href="delPRV.jsp?revno="+<%= rowshow.getRevno() %>+"&pwd="+passwd;
	} else {
		
	}
}

</script>
</body>
</html>