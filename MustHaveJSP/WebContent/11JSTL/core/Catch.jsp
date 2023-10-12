<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4> JSTL에서 예외 처리 </h4>
	<%
		int num1 = 100;
	%>
	<c:catch var = "eMessage">
	<%
		int result = num1 / 0;
	%>
	</c:catch>
	
	예외 내용 : ${eMessage}
</body>
</html>