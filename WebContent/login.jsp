<%@page import="java.text.DecimalFormat"%>
<%@page import="com.showM.Dto.Dto"%>
<%@page import="java.util.List"%>
<%@page import="com.showM.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Dao dao = new Dao();
%>
<!DOCTYPE html>
<html lang="en">
<%@include file="front_header.jsp"%>
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
