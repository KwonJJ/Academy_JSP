<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<title>홈</title>
</head>
<body class="center-layout-column" style = "background-image: url('./resources/img/싸이월드body배경.png');">
	<div class="center-layout-column">
		<img class="logo" alt="logo" src="./resources/img/cyworld.png" />
		<h3>클론코딩 - 싸이월드에 오신것을 환영합니다 !</h3>
		<div>
			<a href="login.jsp" class="point">로그인</a>
			<a href="Register.jsp">회원가입</a>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>