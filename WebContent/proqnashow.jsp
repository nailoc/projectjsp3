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
<h2>상품문의 상세내용</h2>
	
	<%
	String qnano = request.getParameter("qnano");
	String pno = request.getParameter("pno");
	ProQnaDao proqnadao = ProQnaDao.getInstance();
	
	proqnadao.increaseProQnaNo(qnano);	
	ProQnaVo rowshow = proqnadao.getProQnaByNoPno(qnano,pno);
	%>
	
	
		<h1><%= rowshow.getTitle() %></h1>
	
	
				
			<div>
				<div>상품문의 번호</div>
				<div><%= rowshow.getQnano() %></div>				
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
				<div>내용</div>	
				<div><%= rowshow.getContents() %></div>
			</div>
			
			<div>
				<div>코멘트 </div>
				<div><%= rowshow.getComents() %></div>
			</div>
			
		
		<!-- 관리자 세션시에만 보여지는 버튼 -->
		<%
		try {
		String id = (String)session.getAttribute("userid");	
		if(id.equals("admin")) {
		%>		
		 <button type="button" onclick="answer()">코멘트 달기</button>		
		 <button type="button" onclick="delA()">코멘트 삭제하기</button>	
		 <button type="button" onclick="del()">관리자 권한으로 삭제</button>
		<%	} 
		} catch(Exception e) {
		
		}%> 
		
		 <button type="button" onclick="deleteB()">글삭제하기</button>
			 
		<div class="left">
			<button type="button" onclick="history.back()">이전글</button>
		</div>
		
		
	
</body>
<script>

function deleteB() {
	ok = confirm("글을 삭제하시겠습니까 ? " , "");
	if(ok==true) {
		location.href="delQnapro.jsp?qnano="+<%= rowshow.getQnano() %>;
	} else {
		history.back();
	}
}

function answer() {
	location.href="answerW.jsp?qnano="+<%= rowshow.getQnano() %>;
}

function delA() {
	location.href="answerDel.jsp?qnano="+<%= rowshow.getQnano() %>;
}

function del() {
	ok = confirm("글을 삭제 ? (관리자) " , "");
	if(ok==true) {
		location.href="delQNAadmin.jsp?qnano="+<%= rowshow.getQnano() %>;
	} else {
		history.back();
	}
}
</script>
</html>