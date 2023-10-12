<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>url 태그로 링크 걸기</title>
</head>
<body>
	<h4> url 태그로 링크 걸기 </h4>
	<c:url value = "/11JSTL/inc/OtherPage.jsp" var = "url">
		<c:param name="user_param1" value = "Must"/>
		<c:param name="user_param2" value = "Have"/>
	</c:url>
	
	<a href = "${url }" >다른 페이지 연결하기 </a>
</body>
</html>