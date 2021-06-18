<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="../css/style_itemlist.css"></link>
<style>
	ul.item_list {
		list-style: none;
	}
	ul.item_list li {
		float: left;
		margin-top: 10px;
		margin-bottom: 30px;
		height: 359.5px;
	}
	a {
		text-decoration: none;
		color: #000;
	}
	a.img {
		display: block;
		width: 292.5px;
		height: 292.5px;
		background-size: 292.5px !important;
		transition: all 0.2s ease;
	}
	a.active {
		color: red !important;
	}
</style>
</head>
<body>
	<%
		String keyword = request.getParameter("keyword");
		String kind = request.getParameter("kind");
		String bname = request.getParameter("bname");
		String sort = request.getParameter("sort");
		String cPage = request.getParameter("page");
		String sort2 = "";
		StringBuffer nextPage = new StringBuffer("");
		StringBuffer selSort = new StringBuffer("");
		if(keyword==null) {
			keyword = "";
		}else {
			nextPage.append("keyword=" + keyword);
			selSort.append("keyword=" + keyword);
		}
		if(kind==null) {
			kind="10";
		}else {
			nextPage.append("&kind=" + kind);
			selSort.append("&kind=" + kind);
		}
		if(bname==null) {
			bname="";
		}else {
			nextPage.append("&bname=" + bname);
			selSort.append("&bname=" + bname);
		}
		if(sort==null) {
			sort="rec";
		}else {
			nextPage.append("&sort=" + sort);
		}
		if(cPage==null) {
			cPage="1";
		}
		ProductDao prodao = ProductDao.getInstance();
		List<ProductVo> row = prodao.getProductList(keyword, kind, bname, sort, cPage);
		
		int[] bnameCnt = prodao.getBnameCnt(kind);
		
		int totalPage = prodao.getTotalPage(keyword, kind, bname);
		
		List<String> bnameList = new ArrayList<>();
		bnameList.add("fendi"); bnameList.add("dior"); bnameList.add("jimmy choo"); bnameList.add("maxmara"); bnameList.add("carrera"); bnameList.add("givenchy"); bnameList.add("hugo boss"); bnameList.add("tommy hilfiger");
		if(kind.equals("10")) {
			bnameList.add("polaroid");
		}
		
		String[] sortList1 = {"rec", "sell_count", "rowPrice", "highPrice", "review_average", "regdate"};
		String[] sortList2 = {"추천순", "판매인기순", "낮은가격순", "높은가격순", "상품평순", "등록일순"};
	%>
	
	<%@ include file="header.jsp" %>
	
			<%
			for(int i=0; i<bnameList.size(); i++) {
				if(i==5) {
			%>
					<br>
			<%
				}
			%>
			<a class="<%=bnameList.get(i).equals(bname) ? "active" : "" %>" href="sunglass.jsp?bname=<%=bnameList.get(i)%>&kind=<%=kind %>"><%=bnameList.get(i).toUpperCase() %> <%=bnameCnt[i] %></a>
		<%
			}
		%>
		
	</p>
	<p>
		<%
			for(int i=0; i<sortList1.length; i++) {
		%>
			<a class="<%=sortList1[i].equals(sort) ? "active" : "" %>" href="sunglass.jsp?<%=selSort%>&sort=<%=sortList1[i]%>"><%=sortList2[i] %></a>
		<%
			}
		%>
	</p>
	<div style="width:1250px;">
		<ul class="item_list" style="width:100%;">
			<%
				for(int i=0; i<row.size(); i++) {
			%>
				<li style="width:25%;">
					<div>
						<div>
							<a id="img" href="item.jsp?pno=<%=row.get(i).getPno()%>" class="img" style="background:url('<%=row.get(i).getMain_img1().replaceAll("\\\\","/")%>');" onmouseout="changeImg1(event,'<%=row.get(i).getMain_img1().replaceAll("\\\\","/")%>')" onmouseover="changeImg2(event,'<%=row.get(i).getMain_img2().replaceAll("\\\\","/")%>')">
							</a>
						</div><!-- img src="<%=row.get(i).getMain_img1() %>" style="width:292.5px;"-->
						<div><a href="item.jsp?pno=<%=row.get(i).getPno()%>"><%= row.get(i).getName() %></a></div>
					</div>
					<div><%= String.format("%,d",row.get(i).getPrice())+"원" %></div>
				</li>
			<%
				}
			%>
		</ul>
		<br>
		<%
			for(int i=0; i<totalPage; i++) {
		%>
			<a class="<%= i+1 == Integer.parseInt(cPage) ? "active" : "" %>" href="itemlist.jsp?<%=nextPage%>&page=<%=i+1%>"><%=i+1 %></a>
		<%
			}
		%>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
<script>
	function changeImg2(event,img2) {
		event.target.style.background = "url('"+img2+"')" ;
	}
	
	function changeImg1(event,img1) {
		event.target.style.background = "url('"+img1+"')";
	}
</script>
</html>