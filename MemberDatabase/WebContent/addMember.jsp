<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/member.css">
<title>Insert title here</title>
</head>
<body>
	<div class = "container">
	<h2> 회원 가입 </h2>
		<form class = "container2" action="addProcess.jsp" method = "post">
			아이디 : <input type = "text" name = "id"><br>
			이름 : <input type = "text" name = "name"><br>
			비밀번호 : <input type = "password" name = "pw"><br>
			비밀번호 확인 : <input type = "password" name = "pwCheck"><br> 
			전화번호 : <input type = "tel" name = "tel" placeholder = "010-123-4567"><br>
			이메일 : <input type = "text" name = "email01">@ <select name = "email02">
				<option value = ""> 직접입력 </option>
				<option value = "naver.com"> naver.com </option>
				<option value = "daum.net"> daum.net </option>
				<option value = "google.com"> google.com </option>
 			</select>
 			<br>
			문자수신 여부 :	
			<input type = "radio" name = "select" value = "yes">예
			<input type = "radio" name = "select" value = "no">아니오
			<br>
		
			가입 경로 : 
			<input type = "checkbox" name = "join" value = "friend"> 친구 소개
			<input type = "checkbox" name = "join" value = "internet"> 인터넷 검색
			<input type = "checkbox" name = "join" value = "blog"> 블로그
			<input type = "checkbox" name = "join" value = "etc"> 기타
			<br>
			가입하기 <input type = "submit" value = "전송">
		</form>
	</div>
</body>
</html>