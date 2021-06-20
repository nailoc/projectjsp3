<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*"%>
<%@ page import="com.hk.jsp.vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style_introduce.css"></link>
<link rel="stylesheet" href="css/style_info.css"></link>
<%
	if (session.getAttribute("userid") == null) {
		out.println("<script> alert('로그인이 필요합니다!'); location.href='login.jsp';</script>");

	} else {
		String id = (String) session.getAttribute("userid");
		MemberVo mev = new MemberVo();
		MemberDao mem = MemberDao.getInstance();
		mev = mem.memberInfo(id);
%>
</head>
<body>
	<%@ include file="front/header.jsp"%>
	<div class="member_wrap">
		<h3>이메일 변경</h3>
		<div class="member_tit">
			<div class="reg_info">
				<form id="emailchange" action="modify_emailpro.jsp" method="GET">
					<table>
						<tr>
							<th style="font-size:13px;"><span class="important">기존 이메일</span></th>
							<td><div class="tdceil"><%=mev.getEmail()%>
								</div></td>
						<tr>
							<th style="font-size:13px;">변경 이메일</th>
							<td><div class="tdceil"><input type="text"
								placeholder="바꿀 이메일" id="email" name="email">
					</div> </td>
					</table>
				</form>
				<div class="btn_box2">
					<ul>
						<li><button type="button"
								onclick="location.href='userinfo.jsp'" class="btn_member_white">취소</button>
						</li>
						<li>
							<button type="button" onclick="changeE();"
								class="btn_member_join">변경</button>
						</li>
					</ul>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="front/footer.jsp"%>
</body>

<script>
	function changeE() {
		email = document.getElementById("email").value;
		emailchange = document.getElementById("emailchange");
		emailchange.submit()
	}
<% }%>
</script>
</html>