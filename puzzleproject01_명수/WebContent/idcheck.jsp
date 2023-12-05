<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="./resources/js/register.js"></script>
<title>아이디 중복검사</title>
</head>
<body>
	<h2>아이디 중복 체크</h2>
	<form action="IdCheckServlet.do" method="post" name="idCheckForm">
		<label>아이디</label>
		<input type="text" name="id" value="${id }"/>
		<button type="submit">중복체크</button>
		<br/>
		<c:if test="${result==1 }">
			<p>${id}은 이미 사용중인 아이디입니다.</p>
		</c:if>
		<c:if test="${result==0 }">
			<p>${id}은 사용가능한 아이디입니다.</p>
			<button type="button" onclick="idOk()">
				사용
			</button>
		</c:if>
	</form>
</body>
</html>