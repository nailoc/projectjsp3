<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	
	<%
	MemberDao mem = MemberDao.getInstance();
	String id = request.getParameter("userid");
	String pw = request.getParameter("userpw");
	int result = mem.loginck(id, pw);
	
	if(result==0) {
		out.println("<script>alert('아이디를 확인해 주세요.');  location.href='login.jsp'</script>");
	}else if(result==-1) {
		out.println("<script>alert('비밀번호를 확인해 주세요.');  location.href='login';</script>");
	}else if(result==1) {
		session.setAttribute("userid", id);
		session.setMaxInactiveInterval(10*60);
		out.println("<script>alert('로그인 되었습니다.');</script>");
		if(session.getAttribute("userid").equals("admin")) {
			out.println("<script>alert('관리자 계정으로 로그인합니다.');</script>");
			response.sendRedirect("mypage.jsp");
		}else { 
			response.sendRedirect("mypage.jsp");
		}
			
	}
	%>
	<!-- 
	out.println("<script>alert('로그인 되었습니다.'); location.href='index.jsp'</script>"); -->
</body>
<script></script>
</html>