<%@ page import="com.hk.jsp.dao.*"%><%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style_introduce.css"></link>
<link rel="stylesheet" href="css/style_info.css"></link>
</head>
<body>
<%
if(session.getAttribute("userid") == null) {
	out.println("<script> alert('로그인이 필요합니다!'); location.href='login.jsp';</script>");
} else {

%>


<body>
	<%@ include file="front/header.jsp"%>
	<div class="member_wrap">
		<h3>비밀번호 변경</h3>
		<div class="member_tit">
			<div class="reg_info">
				<form id="pschange" action="modify_pspro.jsp" method="GET">
					<table>
						<tr>
							<th style="font-size:12px;"><span class="important">변경 비밀번호</span></th>
							<td><div class="tdceil"><input type="password" placeholder="변경 비밀번호" id="pw" name="pw">
								</div></td>
						<tr>
							<th style="font-size:12px;">비밀번호 확인</th>
							<td><div class="tdceil"><input type="password" placeholder="변경 비밀번호 확인" id="pwc" name="pwc">
					</div> </td>
					</table>
				</form>
				<div class="btn_box2">
					<ul>
						<li><button type="button"
								onclick="location.href='userinfo.jsp'" class="btn_member_white">취소</button>
						</li>
						<li>
							<button type="button" onclick="change();"
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




function change() {
	pw = document.getElementById("pw").value;
	pwc = document.getElementById("pwc").value;
	if(pw==pwc) {
		pschange = document.getElementById("pschange");
		pschange.submit()
	}else {
		alert("비밀번호를 확인하세요!");
		return;
	}
}
<% } %>
</script>
</html>