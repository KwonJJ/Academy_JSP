<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 아이디 비번 출력 </h2>
	<h2><%=request.getAttribute("id") %></h2>
	<h2><%=request.getAttribute("pw") %></h2>
</body>
</html>