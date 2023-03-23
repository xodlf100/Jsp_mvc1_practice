<%@page import="java.io.PrintWriter"%>
<%@page import="showM.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Dao dao = new Dao();
	request.setCharacterEncoding("UTF-8");
	PrintWriter script = response.getWriter();
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>



	<%
		int result = dao.login(id, password);
	
		
		if(result == 1){
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(60*10);
			script.println("<script>");
			script.println("alert('로그인 성공')");	
			script.println("location.href='index.jsp'");
			script.println("</script>");
		}
		if(result == 0){
			script.println("<script>");
			script.println("alert('로그인 실패')");	
			script.println("history.back()");
			script.println("</script>");
		}

	%>
</body>
</html>