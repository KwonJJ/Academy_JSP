<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8"); // 한글처리
		String name = request.getParameter("name");
		out.print("당신의 이름은 " + name + "입니다.");
	%>
</body>
</html>