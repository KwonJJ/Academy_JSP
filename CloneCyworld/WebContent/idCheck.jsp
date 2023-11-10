<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<link rel="stylesheet" href="./resources/css/idCheck.css" />
<script type="text/javascript" src="./resources/js/register.js"></script>
<title>아이디 중복검사</title>
</head>
<% String id = request.getParameter("id"); %>
<body>
	<div class = "container">
		<h2>아이디 중복 체크</h2>
		<form action="IdCheckServlet" method="get" name="idCheckForm" style = "width: inherit;">
			
			<div class = "id">
				<label>아이디</label>
				<input type="text" name="id" value="<%=id%>"/>
				<button type="submit" class = "check-btn">중복체크</button>
			</div>
			<br />
			
			<div class = "id-ok">
				<c:if test="${result==1}">
					<p><span class = "userId">${userId}</span>는 이미 사용중인 아이디입니다.</p>
				</c:if>
				<c:if test="${result==0}">
					<p><span class = "userId">${userId}</span>은 사용 가능한 아이디입니다.</p>
					<button type="button" onclick="idOk()"class = "ok-btn">
						사용
					</button>
				</c:if>
			</div>
		</form>
	</div>
</body>
</html>