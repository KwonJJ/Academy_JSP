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
	<form action="emailauthServlet.do" method="post" name="emailauthForm">
		<h3>인증암호</h3>
		<input type="text" name="userAuthenticationKey"/>
		<button type="submit">확인</button>
		<br/>
		<c:if test="${result==1 }">
			<p>본인인증 성공</p>
			<button type="button" onclick="emailauthOk()">
				사용
			</button>
		</c:if>
		<c:if test="${result==0 }">
			<p>본인인증 실패</p>
		</c:if>
	</form>
</body>
</html>