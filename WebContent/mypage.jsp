<%@ page language="java" contentType="text/html; charset=UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>마이페이지</h3>
<button onclick="location.href='userinfo.jsp'">회원정보</button>
<button onclick="location.href='delete.jsp'">회원탈퇴</button>
<button onclick="location.href='logout.jsp'">로그아웃</button>
<%
String id = (String)session.getAttribute("userid");
if(id.equals("admin")) {
%>
<button onclick="location.href='admin.jsp'">회원관리</button>
<%	} %>
</body>
</html>