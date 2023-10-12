<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	<c:set var = "expVar" value = "<%=new Date() %>"/>
	<c:set var = "today" value = '<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>' />
	
	<h3> JSTL 변수 출력 </h3>
	
	<ul>
		<li>directVar : ${directVar }</li>
		<li>elVar : ${elVar }</li>
		<li>expVar : ${expVar }</li>
		<li>오늘 날짜 : ${today }</li>
		
	</ul>
</body>
</html>