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
	<jsp:setProperty property="carName" name="Car" value = "<%=CarName %>"/>
	<jsp:setProperty property="carPrice" name="Car" value = "<%=CarPrice %>"/>
	<jsp:setProperty property="carColor" name="Car" value = "<%=CarColor %>"/>
	<!-- setProperty 부분의 property안에 첫 글자가 대문자이면 오류남(소문자여야됨) -->
	
	<h2> Car 자바빈즈 출력 </h2>
	<ul>
		<li>차 이름 : <jsp:getProperty property="carName" name="Car"/></li>
		<li>차 가격 : <jsp:getProperty property="carPrice" name="Car"/>억원</li>
		<li>차 색상 : <jsp:getProperty property="carColor" name="Car"/></li>
	</ul>
</body>
</html>