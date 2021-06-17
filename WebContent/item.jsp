<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
<link rel="stylesheet" href="css/style_item.css"></link>
<style></style>
</head>
<body>
	<%
		String pno = request.getParameter("pno");
		ProductDao prodao = ProductDao.getInstance();
		ProductVo row = prodao.getProductByPno(pno);
		String deliFee = "2,500원";
		if(row.getPrice()>=50000) {
			deliFee = "무료";
		}
	%>
	<div class="contentBox">
		<div class="item_photo_info">
			<div class="imgBox"><a id="mainImg" href="" style="background: url('<%= row.getMain_img2().replaceAll("\\\\","/") %>');" ></a></div>
			<div class="infoBox">
				<div class="infoTitle">
					<h3><%=row.getName() %></h3>
				</div>
				
				<div class="infoList">
					<dl>
						<dt>판매가</dt>
						<dd><strong style="font-size:16px;"><%=String.format("%,d",row.getPrice()) %>원</strong></dd>
					</dl>
					
					<dl>
						<dt>구매혜택</dt>
						<dd>
							<span class="item_mileage">적립 마일리지 <strong>+<%=String.format("%,d",(int)(row.getPrice()*0.01)) %>원</strong> <strong style="font-size: 11px; color:#999999;">(상품: <%=String.format("%,d",(int)(row.getPrice()*0.01)) %>원)</strong></span>
						</dd>
					</dl>
					
					<dl>
						<dt>배송비</dt>
						<dd style="margin-left: 90px;">
							<strong><%=deliFee %></strong>
							<div>택배 / 방문수령</div>
						</dd>
					</dl>
					
					<dl>
						<dt>상품코드</dt>
						<dd><%=row.getPno() %></dd>
					</dl>
					
					<dl>
						<dt>브랜드</dt>
						<dd><%=row.getBname() %></dd>
					</dl>
					
					<dl>
						<dt>제조사</dt>
						<dd><%=row.getFid() %></dd>
					</dl>
					
					<dl>
						<dt>원산지</dt>
						<dd><%=row.getOrigin() %></dd>
					</dl>
					
				</div>
				
				<div class="choiceBtn">
					<div class="quantity">
						<button id="quantity_minus" type="button" onclick="add(-1)">-</button>
						<input id="quantity" type="text" value="1" name="quantity">
						<button id="quantity_plus" type="button" onclick="add(1)">+</button>
					</div>
					<div class="btnAddDirect"><button type="button" onclick="addCart('user1', <%=row.getPno()%>)">장바구니 담기</button></div>
					<div class="btnAddDirect"><button type="button" onclick="pay(<%=row.getPno()%>)">바로구매</button></div>
				</div>
			</div> <!-- infoBox end -->
			
			<div class="itemSnap">
				<a id="mainImg1" style="background:url('<%=row.getMain_img2().replaceAll("\\\\","/")%>')" onmouseover="changeImg('<%=row.getMain_img2().replaceAll("\\\\","/")%>')"></a>
				<a id="mainImg2" style="background:url('<%=row.getMain_img1().replaceAll("\\\\","/")%>')" onmouseover="changeImg('<%=row.getMain_img1().replaceAll("\\\\","/")%>')"></a>
			</div>
		</div> <!-- item_photo_info end -->
		
		<div id="detail">
			<div class="goodsTab">
				<div class="detail">
					<ul>
						<li class="on"><a href="#detail">상품상세정보</a></li>
						<li><a href="#delivery">배송안내</a></li>
						<li><a href="#exchange">교환 및 반품안내</a></li>
						<li><a href="#reviews">상품후기</a></li>
						<li><a href="#qna">상품문의</a></li>
					</ul>
				</div>
			</div>
			
			<div class="detail_cont">
				<h3>상품상세정보</h3>
				<div class="detailBox">
					<%
						for(int i=0; i<9; i++) {
					%>
						<img src="<%= row.getImgs().get(i) %>" alt="<%= i+1%>">
					<%
						}
					%>
				</div>
			</div>
			
		</div> <!-- detail end -->
		
		<div id="delivery">
			<div class="goodsTab">
				<div class="delivery">
					<ul>
						<li><a href="#detail">상품상세정보</a></li>
						<li class="on"><a href="#delivery">배송안내</a></li>
						<li><a href="#exchange">교환 및 반품안내</a></li>
						<li><a href="#reviews">상품후기</a></li>
						<li><a href="#qna">상품문의</a></li>
					</ul>
				</div>
			</div>
			
			<div class="delContent">
				<h3>배송안내</h3>
				<p>1. 접수마감</p>
				<p>
					<span style="color:rgb(255,0,0);">&nbsp;&nbsp;</span>
					<span style="color:rgb(255,0,0);">· 특별한 사정이 없는 한 매일 오후 4시 이전 결제가 확인된 주문은 당일 출고됩니다.</span><br>
					<span style="color:rgb(255,0,0);">&nbsp;&nbsp;</span>
					<span style="color:rgb(255,0,0);">· 재고 상황에 따라 하루 정도 지연될 수 있으며 통상 배송기간은 1일~3일 입니다.</span><br>
					<span style="color:rgb(255,0,0);">&nbsp;&nbsp;</span>
					<span style="color:rgb(255,0,0);">· 당일 발송건에 대한 운송장 번호는 보통 오후 7시 전후에 등록됩니다.</span>
				</p>
				<p>&nbsp;&nbsp;</p>
				
				<p>2. 주문변경</p>
				<p>
					<span>&nbsp;&nbsp;</span>
					<span>· 주문의 변경 사항이 있는 경우, 오후 3시전 반드시 전화로 연락을 주셔야 합니다.</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 전화 요청이 아닌 경우, 제품의 발송 후 교환에 따른 왕복 택배비는 고객 부담입니다.</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 간혹 상품 발송전 요청된 변경이라도 상황에 따라 부득이하게 다음날 출고되는 경우가 있습니다.</span>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;※ 발송전 취소 요청시 당일 오후 3시전까지 전화로 신청하셔야 하고, 이후로는 상품의 출고 여부에 따라 고객이 왕복 택배비를 부담하셔야 합니다.</p>
				</p>
				<p>&nbsp;&nbsp;</p>
				
				<p>3. 배송비</p>
				<p>
					<span>&nbsp;&nbsp;</span>
					<span>· 2FACE는 전국 무료배송을 실시하고 있습니다.</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 단, 교환/반품시에는 왕복 배송비가 청구됩니다.</span>
				</p>
				<p>&nbsp;&nbsp;</p>
				
				<p>4. 묶음배송</p>
				<p>
					<span>&nbsp;&nbsp;</span>
					<span>· 2개 이상 제품 구매시 제품의 출고지가 같은 경우에만 묶음 배송이 가능합니다.</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 제품의 수입사 혹은 본사 출고 제품의 경우 각각 발송되는 경우가 있습니다.</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 먼저 주문하신 상품과 새로운 주문을 묶음 배송 요청하는 경우 전화로 요청해 주시기 바랍니다.</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 게시판을 통해 묶음 배송을 신청할 경우, 확인 지연에 따른 개별 배송이 있을 수 있습니다.</span>
				</p>
				<p>&nbsp;&nbsp;</p>
			</div>
		</div> <!-- delivery end -->
		
		<div id="exchange">
			<div class="goodsTab">
				<div class="exchange">
					<ul>
						<li><a href="#detail">상품상세정보</a></li>
						<li><a href="#delivery">배송안내</a></li>
						<li class="on"><a href="#exchange">교환 및 반품안내</a></li>
						<li><a href="#reviews">상품후기</a></li>
						<li><a href="#qna">상품문의</a></li>
					</ul>
				</div>
			</div>
			
			<div class="exContent">
				<h3>교환 및 반품안내</h3>
				<p>1. 교환/반품이 불가능한 경우</p>
				<p>
					<span style="color:rgb(255,0,0);">&nbsp;&nbsp;</span>
					<span style="color:rgb(255,0,0);">· 고객의 부주의로 인한 파손, 훼손으로 상품의 가치를 상실한 경우, 상품을 사용한 경우, 사용하면서 발견한 제품의 이상은 AS로 집행됩니다.</span><br>
					<span style="color:rgb(255,0,0);">&nbsp;&nbsp;</span>
					<span style="color:rgb(255,0,0);">· 교환, 반품 기간(상품 수령 후 1주일)이 지난 경우, 반송된 제품의 파손, 오염등으로 인핸 재판매가 불가한 경우</span><br>
					<span style="color:rgb(255,0,0);">&nbsp;&nbsp;</span>
					<span style="color:rgb(255,0,0);">· 당일 발송건에 대한 운송장 번호는 보통 오후 7시 전후에 등록됩니다.</span>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;※ 포장 박스 및 설명서 등의 내용물이 분실 또는 훼손된 경우에는 어떠한 경웨도 교환, 반품이 불가합니다.</p>
				</p>
				<p>&nbsp;&nbsp;</p>
				
				<p>2. 교환/반품이 가능한 경우</p>
				<p>
					<span>&nbsp;&nbsp;</span>
					<span>· 제품 수령 후 7일 이내(토,일요일 및 공휴일 제외)</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 제품의 하자 및 불량으로 인한 경우 미사용 상태에서 교환 및 반품 가능 (왕복 배송비 판매자 부담)</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 고객의 단순 변심으로 인한 교환 및 반품의 경우 (왕복 배송비 고객 부담)</span>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;※ 배송비는 계좌로 입금을 원칙으로 하고 있습니다. (상황에 따라 반품 상자에 동봉)</p>
				</p>
				<p>&nbsp;&nbsp;</p>
				
				<p>3. 교환/반품시 주의사항</p>
				<p>
					<span>&nbsp;&nbsp;</span>
					<span>· 주소 및 연락처 오류로 반송된 제품의 왕복 택배비는 고객 부담입니다.</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 구매한 사이트와 구매자 성함, 사유를 메모해서 보내주시면 보다 빠른 처리가 가능합니다.</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 교환 및 반품은 반드시 전화를 통해 신청해주시고 안내에 따라 반송해 주시기 바랍니다.</span>
				</p>
				
				<h3>환불안내</h3>
				<p>
					<span>&nbsp;&nbsp;</span>
					<span>· 주문 상품의 호나불 신청은 상품을 받으신 날로부터 7일 이내에 가능합니다.</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 환불 신청시 최초 결제하신 결제수단으로만 환불이 가능합니다. (카드결제=카드취소, 현금결제=계좌환불)</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 사용하신 적립금도 환불 시 함께 복원됩니다.</span>
				</p>
				
				<h3>AS안내</h3>
				<p>1. 2FACE AS센터 (02-563-8268)</p>
				<p>
					<span>&nbsp;&nbsp;</span>
					<span>· 원활한 AS를 위해서는 각 브랜드 별 한국 수입사에서 발행한 한글정품보증서가 반드시 필요합니다.</span><br>
					<span>&nbsp;&nbsp;</span>
					<span>· 브랜드의 한국 수입사 정책에 따라 한글정품보증서가 없는 경우 AS가 거절될 수 있습니다</span>
				</p>
			</div>
		</div> <!-- exchange end -->
		
		<div id="reviews">
			<div class="goodsTab">
				<div class="exchange">
					<ul>
						<li><a href="#detail">상품상세정보</a></li>
						<li><a href="#delivery">배송안내</a></li>
						<li><a href="#exchange">교환 및 반품안내</a></li>
						<li class="on"><a href="#reviews">상품후기</a></li>
						<li><a href="#qna">상품문의</a></li>
					</ul>
				</div>
			</div>
			
			<div class="revContent">
				<h3 style="margin:0 0 5px 0;">상품후기</h3>
				<div class="btnReview">
					<a href="" style="color:#3e3d3c; background-color: #eee;" >상품후기 전체보기</a>
					<a href="" style="color:#fff; background-color: #343434;">상품후기 글쓰기</a>
				</div>
				<div class="reviewsList">
					<div>
						<table class="reviewTable">
							<colgroup>
								<col width="13%">
								<col>
								<col width="13%">
								<col width="13%">
							</colgroup>
							<thead></thead>
							<tbody>
								<!-- for문 쓰면 여기에서 시작 -->
								<tr class="reviewRow">
									<td class="star">별점</td>
									<td><a href="javascript:void(0)" onclick="openReview(event)">내용1</a></td>
									<td>작성자</td>
									<td>등록날짜</td>
								</tr>
								<tr class="reviewDetail">
									<td class="revDetailBox" colspan="4">
										<div class="revContent">
											<div class="revView">
												<br>
												<br>
												<p>
													내용1입니다.
													<br>
													<br>
													사진1입니다.
													<br>
													<br>
													<br>
												</p>
											</div>
											
											<div class="commentBox">
												<div class="commentTop">
													<span>0개의 댓글이 있습니다</span>
												</div>
												
												<div class="commentList">
													<ul>
														<li><div class="no_data">등록된 댓글이 없습니다.</div></li>
													</ul>
												</div>
											</div>
										</div>
									</td>
								</tr> <!-- reviewDetailBox end -->
								
								
								
								<tr class="reviewRow" id="review1">
									<td class="star">별점</td>
									<td><a href="javascript:void(0)" onclick="openReview(event)">내용2</a></td>
									<td>작성자</td>
									<td>등록날짜</td>
								</tr>
								<tr class="reviewDetail">
									<td class="revDetailBox" colspan="4">
										<div class="revContent">
											<div class="revView">
												<br>
												<br>
												<p>
													내용2입니다.
													<br>
													<br>
													사진2입니다.
													<br>
													<br>
													<br>
												</p>
											</div>
											
											<div class="commentBox">
												<div class="commentTop">
													<span>0개의 댓글이 있습니다</span>
												</div>
												
												<div class="commentList">
													<ul>
														<li><div class="no_data">등록된 댓글이 없습니다.</div></li>
													</ul>
												</div>
											</div>
										</div>
									</td>
								</tr> <!-- reviewDetailBox end -->
							</tbody>
						</table>
					</div>
				</div>
			</div> <!-- reviewContent end -->
		</div> <!-- reviews end -->
		
		<div id="qna">
			<div class="goodsTab">
				<div class="exchange">
					<ul>
						<li><a href="#detail">상품상세정보</a></li>
						<li><a href="#delivery">배송안내</a></li>
						<li><a href="#exchange">교환 및 반품안내</a></li>
						<li><a href="#reviews">상품후기</a></li>
						<li class="on"><a href="#qna">상품문의</a></li>
					</ul>
				</div>
			</div>
			
			<div class="qnaContent">
				<h3 style="margin:0 0 5px 0;">상품 Q&A</h3>
				<div class="btnReview">
					<a href="" style="color:#3e3d3c; background-color: #eee;" >상품문의 전체보기</a>
					<a href="" style="color:#fff; background-color: #343434;">상품문의 글쓰기</a>
				</div>
				<div class="qnasList">
					<div>
						<table class="qnaTable">
							<colgroup>
								<col width="13%">
								<col>
								<col width="13%">
								<col width="13%">
							</colgroup>
							<thead></thead>
							<tbody>
								<!-- for문 쓰면 여기에서 시작 -->
								<tr class="qnaRow">
									<td class="no_data" colspan="4">등록된 상품문의가 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div> <!-- reviewContent end -->
			</div>
		</div>
	</div> <!-- contentBox end -->
</body>
<script>
	function add(quantity) {
		var cQuantity = Number(document.getElementById("quantity").value);
		cQuantity = cQuantity;
		cQuantity += quantity;
		if(cQuantity<1) {
			cQuantity=1;
		}
		document.getElementById("quantity").value = cQuantity;
	}
	function addCart(id, pno) {
		var cQuantity = document.getElementById("quantity").value;
		url = "cartPro.jsp?oper=0&pno=" + pno + "&quantity=" + cQuantity;
		window.open(url, "장바구니 담기", "width=400, height=250;");
	}
	function changeImg(img) {
		var mainImg = document.getElementById("mainImg");
		mainImg.style.background = "url('"+img+"')";
	}
	
	function openReview(event) {
		var tr = event.target.parentNode.parentNode.nextSibling;
		var trNext = tr.nextSibling;
		if(trNext.style.display=="" || trNext.style.display=="none") {
			trNext.style.display="table-row";			
		}else {
			trNext.style.display="none";			
		}
		
	}
</script>
</html>