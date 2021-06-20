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
<link rel="stylesheet" href="css/style_guide.css"></link>

</head>
<body>

	<%@ include file="header.jsp" %>
	
<%
	String revno = request.getParameter("revno");
	ProDao prodao = ProDao.getInstance();
	ProReviewVo rowshow = prodao.getProVByNo(revno);
	
%>
	
	<form id="form1" method="GET" action="delPRV.jsp">
		<p>��й�ȣ�� �Է��ϼ���</p>
		<input type="password" name="pwd" id="pwd">
		<button type="button" onclick="deleteB()">Ȯ��</button>
		<button type="button" onclick="history.back()">�ڷΰ���</button>
	</form>
	
	<%@ include file="footer.jsp" %>
	
</body>
<script>

function deleteB() {
	ok = confirm("���� ? " , "");
	var passwd = document.getElementById("pwd").value;
	if(ok==true) {
		location.href="delPRV.jsp?revno="+<%= rowshow.getRevno() %>+"&pwd="+passwd;
	} else {
		
	}
}

</script>
</body>
</html>