<%@page import="java.text.DecimalFormat"%>
<%@page import="showM.Dto.Dto"%>
<%@page import="java.util.List"%>
<%@page import="showM.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Dao dao = new Dao();
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
<link rel="stylesheet" href="./css/login.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
</head>
<style>
	.header {
		background: #faf6f6f8;
	}
</style>
<body>
	<div class="wrap">
		<%@include file="header.jsp"%>
		<!-- header -->

		<div class="sec_contents">
			<div class="inner row">
				<div class="contents">
					<div class="member">
						<hr>
						<div>MEMBER LOGIN</div>
						<hr>
					</div>
					<form action="./main.jsp" method="post" class="login">
						<div>ID (User name)</div>
						<div>
							<input type="text" />
						</div>
						<div class="pass">Password</div>
						<div>
							<input type="password" />
						</div>
						<div class="join">
							<input type="submit" value="로그인" class="btn btn-4" /> 
							<input type="button" class="btn btn-4" value="회원가입" onclick="location.href='join.jsp'">
						</div>
					</form>
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
