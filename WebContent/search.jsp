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
	String se = request.getParameter("keyword");
	List<Dto> dto = dao.search(se);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="./css/reset.css" />
<link rel="stylesheet" href="./css/common.css" />
<link rel="stylesheet" href="./css/search.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
</head>

<body>
	<div class="wrap">
		<%@include file="header.jsp"%>
		<!-- header -->
		

		<div class="sec_contents">
			<div class="inner row">
				<div class="contents">
					<ul class="content">
						<%
							for (int i = 0; i < dto.size(); i++) {
								Dto a = dto.get(i);
								DecimalFormat df = new DecimalFormat("###,###");
								int str = a.getPrice();
								String title3_price = df.format(str);
						%>
						<li class="content_li"><a href="./product.jsp?idx=<%=a.getIdx() %>"><img src="<%=a.getPicture()%>"
								alt="<%=a.getTitle()%>" /></a>
							<div class="title1"><%=a.getContents()%></div>
							<div class="title2"><%=a.getTitle()%></div>
							<hr>
							<div class="title3"><%=title3_price%>원
							</div>
							</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</div>
		<!-- contents -->

		<%@include file="footer.jsp"%>
		<!-- footer -->

</div>
	<!-- wrap -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="./js/main.js"></script>
</body>
</html>
