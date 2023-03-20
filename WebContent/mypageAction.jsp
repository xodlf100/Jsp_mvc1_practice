<%@page import="java.io.PrintWriter"%>
<%@page import="showM.Dto.JoinDto"%>
<%@page import="showM.Dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="been" class="showM.Dto.JoinDto">
	<jsp:setProperty property="*" name="been"/>
</jsp:useBean>

<%
	String id = (String) session.getAttribute("id");
	request.setCharacterEncoding("UTF-8");
	PrintWriter script = response.getWriter();
	Dao dao = new Dao();
	dao.myUpdate(been);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		script.println("<script>");
		script.println("alert('수정이 완료되었습니다.')");
		script.println("location.href='mypage.jsp'");
		script.println("</script>");
	%>
</body>
</html>

