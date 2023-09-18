<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class = "common.Person"/>
	<jsp:setProperty property="*" name="person"/>
	
	<ul>
		<li> 이름 : <jsp:getProperty property="name" name="person"/></li>
		<li> 나이 : <jsp:getProperty property="age" name="person"/></li>
	</ul>
</body>
</html>