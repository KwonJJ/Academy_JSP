<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./resources/css/index.css">
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel="stylesheet" href="./resources/css/addmember.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="center-layout-column">
	<div class="center-layout-column">
		<img class ="logo" alt = "logo" src = "./resources/image/싸이월드main.png" width = "200" height = "200">
	</div>
	
	<div class="center-layout-column">
		<form action="#" method = "post">
		<div class = "box">
			<div>
				<label class = "input">아이디</label>
				<input type = "text" name = "id" class = "id">
			</div>
	
			<div>
				<label class = "input">비밀번호</label>
				<input type = "password" name = "pw" class = "pw">
			</div>
	
			<div>
				<label class = "input">비밀번호확인</label>
				<input type = "password" name = "pwCheck" class = "pw">
			</div>
	
			<div>
				<label class = "input">이메일</label>
				<input type = "text" name = "email" class = "email">
				@
				<select>
					<option>naver.com</option>
					<option>google.com</option>
					<option>daum.net</option>
				</select>
			</div>
	
			<div>
				<label class = "input">전화번호</label>
				<select class = "tel-first">
					<option>010</option>
					<option>011</option>
					<option>016</option>
				</select>
				<input type = "text" name = "tel" class = "tel-middle">
				<input type = "text" name = "tel" class = "tel-final">
			</div>
	
			<div>
				<label class = "input">직급</label>
				<input type ="radio" name = "rank" value = "일반" class = "admin">일반
				<input type ="radio" name = "rank" value = "관리자" class = "admin">관리자
			</div>
		
			<div class = "btn-center">
				<button type = "submit" value = "회원가입">회원가입</button>
			</div>
		</div>
		</form>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>