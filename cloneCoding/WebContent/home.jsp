<%@page import="model.member"%>
<%@page import="model.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./resources/css/index.css">
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel = "stylesheet" href = "./resources/css/home.css">
<script type="text/javascript" src = "./resources/js/home.js"></script>
<%
	memberDAO dao = new memberDAO();
	String id = request.getParameter("id");
	member dto = dao.getMember(id);
%>
<head>
<meta charset="UTF-8">
<title>싸이월드 미니홈피</title>
</head>
<body>
	<div class = "container">
		<div class = "left-box">
			<div class = "box-radius-5 center">${loginUserId }님의 미니홈피</div>
			<div class = "box-radius-5 center">today 222 | Total 1111</div>
			<div class = "box-radius-5 center-layout-column" style = "padding: 10px">
				<img class = "profile" alt="profile" src="./resources/image/<%=dto.getImgName() %>">
				
				<div class = "dot-line"></div>
				
				<div>
					<div class = "box-radius-5">화이팅 문구</div>
					<div>${loginUserId }님의 미니홈피에 오신 것을 환영합니다.!</div>
				</div>
				
				<div class = "dot-line"></div>
				
				<div>
					<div>소개글</div>
					<select id = "pageSelect" onchange="openPage()">
						<option value = "">파도타기</option>
						<option value = "https://www.naver.com">네이버</option>
						<option value = "https://www.google.com">구글</option>
					</select>
				</div>
			</div>
		</div>
		
		<div class = "right-box">
		
			<form action="LogoutServlet" method = "post">
				<input type = "submit" value = "로그아웃">
			</form>
		
			<div class = "box-radius-5 logo-wrapper">
				<img class = "literal-logo" alt="cy-literal-logo" src="./resources/image/Cyworld-literal.svg">
			</div>
			<div class = "box-radius-5 center-layout-column">
				<div class ="bgm-wrapper">
					<p>BGM</p>
				</div>
				<div class = "right-box-content">
					<div>
						<p>일기</p>
						<p>사진</p>
					</div>
					<div style = "border: 1px solid black">
						<div class = "menu-wrapper" style = "display: flex">
							<div class = "menu">투데이</div>
							<div class = "menu">주크박스</div>
						</div>
				
						<div class = "menu-wrapper" style = "display: flex">
							<div class = "menu">사진첩</div>
							<div class = "menu">방명록</div>
						</div>
					</div>
				</div>
					<img class = "big-img" alt="big" src="./resources/image/미니홈피 큰사진.jpg">
			</div>
		</div>
	</div>
</body>
</html>