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
<link rel="stylesheet" href="css/style.css"></link>
</head>
<style></style>
<body>
	<h2>공지사항 상세내용</h2>
	
	<%
	String no = request.getParameter("no");
	BoardDao bodao = BoardDao.getInstance();
	
	bodao.increaseBoardNo(no);	
	BoardVo rowshow = bodao.getBoardByNo(no);
	%>
	
	
		<h1><%= rowshow.getTitle() %></h1>
	
	
				
			<div>
				<div>번호</div>
				<div><%= rowshow.getNo() %></div>
				
			</div>
		
			<div>
				<div>작성자</div>
				<div><%=rowshow.getWriter() %></div>
			</div>
			
			<div>
				<div>작성일</div>
				<div><%=rowshow.getRegdate() %></div>
			</div>
			
			<div>
				<div>조회수</div>
				<div><%=rowshow.getViews() %></div>
			</div>
							
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
			 
			<!-- 관리자 세션시에만 보여지는 버튼 -->		
			<%
		try {
		String id = (String)session.getAttribute("userid");	
		if(id.equals("admin")) {
		%> 
		 <button type="button" onclick="deleteB()">삭제하기</button>
		 <%	} 
		} catch(Exception e) {
		
		}%>
			 
		<div class="left">
			<button type="button" onclick="history.back()">뒤로가기</button>
		</div>
		
		
	
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

</script>
</html>