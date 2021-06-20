<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*"%>
<%@ page import="com.hk.jsp.vo.*"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/style_introduce.css"></link>
<link rel="stylesheet" href="css/style_info.css"></link>
<style>
</style>
<head>
<meta charset="UTF-8">
</head>
<body>

<%@ include file="header.jsp" %>
<%
if(session.getAttribute("userid")==null) { // 세션이 없다면
	out.println("<script>alert('로그인되지 않았습니다'); location.href='login.jsp'</script>");
}
	String id = (String)session.getAttribute("userid");
	MemberVo mev = new MemberVo();
	MemberDao mem = MemberDao.getInstance();
	mev = mem.memberInfo(id);
	
	
%>


<div class="content_box">
		
			<div class="member_wrap">
							<div class="member_tit">
					<h3>회원정보</h3>
				</div> 
		<div class="reg_info">

		<table>
		<tr>
		<th><span class="important">아이디</span></th>
		<td><div class="tdceil">
		<%=id %>
		</div>
		</td>
		<tr>
		<th><span class="important">비밀번호</span></th>
		<td><div class="tdceil">
		<button onclick="location.href='modify_ps.jsp'" style="padding:10px; border: 1px solid #bfbfbf; background: #fff;" >비밀번호 변경</button></div>
		</td>
		<tr>
		<th><span class="important">이름</span></th>
		<td><div class="tdceil"><%=mev.getName() %></div>
		</td>
		<tr>
		<th><span class="important">전화번호</span></th>
		<td><div class="tdceil"><%=mev.getPhn() %></div>
		</td>
		</tr>
		<tr>
		<th><span class="important">이메일</span></th>
		<td><div class="tdceil"><%=mev.getEmail() %></div><button onclick="location.href='modify_email.jsp'" style="padding:10px; border: 1px solid #bfbfbf; background: #fff;" onclick="location.href='modify_email.jsp'" >이메일 변경</button></td>
		<tr>
		<th><span class="important">주소</span></th>
		<td><div class="tdceil"><%= mev.getAddress()+"   "+mev.getAddress2() %></div></td></tr>
		<tr>
		<th><span class="important">포인트</span></th>
		<td><div class="tdceil"><%= mev.getPoint() %></div></td>
		</tr>
		</table>
		</div>
		<div class="btn_box">
			<button type="button" onclick="location.href='mypage.jsp'" class="btn_member_white">돌아가기</button>
		</div>
		</div>
		</div>
		
<%-- 		
<h3>맴버 정보</h3>
아이디:<%=id %><p>
이름:<%= mev.getName() %><p>
이메일:<%= mev.getEmail() %><p><button onclick="location.href='modify_email.jsp'" >이메일 변경</button><p>
비밀번호:<button onclick="location.href='modify_ps.jsp'" >비밀번호 변경</button><p>
주소:<%= mev.getAddress()+"   "+mev.getAddress2() %><p>
포인트:<%= mev.getPoint() %> --%>

<%@ include file="footer.jsp" %>
</body>
<script></script>
</html>