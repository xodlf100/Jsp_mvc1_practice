<%@page import="showM.Dao.Dao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	PrintWriter script = response.getWriter();
	request.setCharacterEncoding("UTF-8");
	Dao dao = new Dao();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그아웃</title>
</head>
<body>
	<%
		session.invalidate();
		script.println("<script>");
		script.println("alert('로그아웃 완료')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
	%>
</body>
</html>