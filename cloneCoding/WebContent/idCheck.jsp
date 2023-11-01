<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<% 
	String id = request.getParameter("id"); 
%>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<script type="text/javascript" src = "./resources/js/register.js"></script>
<title>아이디 중복검사</title>
</head>
<body>
	<h2>아이디 중복 체크</h2>
	<form action="idCheckServlet" method = "get" name = "idCheckForm">
		<label>아이디</label>
		<input type = "text" name = "id" value = "<%=id %>"/>
		<button type = "submit">중복체크</button>
		<br />
		<c:if test="${result == 1 }">
			<p>${userId }는 이미 사용 중인 아이디입니다.</p>
		</c:if>

		<c:if test="${result == 0 }">
			<p>${userId }는 사용 가능한 아이디입니다.</p>
			<button type = "submit" onclick = "idOk()">
				사용
			</button>
		</c:if>
	</form>
</body>
</html>