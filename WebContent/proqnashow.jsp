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
				<div>상품후기 번호</div>
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
		location.href="delQnapro.jsp?qnano="+<%= rowshow.getQnano() %>;
	} else {
		history.back();
	}
}

</script>
</html>