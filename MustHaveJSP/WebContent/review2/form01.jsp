<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 회원 가입 </h1>
	<form action="form01Process.jsp" method = "post"> 
		아이디 : <input type = "text" name = "id"> <br>
		비밀번호 : <input type = "password" name = "pw"> <br>
		이름 : <input type = "text" name = "name"><br>
		성별 : 
			<input type = "radio" name = "gender" value = "남성">남성
			<input type = "radio" name = "gender" value = "여성">여성<br>
		취미 : 
		<input type = "checkbox" name = "hobby" value = "독서">독서
		<input type = "checkbox" name = "hobby" value = "운동">운동
		<input type = "checkbox" name = "hobby" value = "영화">영화<br>
		<input type = "submit" value = "전송">
		
	</form>
</body>
</html>