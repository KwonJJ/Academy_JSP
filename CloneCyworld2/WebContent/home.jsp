<%@page import="model.memberDAO"%>
<%@page import="model.member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<link rel="stylesheet" href="./resources/css/home.css" />
<script type="text/javascript" src="./resources/js/home.js"></script>
<%
	memberDAO cyMemberDAO = new memberDAO();
	String id = request.getParameter("id");
	member user = cyMemberDAO.GetMember(id);
%>
<title><%=user.getId()%>님의 미니홈피</title>
</head>
<body>
	<div class="container">
		<div class="left-box">
			<div class="box-radius-5 center"><%=user.getId()%>님의 미니홈피</div>
			<div class="box-radius-5 center">Today 222 | Total 1111</div>
			<div class="box-radius-5 center-layout-column">
				<img class="profile" alt="profile" src="./resources/img/<%=user.getImgName()%>" />
				<div class="dot-line"></div>
				<div>
					<div class="box-radius-5">화이팅문구</div>
					<div><%=user.getId()%>님의미니홈피에오신것을환영합니다!</div>
				</div>
				<div class="dot-line"></div>
				<div>
					<div>소개글</div>
					<select id="pageSelect" onchange="openPage()">
						<option value="">파도타기</option>
						<option value="https://www.naver.com">네이버</option>
						<option value="https://www.google.com">구글</option>
					</select>
				</div>
			</div>
		</div>
		
		<div class="right-box">
			<form action="LogoutServlet" method="post">
				<input type="submit" value="로그아웃" />
			</form>
			<div class="box-radius-5 logo-wrapper">
				<img class="literal-logo" alt="cy-literal-logo" src="./resources/img/Cyworld-literal.svg" />
			</div>
			
			<div class="box-radius-5 center-layout-column">
				<div class="bgm-wrapper">
					<p>BGM</p>
				</div>
				<div class="right-box-content">
					<div>
						<p>일기</p>
						<p>사진</p>
					</div>
					<div style="border: 1px solid black">
						<div class="menu-wrapper" style="display: flex">
							<div class="menu">투데이</div>
							<div class="menu">주크박스</div>
						</div>
						
						<div class="menu-wrapper" style="display: flex">
							<a class="menu" href= "./photo.jsp?id=<%=user.getId()%>">
							사진첩
							</a>
							
							<a class="menu" href="./guestbook.jsp?id=<%=user.getId()%>">
								방명록
							</a>
						</div>
					</div>
				</div>
				<img class="big-img" alt="big" src="./resources/img/미니홈피 큰사진.jpg" />
			</div>
		</div>
	</div>
</body>
</html>