<%@page import="showM.Dao.Dao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = (String)session.getAttribute("id");
	Dao dao = new Dao();
	PrintWriter script = response.getWriter();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>

</head>
<body>
	
<%
	dao.Withdrawal(id);
	script.println("<script>");
	script.println("alert('탈퇴가 완료되었습니다.')");
	script.println("location.href='index.jsp'");
	script.println("</script>");
	session.invalidate();
%>
</body>
</html>