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
	request.setCharacterEncoding("utf-8");	

	String CarName = request.getParameter("CarName");
	int CarPrice = Integer.parseInt(request.getParameter("CarPrice"));
	String CarColor = request.getParameter("CarColor");
%>
	<h2> 유즈빈 CarMain </h2>
	
	<h3>Car 속성 지정</h3>
	
	<jsp:useBean id="Car" class = "common.Car" scope = "request"/>
	<jsp:setProperty property="CarName" name="Car" value = "<%=CarName %>"/>
	<jsp:setProperty property="CarPrice" name="Car" value = "<%=CarPrice %>"/>
	<jsp:setProperty property="CarColor" name="Car" value = "<%=CarColor %>"/>
	
	<h2> Car 자바빈즈 출력 </h2>
	<ul>
		<li>차 이름 : <jsp:getProperty property="CarName" name="Car"/></li>
		<li>차 가격 : <jsp:getProperty property="CarPrice" name="Car"/>억원</li>
		<li>차 색상 : <jsp:getProperty property="CarColor" name="Car"/></li>
	</ul>
</body>
</html>