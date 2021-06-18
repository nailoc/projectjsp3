<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.hk.jsp.dao.*"%>
<%@ page import="com.hk.jsp.vo.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<style>
table {
border:1px solid black;
}

td{
border:1px solid black;
}

</style>
</head>
<body>

<!-- 회원관리 관리자 페이지/세분화 필요 -->


<h3>관리자 페이지입니다.</h3>
회원관리 :
<form action="" method="post">
<table style="width:90%">
<tr bgcolor="black">
<td></td>
<td style="color:white">아이디</td>
<td style="color:white">비밀번호</td>
<td style="color:white">이름</td>
<td style="color:white">이메일</td>
<td style="color:white">우편번호</td>
<td style="color:white">주소</td>
<td style="color:white">주민번호</td>
<td style="color:white">휴대폰번호</td>
<%	
	MemberDao mem = MemberDao.getInstance();
	List<MemberVo> allmem = mem.AllmemberInfo();
	for(MemberVo vo : allmem) {
%>
	<tr>
		<td><input type="checkbox" name="idck" value="<%=vo.getId() %>">
		</td>
		<td><%=vo.getId()%></td>
		<td><%=vo.getPasswd() %></td>
		<td><%=vo.getName() %></td>
		<td><%=vo.getEmail() %></td>
		<td><%=vo.getZipcode() %></td>
		<td><%=vo.getAddress()+"   "+vo.getAddress2() %></td>
		<td><%=vo.getResinum() %></td>
		<td><%=vo.getPhn() %></td>
	</tr>
<% 
}
%>
</table>
<button type="submit" onclick="javascript: form.action='admin_modify.jsp';">회원수정</button>
<button type="submit" onclick="javascript: form.action='admin_del.jsp';">회원삭제</button>
</form></body>

<script></script>
</html>