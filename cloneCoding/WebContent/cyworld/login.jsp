<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./resources/css/index.css">
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel="stylesheet" href="./resources/css/login.css">
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body class="center-layout-column">
	<div class="center-layout-column">
	<a href = "index.jsp">
		<img class="logo" alt="logo" src="./resources/image/싸이월드main.png" width="200" height="200">
	</a>

		<div class="center-layout-column">
			<form action="#" method="post">
			<div class = "box">
				<div class = "input-wrapper">
					<label>아이디</label> 
					<input type="text" name="id" />
				</div>
				
				<div class = "input-wrapper">
					<label>비밀번호</label> 
					<input type="password" name="pw" />
				</div>
				
				<div class = "right">
				<button type="submit">로그인</button>
				</div>
			</div>
			</form>
			<p class = "register right">
				계정이 없으신가요?<a href="#" class="point">회원가입</a>
			</p>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>