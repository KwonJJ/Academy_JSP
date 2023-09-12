<%@page import="java.time.LocalTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간</title>
<script src="../resources/js/jquery_1.12.4_jquery.min.js"></script>
<script>
	$(function() {
		function getClock() {
			var date = new Date();
			var today = date.toLocaleTimeString();
			// toLocaleTimeString() : 
			// Date객체의 시간 부분 문자열로 변환하고 결과를 반환
			// Date객체의 날짜의 시간 부분을 지역에 맞는 언어 포맷으로 반환하는 메소드
			$("#clock").text(today);
		}
		getClock();
		setInterval(getClock,1000);
	});
</script>
</head>
<body>
	<h1 id="clock"></h1>
</body>
</html>