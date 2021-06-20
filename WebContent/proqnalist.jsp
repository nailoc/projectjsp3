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
<link rel="stylesheet" href="css/style_guide.css"></link>
<link rel="stylesheet" href="css/style_event.css"></link>

</head>
<style></style>

	<%@ include file="header.jsp" %>

<%
		String sortname = request.getParameter("sort");
		String keywordval = request.getParameter("keyword");
		String typeval = request.getParameter("type");
		
		if(keywordval==null) {
			keywordval="";
		}			
		if(sortname==null) {
			sortname="qnano";
		}
		if(typeval==null) {
			typeval="pno";
		}
		
	
		ProQnaDao proqdao = ProQnaDao.getInstance();
		// List<ProReviewVo> result = prodao.getBoardLists();
		List<ProQnaVo> totalrst = proqdao.getProQnaLists(sortname, keywordval, typeval);
			
	%>

<body>
	
	<div class="middle-contents">  		
		<div class="board">
			<div class="board_title">
				<h2>상품문의</h2>
			</div>
			
	<!-- 정렬 -->
		<div>
				
			<div>
				<form id="form1" method="GET" action="proqnalist.jsp">
					<select id="select1" name="select1" onchange="sort()">
					<option value="qnano" selected="selected">정렬</option>
					<option value="qnano">최신순</option>
					<option value="views">조회순</option>	
					</select>
				</form>
			</div>
		</div>
			
			<div class="board_list">
				<table class="board_table" style="width:100%">
					<colgroup>
						<col style="width:6%">
						<col style="width:37%">
						<col style="width:12%">
						<col style="width:7%">
						<col style="width:15%">
						<col style="width:6%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>							
							<th>상품번호</th>
							<th>날짜</th>
							<th>작성자</th>
							<th>조회</th>
						</tr>	
					</thead>
						
			<tbody>
		
		<%
			for(int i=0; i<totalrst.size(); i++) {
				ProQnaVo temp = totalrst.get(i);
				out.println("<tr class=''>");
		%>	
			<td class="td"><%= temp.getQnano() %></td>
			<td class="td"><a href="proqnashow.jsp?qnano=<%=temp.getQnano() %>&pno=<%= temp.getPno() %>"><%= temp.getTitle() %></a></td>
			<td class="td"><%= temp.getPno() %></td>
			<td class="td"><%= temp.getRegdate() %></td>
			<td class="td"><%= temp.getId() %></td>
			<td class="td"><%= temp.getViews() %></td>
		</tr>
		
		<%
			}
		%>
		
			</tbody>
		
	</table>
	
	<button type="button" onclick="location.href='proqna.jsp'">상품문의작성</button>	
	
		<form id="form2" method="GET" action="proqnalist.jsp">
			<div class="board_search">
				<select id="select2" name="target">
					<option value="title">정렬</option>
					<option value="title">제목</option>
					<option value="pno">상품번호</option>
				</select>
				<input type="text" id="keyword" name="keyword" value="">
				<button type="button" class="btn" onclick="search()">검색</button>
			</div>
		</form>
	
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
<script src="js/jquery-3.6.0.min.js"></script>
<script>

//정렬
function sort() {	
	var sel = document.getElementById("select1");
	var sort_val = sel.options[sel.selectedIndex].value;
	location.href="proqnalist.jsp?sort="+sort_val;	
}

// 검색
function search() {	
	var sel = document.getElementById("select2");
	var tval = sel.options[sel.selectedIndex].value;
	
	var keyword_val = document.getElementById("keyword").value;
	var keyword_val_encode = encodeURI(keyword_val);	// url 주소 한글 -> 인코딩
	if(keyword_val) {
		location.href="proqnalist.jsp?sort=qnano&keyword="+keyword_val_encode+"&type="+tval;		
	} else {
		alert("검색어를 입력하세요");
	}	
}
</script>
</html>