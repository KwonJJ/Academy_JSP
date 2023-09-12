<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 가을 최고 여행지는? </h1>
	<form action="responseProcess02.jsp" method = "get">
	<select name = "travel">
		<option value = "보라카이">보라카이</option>
		<option value = "세부">세부</option>
		<option value = "파리">파리</option>
		<option value = "런던">런던</option>
	</select>
	<br>
	<input type = "submit" value = "전송">
	</form>
</body>
</html>