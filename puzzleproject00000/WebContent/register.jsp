<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="./resources/js/register.js"></script>

<title>회원가입</title>

<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/register.css">
</head>
<body>
	<%@include file="top-menu.jsp" %>
	<div class="container-wrapper">
		<section id="contents">
			<div class="join-member">
				<form action="./registerprocess.do" method="post" name="frm" onsubmit="return checkValue()">
				<script defer src="./resources/js/addressapi.js"></script>
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<fieldset style="border: 0 none;">
						<h3>회원가입</h3>
						<div class="join-table prl60x">
							<div class="text-box mb15 _typeNo">
								<input type="text" id="id" name="id" class="input-login w590x" placeholder="아이디는 4~20자, 영문 대소문자, 숫자만 가능" maxlength="20">
								<button type="button" class="phone-btn btnDarkGray btn-text w180x fr" onclick="openIdChk(document.frm)">중복확인</button>
								<input  type="hidden" name="idDuplication"/>
							</div>
							<div class="text-box mb15">
								<input type="text" id="name" name="name" class="input-login" placeholder="이름">
							</div>
							<div class="text-box mb15 _typeNo">
								<input type="text" id="nickname" name="nickname" class="input-login w590x" placeholder="닉네임">
								<button type="button" class="phone-btn btnDarkGray btn-text w180x fr" onclick="opennicknameChk(document.frm)">중복확인</button>
								<input  type="hidden" name="nicknameDuplication"/>
							</div>
							<div class="text-box">
								<input type="password" id="password_1" name="pw" class="input-login" maxlength="16" placeholder="비밀번호는 최소 8자 최대 16자, 영문자, 숫자 및 특수 문자를 포함">
							</div>
							<div class="text-box mb15">
								<input type="password" id="password_2" name="pwcheck" class="input-login" style="border-top:none" maxlength="16" placeholder="비밀번호 확인">
							</div>
							<div class="text-box mb15">
								<input type="text" id="birth" name="birthday" class="input-login" placeholder="생년월일(8자리)">
							</div>
							<div class="text-box mb15 _typeNo">
								<input type="text" id="email" name="email" class="input-login w590x" placeholder="이메일 (example@gmail.com)">
								<button type="button" class="phone-btn btnDarkGray btn-text w180x fr" onclick="openEmailChk(document.frm)">중복확인</button>
								<input  type="hidden" name="emailDuplication" />
							</div>
							<div class="text-box mb15">
								<button id="auth" type="button" class="submit-btn" style="background-color: #404040;" onclick="authEmailChk(document.frm)">이메일 본인인증</button>
								<input  type="hidden" name="emailAuthenticationKey" value="0"/>
							</div>
							<div class="text-box mb15 _typeNo">
								<input type="text" id="sample6_postcode" name="address1" class="input-login w590x" placeholder="우편번호">
								<button type="button" class="phone-btn btnDarkGray btn-text w180x fr" onclick="checkPost()">주소 찾기</button>
							</div>
							<div class="text-box mb15">
								<input type="text" id="sample6_address" name="address2" class="input-login" placeholder="주소">
							</div>
							<div class="text-box mb15">
								<input type="text" id="sample6_detailAddress" name="address3" class="input-login" placeholder="상세주소">
							</div>
							<div class="text-box mb15">
								<input type="text" id="tel" name="phone" class="input-login" placeholder="휴대폰(-제외)">
							</div>
							<div class="text-box mb15">
								<input type="text" id="recommender" name="recommender" class="input-login" placeholder="추천인(포인트 증정!)">
							</div>
						</div>
						<button type="submit" class="submit-btn" style="background-color: #404040;">회원가입</button>
						<button type="button" class="submit-btn"  onclick="goFirstForm()" style="background-color: #404040;">취소</button>
					</fieldset>
				</form>
			</div>
		</section>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>