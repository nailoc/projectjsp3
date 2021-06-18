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
	<h2>상품후기 상세내용</h2>
	
	<%
	String revno = request.getParameter("revno");
	String pno = request.getParameter("pno");
	ProDao prodao = ProDao.getInstance();
	
	prodao.increaseProRVNo(revno);	
	ProReviewVo rowshow = prodao.getProVByNoPno(revno,pno);
	%>
	
	
		<h1><%= rowshow.getTitle() %></h1>
	
	
				
			<div>
				<div>상품후기 번호</div>
				<div><%= rowshow.getRevno() %></div>				
			</div>
			
			<div>
				<div>상품번호</div>
				<div><%= rowshow.getPno() %></div>				
			</div>
		
			<div>
				<div>작성자</div>
				<div><%=rowshow.getId() %></div>
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
				<div>별점</div>
				<div><%=rowshow.getScore() %></div>
			</div>
							
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
			
			 <button type="button" onclick="deleteB()">삭제하기</button>
			 
		<div class="left">
			<button type="button" onclick="history.back()">이전글</button>
		</div>
		
		<div class="right">
			<button>다음글</button>
		</div>
	
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