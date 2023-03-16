<%@page import="showM.Dto.JoinDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="showM.Dto.Dto"%>
<%@page import="java.util.List"%>
<%@page import="showM.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
	String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원가입</title>
<link rel="stylesheet" href="./css/reset.css" />
<link rel="stylesheet" href="./css/common.css" />
<link rel="stylesheet" href="./css/join.css" />
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
						<div>MEMBER 회원가입</div>
						<hr>
					</div>
					<form action="./joinAction.jsp" method="post" class="login" name="frm1" onsubmit="return goCheck()">
						<div>ID (User name)</div>
						<div>
							<input type="text" name="id" class="idInput"/>
							<input type="button" value="중복확인" class="check" onclick="idCheck()">
							<input type="hidden" value="idUncheck" name="idDup">
						</div>
						<div class="pass">Password</div>
						<div>
							<input type="password" name="password" class="pwdInput"/>
						</div>
						<div>이름</div>
						<div>
							<input type="text" name="name" class="nameInput"/>
						</div>
						<div>email</div>
						<div>
							<input type="text" name="email" class="mail"/>@
							<select class="sel">
								<option value="naver">naver.com</option>
								<option value="hanmail">hanmail.com</option>
								<option value="gmail">gmail</option>
								<option value="직접입력">직접입력</option>
							</select>
						</div>
						<div class="join">
							<input type="submit" value="회원가입" class="btn btn-4" /> 
							 <input type="button" value="뒤로가기"class="btn btn-4" onclick="location.href='login.jsp'">
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
	
	<script>

	
	
	
	
	
	var flag = false;
	
	var id = document.querySelector('.idInput');
	var idValue;
	

	
	function goCheck(){
		if(flag){
			
		tf = document.frm1;
		if (tf.id.value == "") {
			alert("아이디를 입력해주세요.")
			tf.id.focus();
			return false;
		}
		if (tf.password.value == "") {
			alert("비빌번호를 입력해주세요.")
			tf.password.focus();
			return false;
		}
		if (tf.name.value == "") {
			alert("이름을 입력해주세요.")
			tf.name.focus();
			return false;
		}
		if (tf.email.value == "") {
			alert("이메일를 입력해주세요.")
			tf.email.focus();
			return false;
		}
		} else {
			alert("중복 체크를 먼저 진행해주세요.")
			return false;
		}
		
		return true;
		
	}
	
	
	<%
		Dao dao = new Dao();
		List<JoinDto> jo = dao.check();
		System.out.print(jo);
	%>
	
	function idCheck(){
		
			var idValue = id.value;
			
		
			<%
				for(int i=0; i<jo.size() ;i++){ 
					JoinDto j = jo.get(i);
			%>
						
					if(idValue == '<%=j.getId()%>'){
						alert('아이디가 존재합니다.');
						return
					}
			<%
				}
			%>
			
			
			alert('회원가입이 가능합니다.');
			flag = true
			
			
		
		
	}

	
	


</script>
</body>
</html>
