<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String carOption = "풀옵션";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="car" class = "common.Car" scope = "request"/>
	<jsp:setProperty property="carName" name="car" value = "벤츠 E클래스"/>
	<jsp:setProperty property="carPrice" name="car" value = "8000"/>
	<jsp:setProperty property="carColor" name="car" value = "검정색"/>
	<jsp:forward page="CarParamForward.jsp?param1=벤츠">
		<jsp:param name="param2" value="시속 300km"/>
		<jsp:param name="param3" value="<%=carOption %>"/>
	</jsp:forward>
		
</body>
</html>