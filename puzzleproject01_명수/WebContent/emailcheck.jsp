<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="./resources/js/register.js"></script>
<title>이메일본인인증</title>
</head>
<body>
	<h2>아이디 중복 체크</h2>
	<form action="EmailCheckServlet.do" method="post" name="emailCheckForm">
		<label>아이디</label>
		<input type="text" name="email" value="${email }"/>
		<button type="submit">중복체크</button>
		<br/>
		<c:if test="${result==1 }">
			<p>${email}은 이미 사용중인 이메일입니다.</p>
		</c:if>
		<c:if test="${result==0 }">
			<p>${email}은 사용가능한 이메일입니다.</p>
			<button type="button" onclick="emailOk()">
				사용
			</button>
		</c:if>
	</form>
</body>
</html>