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
	
	<h2>상품문의</h2>
	
	<%
	String qnano = request.getParameter("qnano");
	String pno = request.getParameter("pno");
	ProQnaDao proqnadao = ProQnaDao.getInstance();
	
	proqnadao.increaseProQnaNo(qnano);	
	ProQnaVo rowshow = proqnadao.getProQnaByNoPno(qnano,pno);
	%>
	
	<div class="board_zone">
	
			<div class="board_zone_title">
				<h3><%= rowshow.getTitle() %></h3>
			</div>
		
				<div class="board_view_info">
									
					
					<span class="view_info_no">	
						<strong><%= rowshow.getQnano() %></strong>				
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
					
				</div>			
				
				<div class="board_view_content">								
					<div>
						<div>내용</div>	
						<div><%= rowshow.getContents() %></div>
					</div>
					
					<div>
						<div>코멘트 </div>
						<div><%= rowshow.getComents() %></div>
					</div>
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
			
			<div class="btn_right_box">
				 <button type="button" onclick="deleteB()">삭제하기</button>
					 
				<div class="btn">
					<button type="button" onclick="history.back()">이전으로</button>
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
		location.href="delQnapro.jsp?qnano="+<%= rowshow.getQnano() %>;
	} else {
		history.back();
	}
}

function answer() {
	ok = confirm("코멘트 작성 ? " , "");
	if(ok==true) {
		location.href="answerW.jsp?qnano="+<%= rowshow.getQnano() %>;
	} else {
		history.back();
	}
}

function delA() {
	ok = confirm("코멘트 삭제 ? " , "");
	if(ok==true) {
		location.href="answerDel.jsp?qnano="+<%= rowshow.getQnano() %>;
	} else {
		history.back();
	}
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