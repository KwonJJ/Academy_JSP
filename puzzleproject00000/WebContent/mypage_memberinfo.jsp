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

<title>마이페이지_회원정보변경</title>
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
	<div class="myPage-container">
		<div class="myPage-left-box">
			<div class = "myPage-left-menu">
				<a href="mypage_memberinfo.jsp">회원정보변경</a>
			</div>
			<div class = "myPage-left-menu">
				<a href="#">등급별 혜택</a>
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
				<a href="#">찜목록</a>
			</div>
			<div class = "myPage-left-menu">
			<a href="#">상품후기</a>
				</div>
			<div class = "myPage-left-menu">
				<a href="#">고객센터</a>
			</div>
			<div class = "myPage-left-menu">
				<a href="#">회원탈퇴</a>
			</div>
		</div>
		
		<div class="myPage-right-box">
			<form action="./memberedit.do" method="post" name="frm" onsubmit="return checkValue()">
			<script defer src="./resources/js/addressapi.js"></script>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			
				<div class="flex_between">
					<label>아이디</label>
					<div>
						<input  type="text" name="id" class="member-input" value="${userdto.id }" readonly="readonly"/>
					</div>
				</div>
				
				<div class="flex_between">
					<label>비밀번호</label>
					<input type="password" name="pw" class="member-input" size=60 placeholder="비밀번호는 최소 8자 최대 16자, 영문자, 숫자 및 특수 문자를 포함" />
				</div>
				
				<div class="flex_between">
					<label>비밀번호 확인</label>
					<input type="password" class="member-input" size=40 name="pwcheck"/>
				</div>
				
				<div class="flex_between">
					<input  type="hidden" name="email" value="${userdto.email }" maxlength="50"/>
					<div class = "email-btn-box">
						<input id="auth" type="button" value="이메일 본인인증 하기" onclick="authEmailChk(document.frm)"/>
					</div>
					<input  type="hidden" name="emailAuthenticationKey" class="member-input" value="0"/>
				</div>
				
				<div class="flex_between">
					<label>이름</label>
					<input type="text"  name="name" class="member-input" value="${userdto.name}"  readonly="readonly"/>
				</div>
				
				<div class="flex_between">
					<label>닉네임</label>
					<div class = "nikname-box">
					<input type="text" class = "nikname-txt" name="nickname" value="${userdto.nickname}"/>
					<input  type="button" class = "nikname-btn" value="중복확인" onclick="opennicknameChk(document.frm)"/>
					</div>
					<input  type="hidden" name="nicknameDuplication" class="member-input" value="${userdto.nickname }"/>
				</div>
				
				<div class="flex_between">
					<label>생년월일</label>
					<input type="text" name="birthday" class="member-input" maxlength="8" value="${userdto.birthday}"  readonly="readonly" />
					
				</div>
				
				<div class="flex_between">
					<label>주소</label>
					<div class = "address-box1">
						<input type="text" name="address1" id="sample6_postcode" placeholder="우편번호">
						<input type="button" class = "address-btn" onclick="checkPost()" value="우편번호 찾기"><br>
					</div>
				</div>
					<div class = "address-box2">
						<input type="text" name="address2" id="sample6_address" placeholder="주소"><br>
						<input type="text" name="address3" id="sample6_detailAddress" placeholder="상세주소">
					</div>
				
				<div class="flex_between">
					<label>휴대폰번호</label>
					<div class = "phone-txt-box">
						<input type="text" name="phone1" maxlength="3" />
						<input type="text" name="phone2" maxlength="4" />
						<input type="text" name="phone3" maxlength="4" />
					</div>
				</div>
				<div class = "btn-box">
					<input type="submit" id = "edit_btn" value="수정하기"/>
					<input type="button" id = "delete_btn" value="돌아가기" onclick="goMypage()"/>
				</div>
		</form>
	</div>
	</div>
</body>
</html>