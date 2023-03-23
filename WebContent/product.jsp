<%@page import="java.text.DecimalFormat"%>
<%@page import="showM.Dto.Dto"%>
<%@page import="java.util.List"%>
<%@page import="showM.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Dao dao = new Dao();
	String id = (String)session.getAttribute("id");
	if(id == null){
		id = "guest";
	}
	String idx = request.getParameter("idx");
	Dto dto = dao.getProduct(idx);
	List<Dto> dtoo = dao.LimitSel();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>product</title>
<link rel="stylesheet" href="./css/reset.css" />
<link rel="stylesheet" href="./css/common.css" />
<link rel="stylesheet" href="./css/product.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
</head>
<style>
	
	
	
	
</style>
<body>
	<div class="wrap">
		<%@include file="header.jsp"%>
		<!-- header -->
		
		<div class="sec_contents">
			<div class="contents">
				<div class="main1">
					<div class="main1_1"><img src="<%=dto.getPicture() %>" alt="asdf"></div>
					<p class="middle_text">WITH ITEM</p>
					<hr>
					<ul class="limitSel">
					<%
					for(int i=0; i < dtoo.size(); i++){
						Dto a = dtoo.get(i);
					%>
						<a class="limitSel_li" href="product.jsp?idx=<%=a.getIdx()%>"><img src="<%=a.getPicture() %>" alt="WITH ITEM"></a>					
					<%
					}
					%>	
					</ul>
					<hr>
					<div class="benefit"><img src="./img/product.jpg" alt="product"></div>
				</div>
				<div class="main2">
					<div class="main2_1">
						<hr>
						<div class="detail">
							<ul>
								<li>상품명</li>
								<li><%=dto.getTitle() %></li>
							</ul>
							<ul>
								<li>세부 사항</li>
								<li><%=dto.getContents() %></li>
							</ul>
							<ul>
								<li>price</li>
								<li><%=dto.getPrice() %></li>
							</ul>
							<ul>
								<li>환불조건</li>
								<li>배송 완료 후 7일 이내에 가능합니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- contents -->

		

		<%@include file="footer.jsp"%>
		<!-- footer -->

</div>
	<!-- wrap -->
</body>
</html>
