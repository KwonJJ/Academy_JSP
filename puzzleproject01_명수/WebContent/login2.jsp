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
<title>비회원 로그인 페이지</title>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
	<%@include file="top-menu.jsp" %>
		<div class="container">
		<section class="contents">
			<div class="login-member">
				<form action="./loginprocess.do" method="post">
					<fieldset>
					<h3>비회원 주문조회</h3>
					<div class="input-box1">
						<p style="color: red; text-align: center;">${warning }</p>
						<input class="input-login" type="text" name="name" placeholder="주문자명" />
					</div>
					<div class="input-box2">
						<input class="input-login" type="text" name="ordernumber" placeholder="주문번호" />
					</div>
					<div class="login-check">
						<ul class="find-box">
							<li class="fl">계정이 없으신가요? </li>
							<li class="fl"><a href="register.jsp">회원가입</a></li>
						</ul>
					</div>
					<button type="submit" class="login-btn">주문내역 조회하기</button>
					</fieldset>
				</form>
			</div>
		</section>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>



