<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<link rel="stylesheet" href="./resources/css/register.css" />
<script type="text/javascript" src="./resources/js/register.js"></script>
<title>회원가입</title>
</head>
<body class="center-layout-column">
	<div class="center-layout-column re-back">
		<img class="logo" alt="logo" src="./resources/img/cyworld.png" />
		<div class="box center-layout-column register">
			<form action="RegisterServlet" method="post" name="frm" enctype="multipart/form-data">
				<div class="flex-between">
		
					<label>아이디</label>
					<div class="w-60 flex-between">
						<input class="w-70 re_input" type="text" name="id" maxlength="20" />
						<input type="hidden" name="dupliId" maxlength="20" />
						<button type="button" onclick="idCheck()">중복확인</button>
					</div>
				</div>
				<div class="flex-between">
					<label>비밀번호</label>
					<input class="w-60 re_input" type="password" name="pw" maxlength="8"/>
				</div>
				<div class="flex-between">
					<label>비밀번호 확인</label>
					<input class="w-60 re_input" type="password" name="pwcheck" maxlength="8"/>
				</div>
				<div class="email-wrapper flex-between">
					<label>이메일</label>
					<div class="w-60 flex-between">
						<input class="w-40 re_input" type="text" name="email"/>
						@
						<select name="com">
							<option value="naver.com">naver.com</option>
							<option value="google.com">google.com</option>
							<option value="kakao.com">kakao.com</option>
						</select>
					</div>
				</div>
				<div class="flex-between">
					<label>전화번호</label>
					<div class="w-60 flex-between">
						<select name="phone-1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
						</select>
						<input class="w-30 re_input" type="text" name="phone-2" maxlength="4"/>
						<input class="w-30 re_input" type="text" name="phone-3" maxlength="4"/>
					</div>
				</div>
				<div class="flex-between">
					<label>직급</label>
					<div class="w-60 re_input">
						<input type="radio" name="grant" value="common"/> 일반
						<input type="radio" name="grant" value="admin"/> 관리자
					</div>
				</div>
				<div class="flex-between">
					<label>사진</label>
					<div>
						<input type="file" name="imgName" />
					</div>
				</div>
				<div class="btn-wrapper">
					<input type="button" value="회원가입" onclick="registerCheck()" class = "re-button"/>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>