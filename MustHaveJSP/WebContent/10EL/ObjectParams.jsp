<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setAttribute("personObj", new Person("홍길동", 33));
		request.setAttribute("stringObj", "나는 문자열");
		request.setAttribute("integerObj", new Integer(99));
	%>
	<jsp:forward page = "ObjectResult.jsp">
		<jsp:param value = "10" name = "firstNum" />
		<jsp:param value = "20" name = "secondNum" />
	</jsp:forward>
</body>
</html>