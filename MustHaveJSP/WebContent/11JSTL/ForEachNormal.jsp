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
	<h3> 일반 for문 형태의 forEach 태그 </h3>
	<c:forEach  begin = "1" end = "3" step = "1" var = "i">
	<!-- 
	begin : 시작값
	end : 마지막값
	step : 증가값
	var : 변수명 
	 -->
		<p> 반복 ${i }입니다. </p>	
	</c:forEach>
	
	<h3> 1에서 100까지 정수 중 짝수의 합 </h3>
	<c:forEach begin = "1" end ="100" step = "1" var ="j">
		<c:if test="${ j % 2 == 0 }">
			<c:set var = "sum" value = "${ sum + j }"/>
		</c:if>
	</c:forEach>
	<p> 1 ~ 100 사이의 정수 중 짝수의 합계는 ${sum }입니다.</p>
</body>
</html>