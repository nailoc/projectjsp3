<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
</head>
<style></style>
<%
		String sortname = request.getParameter("sort");
		String keywordval = request.getParameter("keyword");
		String typeval = request.getParameter("type");
		
		if(keywordval==null) {
			keywordval="";
		}			
		if(sortname==null) {
			sortname="revno";
		}
		if(typeval==null) {
			typeval="title";
		}
		
	
		ProDao prodao = ProDao.getInstance();
		// List<ProReviewVo> result = prodao.getBoardLists();
		List<ProReviewVo> totalrst = prodao.getProLists(sortname, keywordval, typeval);
			
	%>

<body>

	<h2>상품후기</h2>

	<!-- 정렬 -->
		<div>
			<div>전체 <%=totalrst.size() %></div>	
				
			<div>
				<form id="form1" method="GET" action="prolist.jsp">
					<select id="select1" name="select1" onchange="sort()">
					<option value="revno" selected="selected">정렬</option>
					<option value="revno">최신순</option>
					<option value="views">조회순</option>	
					</select>
				</form>
			</div>
		</div>

	<table>
		<tr>
			<th>상품문의번호</th>
			<th>상품번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회</th>
			<th>사진</th>
		</tr>
		
		<%
			for(int i=0; i<totalrst.size(); i++) {
				ProReviewVo temp = totalrst.get(i);
				out.println("<tr class=''>");
		%>	
			<td><%= temp.getRevno() %></td>
			<td><%= temp.getPno() %></td>
			<td><a href="proshow.jsp?revno=<%=temp.getRevno() %>"><%= temp.getTitle() %></a></td>
			<td><%= temp.getRegdate() %></td>
			<td><%= temp.getViews() %></td>
			<td><img src="upload/<%= temp.getAttach1() %>" alt="썸네일"></td>
		</tr>
		
		<%
			}
		%>
	</table>
	
	<button type="button" onclick="location.href='proreviewwrite.jsp'">상품후기작성</button>	
	
	<div>
		<form id="form2" method="GET" action="prolist.jsp">
				<select id="select2" name="target">
					<option value="title">정렬</option>
					<option value="title">제목</option>
					<option value="pno">상품번호</option>
				</select>
				<input type="text" id="keyword" name="keyword" value="">
				<button type="button" onclick="search()">검색</button>
		</form>
	</div>
	
</body>
<script src="js/jquery-3.6.0.min.js"></script>
<script>

//정렬
function sort() {	
	var sel = document.getElementById("select1");
	var sort_val = sel.options[sel.selectedIndex].value;
	location.href="prolist.jsp?sort="+sort_val;	
}

// 검색
function search() {	
	var sel = document.getElementById("select2");
	var tval = sel.options[sel.selectedIndex].value;
	
	var keyword_val = document.getElementById("keyword").value;
	var keyword_val_encode = encodeURI(keyword_val);	// url 주소 한글 -> 인코딩
	if(keyword_val) {
		location.href="prolist.jsp?sort=revno&keyword="+keyword_val_encode+"&type="+tval;		
	} else {
		alert("검색어를 입력하세요");
	}	
}
</script>
</html>