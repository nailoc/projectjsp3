<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*"%>
<%
	String id = null;
		
	if(session.getAttribute("userid")==null) { // 세션이 없다면
		out.println("<script>alert('로그인되지 않았습니다'); location.href='login.jsp'</script>");
	}else{  // 세션이 있다면 회원정보 가져오기
		id = (String)session.getAttribute("userid"); // 로그인 아이디
		//out.println("확인:"+id);
		MemberDao memdao = MemberDao.getInstance();
		int result = memdao.delMember(id);
		out.print("<script>alert('회원 탈퇴 되었습니다.'); location.href='logout.jsp'</script>");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style></style>
</head>
<body>
</body>
<script></script>
</html>