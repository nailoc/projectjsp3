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

<!-- ȸ������ ������ ������/����ȭ �ʿ� -->


<h3>������ �������Դϴ�.</h3>
ȸ������ :
<form action="" method="post">
<table style="width:90%">
<tr bgcolor="black">
<td></td>
<td style="color:white">���̵�</td>
<td style="color:white">��й�ȣ</td>
<td style="color:white">�̸�</td>
<td style="color:white">�̸���</td>
<td style="color:white">�����ȣ</td>
<td style="color:white">�ּ�</td>
<td style="color:white">�ֹι�ȣ</td>
<td style="color:white">�޴�����ȣ</td>
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
<button type="submit" onclick="javascript: form.action='admin_modify.jsp';">ȸ������</button>
<button type="submit" onclick="javascript: form.action='admin_del.jsp';">ȸ������</button>
</form></body>

<script></script>
</html>