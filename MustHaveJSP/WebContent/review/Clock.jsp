<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
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
		response.setIntHeader("Refresh", 5);
	 	// 5초에 한번 새로고침
	 	
		
	 	LocalDateTime today = LocalDateTime.now();
	 	String today2 = today.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH:mm:ss"));
	 	// Calendar
	 	// LocalDate, LocalTime, LocalDateTime
	%>
	<h1> 현재 날짜는 <%=today2 %>입니다. </h1>
</body>
</html>