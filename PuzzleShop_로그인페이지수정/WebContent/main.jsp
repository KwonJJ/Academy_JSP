<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
	<%@include file="top-menu.jsp" %>
	<%@include file="left-menu.jsp" %>
	<div class="main-image-wrapper">
		<div class="main-image">
			<img alt="main-image" src="resources/images/main_1.JPG">
		</div>
	</div>
	<%@include file="main-items.jsp" %>
	<%@include file="footer.jsp" %>
</body>
</html>