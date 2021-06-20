<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="com.hk.jsp.util.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="../css/style_noticeshow.css"></link>
</head>
<style></style>
<body>

	<%@ include file="header.jsp" %>
	
	<div class="middle_contents">
	
		<h2>상품후기</h2>
		
		<%
		String revno = request.getParameter("revno");
		String pno = request.getParameter("pno");
		ProDao prodao = ProDao.getInstance();
		
		prodao.increaseProRVNo(revno);	
		ProReviewVo rowshow = prodao.getProVByNoPno(revno,pno);
		%>
		
		<div class="board_zone">
		
			<div class="board_zone_title">
				<h3><%= rowshow.getTitle() %></h3>
			</div>
			
				<div class="board_view_info">
							
					<span class="view_info_no">	
						<strong><%= rowshow.getRevno() %></strong>				
					</span>
					
					<span class="view_info_idip">					
						<strong><%= rowshow.getPno() %></strong>				
					</span>
					
					<span class="view_info_idip">
						<strong><%=rowshow.getId() %></strong>
					</span>
					
					<span class="view_info_day">
						<em><%=rowshow.getRegdate() %></em>
					</span>
					
					<span class="view_info_hits">
						<strong>조회수</strong>
						<%=rowshow.getViews() %>
					</span>
					
					<span class="view_info_hits">
						<strong>별점</strong>
						<%=rowshow.getScore() %>
					</span>
									
				</div>
				
				<div class="board_view_content">
					<div>
						<div>내용</div>	
						<div><%= rowshow.getContents() %></div>
					</div>
					
					<div>
						<label for="attach1">
							<span>첨부파일1</span>
						</label>
						<div>
							<p><%= rowshow.getAttach1() %></p>
							<!-- 이미지 경우 ↓ -->
							<img src="upload/<%= rowshow.getAttach1() %>" alt="첨부파일 이미지">
						</div>					
					</div>
				</div>
					
				<!-- 관리자 세션시에만 보여지는 버튼 -->
				<%
				try {
				String id = (String)session.getAttribute("userid");	
				if(id.equals("admin")) {
				%>	
				<button type="button" onclick="del()">관리자 권한으로 삭제</button>		
				
				<%	} 
				} catch(Exception e) {
				
				}%>
				
				<div class="btn_right_box">
					<button type="button" onclick="deleteB()">삭제하기</button>
						 
					<div class="btn">
						<button type="button" onclick="history.back()">이전글</button>
						<button>다음글</button>
					</div>
				</div>
				
			</div>
			
		</div>
		
		<%@ include file="footer.jsp" %>
	
</body>
<script>

function deleteB() {
	ok = confirm("글을 삭제하시겠습니까 ? " , "");
	if(ok==true) {
		location.href="delPRVpro.jsp?revno="+<%= rowshow.getRevno() %>;
	} else {
		history.back();
	}
}

function del() {
	ok = confirm("글을 삭제 ? (관리자) " , "");
	if(ok==true) {
		location.href="delPRVAdmin.jsp?revno="+<%= rowshow.getRevno() %>;
	} else {
		history.back();
	}
}

</script>
</html>