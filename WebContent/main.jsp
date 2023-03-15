<%@page import="java.text.DecimalFormat"%>
<%@page import="com.showM.Dto.Dto"%>
<%@page import="java.util.List"%>
<%@page import="com.showM.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Dao dao = new Dao();
	List<Dto> dto = dao.select();
%>
<!DOCTYPE html>
<html lang="en">
<%@include file="front_header.jsp"%>

<body>
	<div class="wrap">
		<%@include file="header.jsp"%>
		<!-- header -->ssss

		<div class="sec_banner">
			<div class="row">
				<div class="banner">
					<div class="swiper mySwiper">
						<div class="swiper-wrapper">
							<%
								for (int i = 1; i <= 9; i++) {
							%>
							<div class="swiper-slide">
								<img src="./img/<%=i%>.jfif" alt="<%=i%>번" />
							</div>
							<%
								}
							%>
						</div>
						<div class="swiper-pagination"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- banner -->

		<div class="sec_contents">
			<div class="inner row">
				<div class="contents">
					<h2 class="weekly">WEEKLY BEST</h2>
					<ul class="content">
						<%
							for (int i = 0; i < dto.size(); i++) {
								Dto a = dto.get(i);
								DecimalFormat df = new DecimalFormat("###,###");
								int str = a.getPrice();
								String title3_price = df.format(str);
						%>
						<li class="content_li"><a><img src="<%=a.getPicture()%>"
								alt="<%=a.getTitle()%>" /></a>
							<div class="title1"><%=a.getContents()%></div>
							<div class="title2"><%=a.getTitle()%></div>
							<hr>
							<div class="title3"><%=title3_price%>원
							</div></li>
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
