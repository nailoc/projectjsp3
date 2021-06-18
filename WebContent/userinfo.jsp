<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<%@ page import="com.hk.jsp.dao.*"%>
<%@ page import="com.hk.jsp.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
if(session.getAttribute("userid")==null) { // 세션이 없다면
	out.println("<script>alert('로그인되지 않았습니다'); location.href='login.jsp'</script>");}


	String id = (String)session.getAttribute("userid");
	MemberVo mev = new MemberVo();
	MemberDao mem = MemberDao.getInstance();
	mev = mem.memberInfo(id);
	
	
%>

<h3>맴버 정보</h3>
아이디:<%=id %><p>
이름:<%= mev.getName() %><p>
이메일:<%= mev.getEmail() %><p><button onclick="location.href='modify_email.jsp'" >이메일 변경</button><p>
비밀번호:<button onclick="location.href='modify_ps.jsp'" >비밀번호 변경</button><p>
주소:<%= mev.getAddress()+"   "+mev.getAddress2() %><p>
</body>
<script></script>
</html>