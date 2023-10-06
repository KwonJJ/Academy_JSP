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
	<c:set var = "directVar" value = "100"/>
	<c:set var = "elVar" value = "${directVar mod 5 }"/> <!-- mod : 나누기 -->
	
	<h3> JSTL 변수 출력 </h3>
	<ul>
		<li>directVar : ${directVar }</li>
		<li>elVar : ${elVar }</li>
	</ul>
</body>
</html>