<%@page import="java.io.PrintWriter"%>
<%@page import="showM.Dao.Dao"%>
<%@page import="showM.Dto.JoinDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="been" class="showM.Dto.JoinDto">
	<jsp:setProperty property="*" name="been"/>
</jsp:useBean>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 처리</title>
</head>
<body>
<%
	Dao dao = new Dao();
	dao.join(been);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원가입이 완료되었습니다.')");	
	script.println("location.href='login.jsp'");
	script.println("</script>");
%>
</body>
</html>