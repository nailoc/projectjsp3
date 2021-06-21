<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style>
	h3{
		width: 100%;
		text-align: center;
		margin: 50px 0;
	}
	button{
		width: 80px;
		height: 40px;
		background-color: #343434;
		border: none;
		border-radius: 8px;
		color: #fff;
		font-size: 16px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<%
		String id = (String) session.getAttribute("userid");
		String oper = request.getParameter("oper");
		String pno = request.getParameter("pno");
		String add = request.getParameter("add");
		String quantity = request.getParameter("quantity");
		CartDao cartdao = CartDao.getInstance();
		if(oper.equals("0")) {
			if(id==null) {
				%>
					<h3>로그인이 필요합니다</h3>
				<%
				//out.println("로그인이 필요합니다");
			}else {
				int result = cartdao.addCart(id, pno, quantity);
				if(result!=-1 && result!= 0) {
				%>
					<h3>장바구니에 추가되었습니다</h3>
				<%
						//out.println("장바구니에 추가되었습니다");
				
				}else {
					out.println("장바구니담기에 실패했습니다");
				}
				
			}
		}else if(oper.equals("1")) {
			cartdao.addItemQuantity(id, pno, add);
			response.sendRedirect("cart.jsp");
		}else if(oper.equals("2")) {
			cartdao.removeItem(id, pno);
			out.println("<script>alert('상품을 삭제했습니다'); location.href='cart.jsp';</script>");
		}else if(oper.equals("3")) {
			cartdao.removeItemAll(id);
			out.println("<script>alert('상품을 전부 삭제했습니다'); location.href='cart.jsp';</script>");
		}
	%>
	<div style="text-align: center;"><button type="button" onclick="closeWindow()">닫기</button></div>
</body>
<script>
	function closeWindow() {
		self.close();
	}
</script>
</html>