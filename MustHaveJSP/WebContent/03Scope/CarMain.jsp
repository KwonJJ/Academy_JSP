<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="common.Car"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Map<String, Car> maps = new HashMap<>();
		maps.put("actor1", new Car("벤츠", 6000, "흰색"));
		maps.put("actor2", new Car("아우디", 7000, "검정색"));
		application.setAttribute("maps", maps);
	%>
	<h1> 자동차 애플리케이션 저장 완료 </h1>
</body>
</html>