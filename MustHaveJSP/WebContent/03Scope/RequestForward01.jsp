<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="common.Person"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
	%>
	<%
		Person nPerson = (Person) (request.getAttribute("requestPerson"));
		request.getRequestDispatcher("RequestForward02.jsp?name=" + nPerson.getName()).forward(request, response);
	%>
	<!-- <h1nameame %></h1> -->
</body>
</html>