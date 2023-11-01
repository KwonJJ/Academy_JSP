<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel = "stylesheet" href = "./resources/css/layout.css">
<link rel = "stylesheet" href = "./resources/css/index.css">
<head>
<meta charset="UTF-8">
<title>홈</title>
</head>
<body class="center-layout-column">
	<div class="center-layout-column">
		<img class ="logo" alt = "logo" src = "./resources/image/싸이월드main.png" width = "200" height = "200">
	
		<h3>클론코딩 - 싸이월드에 오신 것을 환영합니다.!</h3>
		<div>
			<a href = "./login.jsp" class = "point">로그인</a>
			<a href = "./Register.jsp">회원가입</a>
		</div>
	</div>
	<jsp:include page = "footer.jsp" />
</body>
</html>