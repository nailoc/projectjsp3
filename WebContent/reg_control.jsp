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
		try {
		String id = request.getParameter("regid");
		String pw = request.getParameter("regpw");
		String name = request.getParameter("name");
		String regi = request.getParameter("regi"); 
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String phn = request.getParameter("phn");
		String email = request.getParameter("email");
		int point = 0;
		
		MemberVo memvo = new MemberVo();
		
		memvo.setId(id);
		memvo.setPasswd(pw);
		memvo.setName(name);
		memvo.setEmail(email);
		memvo.setResinum(regi);
		memvo.setZipcode(zipcode);
		memvo.setAddress(address);
		memvo.setAddress2(address2);
		memvo.setPhn(phn);
		memvo.setPoint(point);
		
		MemberDao memdao = MemberDao.getInstance();
		int result = memdao.regMember(memvo);
		out.println("<script>alert('회원가입에 성공하셨습니다!'); location.href='login.jsp';</script>");}
		catch(Exception e) {
			out.println("<script>alert('회원가입 실패'); history.back();</script>");
		}
	%>
</body>
<script></script>
</html>