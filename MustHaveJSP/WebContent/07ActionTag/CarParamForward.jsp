<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="car" class = "common.Car" scope = "request"/>
	<ul>
		<li><jsp:getProperty property="carName" name="car"/>
		<li> 차 가격 : <jsp:getProperty property="carPrice" name="car"/>만원</li>
		<li> 차 색상 : <jsp:getProperty property="carColor" name="car"/></li>
		<li> 차 회사 : <%=request.getParameter("param1") %></li>
		<li> 차 최고속도 : <%=request.getParameter("param2") %></li>
		<li> 차 옵션 : <%=request.getParameter("param3") %></li>
		
	</ul>
	
</body>
</html>