<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="./resources/js/register.js"></script>

<title>회원가입</title>
</head>
<body>
		<div>
			<form action="./registerprocess.do" method="post" name="frm" onsubmit="return checkValue()">
			<script defer src="./resources/js/addressapi.js"></script>
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			
				<div>
					<label>아이디</label>
					<div>
						<input  type="text" name="id" size=40  placeholder="아이디는 4~20자, 영문 대소문자, 숫자만 가능."/>
						<input  type="button" value="중복확인" onclick="openIdChk(document.frm)"/>
						<input  type="hidden" name="idDuplication"/>
					</div>
				</div>
				
				<div>
					<label>비밀번호</label>
					<input type="password" name="pw" size=60 placeholder="비밀번호는 최소 8자 최대 16자, 영문자, 숫자 및 특수 문자를 포함" />
				</div>
				<div>
					<label>비밀번호 확인</label>
					<input type="password"  size=40 name="pwcheck"/>
				</div>
				<div>
					<label>이름</label>
					<input type="text"  name="name"/>
				</div>
				<div>
					<label>닉네임</label>
					<input type="text"  name="nickname"/>
					<input  type="button" value="중복확인" onclick="opennicknameChk(document.frm)"/>
					<input  type="hidden" name="nicknameDuplication"/>
				</div>
				<div>
					<label>생년월일</label>
					<input type="text" name="birthday" maxlength="8" placeholder="생년월일 8자리입력하세요" />
					
				</div>
				<div>
					<label>주소</label>
					<input type="text" name="address1" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="checkPost()" value="우편번호 찾기"><br>
					<input type="text" name="address2" id="sample6_address" placeholder="주소"><br>
					<input type="text" name="address3" id="sample6_detailAddress" placeholder="상세주소">
				</div>
				<div>
					<label>이메일</label>
					<div>
						<input type="text" name="email" size=40 placeholder="아이디@주소명" />
						<input  type="button" value="중복확인" onclick="openEmailChk(document.frm)"/>
						<input  type="hidden" name="emailDuplication" />
					</div>
					
					
					<div>
						<input id="auth" type="button" value="이메일 본인인증 하기" onclick="authEmailChk(document.frm)"/>
						<input  type="hidden" name="emailAuthenticationKey" value="0"/>
					</div>
				</div>
				<div>
					<label>휴대폰번호</label>
					<div>
						<input type="text" name="phone1" maxlength="3" />
						<input type="text" name="phone2" maxlength="4" />
						<input type="text" name="phone3" maxlength="4" />
					</div>
				</div>
				<div>
					<label>추천인</label>
					<input type="text" name="recommender" placeholder="추천인 입력시 포인트 증정!"/>
				</div>
				<div>
					<input type="submit" value="회원가입"/>
					<input type="button" value="취소" onclick="goFirstForm()"/>
				</div>
			</form>
		</div>
</body>
</html>