<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="showM.Dao.Dao"%>
<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	PrintWriter script = response.getWriter();
	String id = request.getParameter("id");
	
		Dao dao = new Dao();
		int result = dao.check(id);
	
	if (result == 0){
		session.setAttribute("check", "1");
		script.println("<script>");
		script.println("alert('사용가능한 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
		
	}
	if (result == 1){
		session.setAttribute("check", "2");
		script.println("<script>");
		script.println("alert('사용 불가능한 아이디 입니다.')");
		script.println("history.back()");
		script.println("</script>");
		
	}
	
%>
</body>
</html>