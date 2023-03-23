<%@page import="showM.Dto.JoinDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="showM.Dto.Dto"%>
<%@page import="java.util.List"%>
<%@page import="showM.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	request.setCharacterEncoding("UTF-8");
	Dao dao = new Dao();
	JoinDto dto = dao.getMember(id);
	
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지</title>
<link rel="stylesheet" href="./css/reset.css" />
<link rel="stylesheet" href="./css/common.css" />
<link rel="stylesheet" href="./css/mypage.css" />
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
						<div><%=dto.getId() %>님 환영합니다.</div>
						<hr>
					</div>
					<form action="./mypageAction.jsp" method="post" class="login" name="frm1">
						<div>ID (User name)</div>
						<div>
							<input type="text" value="<%=dto.getId()%>"name="id" class="idInput" readonly/>
						</div>
						<div class="pass">Password</div>
						<div>
							<input type="password" name="password" class="pwdInput"/>
						</div>
						<div>이름</div>
						<div>
							<input type="text" value="<%=dto.getName() %>" name="name" class="nameInput"/>
						</div>
						<div>email</div>
						<div>
							<input type="text" value="<%=dto.getEmail() %>" name="email" class="mail"/>
						</div>
						<div class="join">
							<input type="submit" value="수정하기" class="btn btn-4" /> 
							 <input type="button" value="회원탈퇴"class="btn btn-4" onclick="check()">
						</div>
					</form>
					<h2 class="ps">* 아이디는 변경할 수 없습니다.</h2>
				</div>
			</div>
		</div>
		<!-- contents -->

		<%@include file="footer.jsp"%>
		<!-- footer -->

	</div>
	<!-- wrap -->

<script>
	function check(){
		if(confirm("정말 탈퇴하시겠습니까?")){
			location.href="WithdrawalAction.jsp";
		} else {
		}
	}
</script>
</body>
</html>
