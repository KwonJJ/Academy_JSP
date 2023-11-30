<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//쿠키가져오기
Cookie[] cookies = request.getCookies();
if(cookies != null){
    for(Cookie tempCookie : cookies){
        if(tempCookie.getName().equals("id")){
            response.sendRedirect("welcome.jsp");
        }
    }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
	
	<div>
		<div>
			<h1>${warning }</h1>
			<form action="./loginprocess.do" method="post">
				<div>
					<div>
						아이디
						<input type="text" name="id" />
					</div>
					<div>
						비밀번호
						<input type="password" name="pw" />
					</div>
					<div>
					   자동로그인<input type = "checkbox" name="autologin">
					</div>
					<div>
						<button type="submit">로그인</button>
					</div>
				</div>
			</form>
			<p >
				계정이 없으신가요? <a href="register.jsp">회원가입</a>
			</p>
			<p >
				비회원 로그인 하시겠습니까? <a href="login2.jsp">비회원 로그인</a>
			</p>
		</div>
	</div>
	
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
							<input class="checkbox" type="checkbox" id="idSave" name="idSave">
							<label for="idSave" >아이디 저장</label>
							<input type="checkbox" id="autoLogin" name="autoLogin" value="Y">
							<label for="autoLogin" >자동 로그인</label>
						</div>
						<ul class="find-box">
							<li class="fl"><a href="#">아이디 찾기</a></li>
							<li class="fl"><a href="#">비밀번호 찾기</a></li>
							<li class="fl"><a href="#">회원가입</a></li>
						</ul>
					</div>
					<button type="button" class="login-btn">로그인</button>
					</fieldset>
				</form>
			</div>
			<div class="nomember"></div>
		</section>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>


