<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<title>회원가입 성공</title>
<%
	String id = (String) session.getAttribute("id");
%>
</head>	
<body class="center-layout-column">
	<img class="logo" alt="logo" src="./resources/img/cyworld.png" />
	<h2><%=id%>님 환영합니다.</h2>
	<button onclick="location.href='login.jsp';">
		로그인페이지로
	</button>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>