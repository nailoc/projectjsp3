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
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		String phn = request.getParameter("phn");
		String email = request.getParameter("email");		
		
		MemberVo memvo = new MemberVo();
		
		memvo.setId(id);
		memvo.setPasswd(passwd);
		memvo.setEmail(email);
		memvo.setZipcode(zipcode);
		memvo.setAddress(address);
		memvo.setAddress2(address2);
		memvo.setPhn(phn);
		
		MemberDao memdao = MemberDao.getInstance();
		memdao.adminChange(memvo);
		out.print("<script> alert('변경 완료'); location.href='admin.jsp'; </script>");
	%>
</body>
<script></script>
</html>