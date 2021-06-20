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
<link rel="stylesheet" href="css/style_guide.css"></link>
<link rel="stylesheet" href="css/style_noticeshow.css"></link>
</head>
<style></style>
<body>

	<%@ include file="header.jsp" %>
	
	<div class="middle_contents">
	
	<h2>공지사항</h2>
	
	<%
	String no = request.getParameter("no");
	BoardDao bodao = BoardDao.getInstance();
	
	bodao.increaseBoardNo(no);	
	BoardVo rowshow = bodao.getBoardByNo(no);
	%>
	
		<div class="board_zone">
		
			<div class="board_zone_title">
				<h3><%= rowshow.getTitle() %></h3>
			</div>
		
		
			<div class="board_view_info">		
				
				<span class="view_info_no">
					<strong><%= rowshow.getNo() %></strong>
				</span>
				
				<span class="view_info_idip">
					<strong><%=rowshow.getWriter() %></strong>
				</span>
			
				<span class="view_info_day">
					<em><%=rowshow.getRegdate() %></em>
				</span>
				
				<span class="view_info_hits">
					<strong>조회수</strong>
					<%=rowshow.getViews() %>
				</span>
				
			</div>
								
			<div class="board_view_content">					
				<div>
					<div>내용</div>	
					<div><%= rowshow.getContents() %></div>
				</div>
					
				<div>
					<label for="attach1">
						<span>첨부파일</span>
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
			
			 <button type="button" onclick="deleteB()">삭제하기</button>
			 <%	} 
			} catch(Exception e) {
			
			}%>
				 
			<div class="btn_right_box">
				<button type="button" class="btn_board_list" onclick="history.back()">
					<strong>목록</strong>
				</button>
			</div>
		
		</div>
			
	</div>
		
		<%@ include file="footer.jsp" %>
		
	
</body>
<script>

function deleteB() {
	ok = confirm("게시글을 삭제하시겠습니까 ? " , "");
	if(ok==true) {
		location.href="delBpro.jsp?no="+<%= rowshow.getNo() %>;
	} else {
		history.back();
	}
}

function del() {
	ok = confirm("공지 삭제 (관리자) ? " , "");
	if(ok==true) {
		location.href="delBAdmin.jsp?no="+<%= rowshow.getNo() %>;
	} else {
		history.back();
	}
}

</script>
</html>