<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/register.css">
</head>
<body>
	<%@include file="top-menu.jsp" %>
	<div class="container-wrapper">
		<section id="contents">

			<div class="join-member">
				<form action="#" method="post" >
				
					<input type="hidden" id="password" name="password">		
					<input type="hidden" id="useragreement" name="useragreement" value="0">		
					<input type="hidden" id="privacyagreement" name="privacyagreement" value="0">
					<input type="hidden" id="emailAgreement" name="emailAgreement" value="0">
					<input type="hidden" id="celphone_chk" name="celphone_chk" value="">
					<input type="hidden" name="join_type" value="">
					
					<fieldset style="border: 0 none;">
						<h3>회원가입</h3>
						<div class="join-table prl60x">
							<div class="text-box mb15 _typeNo">
								<input type="text" id="id" name="id" class="input-login w590x" placeholder="아이디는 4~20자, 영문 대소문자, 숫자만 가능" maxlength="20">
								<button type="button" class="phone-btn btnDarkGray btn-text w180x fr" onclick="smsSand();">중복확인</button>
							</div>
							<div class="text-box mb15">
								<input type="text" id="name" name="name" class="input-login" placeholder="이름">
							</div>
							<div class="text-box mb15 _typeNo">
								<input type="text" id="nickname" name="nickname" class="input-login w590x" placeholder="닉네임">
								<button type="button" class="phone-btn btnDarkGray btn-text w180x fr" onclick="smsSand();">중복확인</button>
							</div>
							<div class="text-box">
								<input type="password" id="password_1" name="password_1" class="input-login" maxlength="16" placeholder="비밀번호는 최소 8자 최대 16자, 영문자, 숫자 및 특수 문자를 포함">
							</div>
							<div class="text-box mb15">
								<input type="password" id="password_2" name="password_2" class="input-login" style="border-top:none" maxlength="16" placeholder="비밀번호 확인">
							</div>
							<div class="text-box mb15">
								<input type="text" id="birth" name="birth" class="input-login" placeholder="생년월일(8자리)">
							</div>
							<div class="text-box mb15 _typeNo">
								<input type="text" id="email" name="email" class="input-login w590x" placeholder="이메일 (example@gmail.com)">
								<button type="button" class="phone-btn btnDarkGray btn-text w180x fr" onclick="smsSand();">중복확인</button>
							</div>
							<div class="text-box mb15 _typeNo">
								<input type="text" id="address1" name="address1" class="input-login w590x" placeholder="우편번호">
								<button type="button" class="phone-btn btnDarkGray btn-text w180x fr" onclick="smsSand();">우편번호 찾기</button>
							</div>
							<div class="text-box mb15">
								<input type="text" id="address2" name="address2" class="input-login" placeholder="주소">
							</div>
							<div class="text-box mb15">
								<input type="text" id="address3" name="address3" class="input-login" placeholder="상세주소">
							</div>
							<div class="text-box mb15">
								<input type="text" id="tel" name="tel" class="input-login" placeholder="휴대폰(-제외)">
							</div>
							<!-- 휴대폰인증? -->
							<!-- 
							<div class="text-box mb15">
								<input type="tel" id="celphone" name="celphone" class="input-login w590x" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="11" placeholder="휴대폰(-제외)">
								<button type="button" class="phone-btn btnDarkGray btn-text w180x fr" onclick="smsSand();">인증번호 발송
							</button></div>
							<div class="text-box _typeNo">
								<input type="text" id="smsConfirmNumber" class="input-login w590x" maxlength="6" placeholder="인증번호 6자리">
								<button type="button" class="phone-btn2 btnDarkGray btn-text  w180x fr" onclick="smsConfirm();" >확인</button>	
							</div>
							-->
							<div class="text-box mb15">
								<input type="text" id="recommender" name="recommender" class="input-login" placeholder="추천인(포인트 증정!)">
							</div>
						</div>
						<button type="button" class="submit-btn" onclick="joinFormSubmit()" style="background-color: #404040;">Puzzle 회원가입</button>

					</fieldset>
				</form>
			</div>
		</section>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>