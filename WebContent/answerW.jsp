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
<link rel="stylesheet" href="css/style.css"></link>
</head>
<style></style>
<body>
	<%
	try {
	String id = (String)session.getAttribute("userid");	
		if(id==null) {
			out.println("<script> alert('관리자가 아닙니다'); location.href='proqnalist.jsp';</script>");
		}	
	} catch(Exception e) {
		
	}
	%>
	<%
	String qnano = request.getParameter("qnano");
	ProQnaDao proqnadao = ProQnaDao.getInstance();
	
	ProQnaVo rowshow = proqnadao.getProQnaByNo(qnano);
	%>
	
		<form id="frm_write" method="GET" action="answerPro.jsp">
			
		<p>댓글입력</p>
	
		<textarea style="height:250px" cols="40" name="coments" id="coments"></textarea>
		
		<div class="left">
				<button type="button" onclick="history.back();">돌아가기</button>
		</div>
			
		<div class="right">
				<button type="button" onclick="bbs_write();">저장하기</button>
		</div>	
		
		</form>
	
	
</body>
<script>

function bbs_write() {
	
	var coments = document.getElementById("coments").value;
	var coments_enc = encodeURI(coments);
	
	if(coments=="") {
		alert("내용을 입력하세요");
		return;
	}	

	location.href="answerPro.jsp?qnano="+<%= rowshow.getQnano() %>+"&coments="+coments_enc;
	
}
</script>
</html>