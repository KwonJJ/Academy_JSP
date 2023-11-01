<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./resources/css/index.css">
<link rel="stylesheet" href="./resources/css/layout.css">
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<%
	String id = (String)session.getAttribute("id");
%>
</head>
<body class="center-layout-column">
	<img alt="logo" src="./resources/image/싸이월드main.png" width = "200" height = "200">
	
	<h2><%=id %>님 환영합니다.</h2>
	<hr />
	<h2>${id }</h2>
	<button onclick = "location.href='./login.jsp';">
		로그인 페이지로
	</button>
	
	<jsp:include page="footer.jsp" />
</body>
</html>