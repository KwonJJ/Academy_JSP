<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
	<%@include file="top-menu.jsp" %>
	<div class="container">
		<section class="contents">
			<div class="login-member">
				<form action="#" method="post">
					<fieldset>
					<h3>로그인</h3>
					<div class="input-box1">
						<input class="input-login" type="text" name="id" placeholder="아이디" />
					</div>
					<div class="input-box2">
						<input class="input-login" type="password" name="pw" placeholder="비밀번호" />
					</div>
					<div class="login-check">
						<div class="checkbox-wrapper">
							<!-- <input class="checkbox" type="checkbox" id="idSave" name="idSave">
							<label for="idSave" >아이디 저장</label> -->
							<input type="checkbox" id="autoLogin" name="autoLogin" value="Y">
							<label for="autoLogin" >자동 로그인</label>
						</div>
						<ul class="find-box">
							<li class="fl"><a href="#">아이디 찾기</a></li>
							<li class="fl"><a href="#">비밀번호 찾기</a></li>
							<li class="fl"><a href="#">회원가입</a></li>
						</ul>
					</div>
					<button type="submit" class="login-btn">로그인</button>
					<button type="button" class="login-btn" onclick="location.href='#';">비회원주문조회</button>
					</fieldset>
				</form>
			</div>
			<div class="nomember"></div>
		</section>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>