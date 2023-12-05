<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/mypage-left.css">
<link rel="stylesheet" href="./resources/css/mypage-right.css">
<script type="text/javascript" src="./resources/js/memberdelete.js"></script>

<title>마이페이지_회원정보변경</title>
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
		
		<div class="myPage-right-box">
			<form action="./memberdelete.do" method="post" name="frm" onsubmit="return checkValue()">
			
				<div class="flex_between">
					<label></label>
					<div>
						<h2>${userdto.name }님,&nbsp;&nbsp; 회원탈퇴 하시겠습니까?</h2>
					</div>
				</div>
				<div class="flex_between">
					<div></div>
					<div>
						<input style="height: 30px;   width: 400px;   border: 1px solid lightgray;" type="text" name="email" value="${userdto.email }" maxlength="50" readonly="readonly"/>
						<input  type="hidden" name="id" value="${userdto.id }" maxlength="50"/>
					</div>
				</div>
				<div class="flex_between">
					<div></div>
					<div class = "email-btn-box">
						<input id="auth" type="button" value="이메일 본인인증 하기" onclick="authEmailChk(document.frm)"/>
					</div>
					<input  type="hidden" name="emailAuthenticationKey" class="member-input" value="0"/>
				</div>
		
			
				<div class = "btn-box">
					<input type="submit" id = "edit_btn" value="탈퇴하기"/>
					<input type="button" id = "delete_btn" value="돌아가기" onclick="goMypage()"/>
				</div>
		</form>
	</div>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>