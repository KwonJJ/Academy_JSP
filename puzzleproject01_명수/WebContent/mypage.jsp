<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/mypage-left.css">
<link rel="stylesheet" href="./resources/css/mypage-right.css">
<script type="text/javascript" src="./resources/js/memberedit.js"></script>

<title>마이페이지</title>
</head>
<body>
 	<%@include file="top-menu.jsp" %>
	<div class="myPage-container">
		<div class="myPage-left-box">
			<div class = "myPage-left-menu">
				<h1>${userdto.nickname }님의 마이페이지</h1>
				<a href="mypage_memberinfo.jsp">회원정보변경</a>
			</div>
			<div class = "myPage-left-menu">
				<a href="#">장바구니</a>
			</div>
			<div class = "myPage-left-menu">
				<a href="#">주문목록</a>
			</div>
			<div class = "myPage-left-menu">
				<a href="#">결제목록</a>
			</div>
			<div class = "myPage-left-menu">
				<a href="#">최근 본 상품</a>
			</div>
			<div class = "myPage-left-menu">
			<a href="#">상품후기</a>
				</div>
			<div class = "myPage-left-menu">
				<a href="#">고객센터</a>
			</div>
			<div class = "myPage-left-menu">
				<a href="mypage_deletemember.jsp">회원탈퇴</a>
			</div>
		</div>
		
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>