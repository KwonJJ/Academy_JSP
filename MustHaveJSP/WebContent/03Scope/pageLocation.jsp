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
	<h2> 페이지 이동 후 속성값 읽기 </h2>
	<%
		Object pInteger = pageContext.getAttribute("pageInteger");
	%>
	<ul>
		<li> Integer 객체 : <%=(pInteger == null) ? "값 없음" : pInteger %>
	</ul>
</body>
</html>