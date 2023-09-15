<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 유즈빈 액션태그 </h2>
	
	<h3> 자바빈즈 사용하기 </h3>
	<jsp:useBean id="person" class = "common.Person" scope="request"/>
	
	<h3>setProperty 액션 태그로 자바빈즈 속성 지정하기 </h3>
	<jsp:setProperty property="name" name="person" value = "임꺽정"/>
	<jsp:setProperty property="age" name="person" value = "40"/>
	
	<!-- <jsp:setProperty property="속성명(멤버 변수)" name="자바빈즈 이름" value = "설정할 값"/> -->
	
	
	<ul>
		<li> 이름 : <jsp:getProperty property="name" name="person"/>
		<li> 나이 : <jsp:getProperty property="age" name="person"/>
	</ul>
	
</body>
</html>