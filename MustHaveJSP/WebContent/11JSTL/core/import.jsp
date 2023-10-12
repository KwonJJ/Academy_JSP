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
	<c:set var="requestVar" value="naver" scope="request" />
	<c:import url="../inc/OtherPage.jsp" var="contents">
		<c:param name="user_param1" value="JSP" />
		<c:param name="user_param2" value="기본서" />
	</c:import>
	
	${contents }
	
	<iframe src = "../inc/naverPage.jsp" style = "width : 100%; height: 1000px;"></iframe>
	<!-- 네이버는 보안문제로 제대로 열리진 않음 -->
</body>
</html>