<%@page import="model.memberDAO"%>
<%@page import="model.member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./resources/css/index.css">
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel = "stylesheet" href = "./resources/css/home.css">
<link rel = "stylesheet" href = "./resources/css/guestbook.css">
<head>
<%
	memberDAO dao = new memberDAO();
	String id = request.getParameter("id");
	member dto = dao.getMember(id);
%>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<div class = "container-1">
		<div class = "userInfo">
			<div>No.넘버</div>
			<div>닉네임</div>
			<div>날짜</div>
		</div>
		
		<div class = "container-2">
			<div class = "box-radius-5 center-layout-column">
				<img class = "profile" alt="profile" src="./resources/image/<%=dto.getImgName() %>>">
			</div>
			<div class = "context">
				<textarea rows="15" cols="60"></textarea>
			</div>
		</div>
	</div>
</body>
</html>