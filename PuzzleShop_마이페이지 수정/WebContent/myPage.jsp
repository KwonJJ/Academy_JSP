<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="resources/css/mypage-left.css">
<link rel="stylesheet" href="resources/css/mypage-right.css">
<title>마이 페이지</title>
</head>
<body>
	<%@include file="top-menu.jsp" %>

	<div class="myPage-container">
		<div class="myPage-left-box">
			<h2>나의 정보</h2>
			<a href="#">
				<p>주문 내역</p>
			</a> 
			<a href="#">
				<p>찜한 상품</p>
			</a> 
			<a href="#">
				<p>배송지 관리</p>
			</a> 
			<a href="#">
				<p>상품 후기</p>
			</a> 
			<a href="#">
				<p>적립금</p>
			</a> 
			<a href="#">
				<p>쿠폰</p>
			</a> 
			<a href="#">
				<p>개인정보 수정</p>
			</a>
			<div>
				<h3>도움이 필요하신가요?</h3>
				<a href="#">
					<p>1:1 문의하기</p>
				</a>
			</div>
		</div>
		
		<div class="myPage-right-box">
			<div id="myInfo-txt-box">
				<h3>개인 정보 수정</h3>
			</div>
			<div class="flex_between">
				<label>이름</label> 
				<input type="text" name="name" class="member-input" />
			</div>
			<div class="flex_between">
				<label>닉네임</label> 
				<input type="text" name="nikName" class="member-input" />
			</div>
			<div class="flex_between">
				<label>아이디</label> 
				<input type="text" name="id" class="member-input" />
			</div>
			<div class="flex_between">
				<label>새 비밀번호</label>
				<input type="password" name="pw" class="member-input" />
			</div>
			<div class="flex_between">
				<label>새 비밀번호 확인</label>
				<input type="password" name="pwCheck" class="member-input" />
			</div>
			<div class="flex_between">
				<label>생년월일</label> 
				<input type="text" id="birth" name="birth" class="member-input" placeholder="생년월일(8자리)" />
			</div>
			<div class="flex_between">
				<label>휴대폰</label>
				<input type="text" name="phone" class="member-input" placeholder="010-1234-5678" />
			</div>
			<div class="flex_between">
				<label>이메일</label>
				<input type="text" name="email" class="member-input" placeholder="example@naver.com" />
			</div>
			<div class="flex_between">
				<label>주소</label>
				<input type="text" id="address" name="address" class="member-input" placeholder="주소입력" />
			</div>

			<div class="btn-box">
				<input type="button" name="delete" id="delete_btn" value="탈퇴하기" />
				<input type="button" name="edit" id="edit_btn" value="수정하기" />
			</div>
		</div>
	</div>
		
	<%@include file="footer.jsp" %>
</body>
</html>