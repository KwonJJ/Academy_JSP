<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div>
		<h1>${userdto.nickname }님의 마이페이지</h1>
		<div>
			<h1>나의 포인트</h1>
			<h1>나의 포인트 랭킹</h1>
			<a href="./logout.do">로그아웃</a>
		</div>
	</div>
	<div>
		<div>
			<a href="mypage_memberinfo.jsp">회원정보변경</a>
			<a href="#">등급별 혜택</a>
			<a href="#">장바구니</a>
			<a href="#">주문목록</a>
			<a href="#">결제목록</a>
			<a href="#">최근 본 상품</a>
			<a href="#">찜목록</a>
			<a href="#">상품후기</a>
			<a href="#">고객센터</a>
			<a href="#">회원탈퇴</a>
		</div>
		<div>
			view
		</div>
	</div>
	
</body>
</html>