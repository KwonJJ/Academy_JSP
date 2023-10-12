<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4> 숫자 포맷 설정 </h4>
	<c:set var = "number1" value = "12345"/>
	<fmt:formatNumber type = "currency" value = "${number1}"/>
	<br>
	<fmt:formatNumber value = "${number1 }" groupingUsed = "false"/>
	<br>
	<fmt:formatNumber value = "${number1 }" type = "percent"/>
	
	<h4> 숫자 패턴 변경 </h4>
	<c:set var = "number2" value = "6,789.01"/>
	<br>
	<fmt:parseNumber value = "${number2 }" pattern = "0,000.00" var = "print3"/>
	소수점까지 출력 : ${print3}
	<br>
	<fmt:parseNumber value = "${number2 }" integerOnly = "true" var = "print4"/>
	정수부분만 출력 : ${print4 }
</body>
</html>