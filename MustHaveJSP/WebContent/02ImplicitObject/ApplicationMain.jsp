<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>web.xml에 설정한 내용 가져오기 </h2>
	초기화 매개변수 : <%=application.getInitParameter("INIT_PARAM") %>
</body>
</html>