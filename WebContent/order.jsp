<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<link rel="stylesheet" href="css/style_order.css"></link>
<link rel="stylesheet" href="css/headerfooter.css"></link>
<style></style>
</head>
<body>
	<%
		String id = (String) session.getAttribute("userid");
		if(id==null) {
			out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
		}
		OrderDao ordao = OrderDao.getInstance();
		List<OrderVo> row = ordao.getOrderList(id);
	%>
	<%@ include file="header.jsp" %>
	<div class="orWrapper">
	<h2>주문내역</h2>
	<%
		if(row.size()==0) {
	%>
		<div style="text-align:center;">
			<h2 style="margin: 100px 0 140px 0;">주문내역이 없습니다.</h2>
		</div>
	<%
		}else {
			for(int i=0; i<row.size(); i++) {
	%>
		<div class="orderBox">
			<div class="orderTitleBox">
				<div class="orderTitle">
					<p>주문번호 <%=row.get(i).getOno() %></p>
					<p><%=row.get(i).getRegdate().substring(0,10).replaceAll("-", ".") %>  주문</p>
					<p><%=row.get(i).getPaystate() %> / <%=row.get(i).getDeliway() %></p>
				</div>
				<div class="detailCancel">
					<p><button>주문 상세 보기 ></button></a></p>
					<p><button onclick="deli('<%=row.get(i).getDno()%>')">배송조회</button></p>
					<p><button>주문 취소</button></p>
				</div>
			</div>
			
			<%
				for(int j=0; j<row.get(i).getItemList().size(); j++) {
			%>
				<div class="item">
					<table>
						<colgroup>
							<col width="700">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<td class="tdLeft">
									<div class="itemImg"><img src="<%=row.get(i).getItemList().get(j).getMain_img1()%>" style="width:80px; vertical-align:middle"></div>
									<div class="itemTitleBox">
										<div class="itemTitle"><a href="item.jsp?pno=<%=row.get(i).getItemList().get(j).getPno()%>"><%=row.get(i).getItemList().get(j).getName() %></a></div>
										<div class="quantity">
											<span><%=String.format("%,d",row.get(i).getItemList().get(j).getPrice()) %>원</span> 
											<span>&middot; <%=row.get(i).getItemList().get(j).getQuantity() %>개</span>
										</div>
									</div>
								</td>
								
								<td class="tdRight">
									<div><button>교환, 반품 신청</button></div>
									<div><button id="<%=row.get(i).getItemList().get(j).getPno()%>" onclick="toReview(this.id)">리뷰 작성하기</button></div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			<%
				}
			%>
		</div>
	<%
			}
		}
	%>
	</div>
	<%@ include file="footer.jsp" %>
</body>
<script>
	function toReview(pno) {
		location.href="item.jsp?pno="+pno+"#reviews";
	}
	
	function deli(ono) {
		alert("배송번호 : " + ono);
	}
	/*
	window.deli = function() {
		popup = document.createElement("div");
		iframe = document.createElement("iframe");
		closeBtn = document.createElement("button");

		iframe.src = "http://www.apple.com";
		iframe.id = "view";
		popup.id = "popup";
		closeBtn.innerHTML = "닫기";

		popup.appendChild(iframe);
		popup.appendChild(closeBtn);
		document.body.appendChild(popup);

		closeBtn.onclick = function() {
			document.body.removeChild(popup);
		}
	};
	*/
</script>
</html>