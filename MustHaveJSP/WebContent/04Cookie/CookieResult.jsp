<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 쿠키값 확인하기 </h2>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i = 0; i < cookies.length; i++){
				String cookieName = cookies[i].getName();
				String cookieValue = cookies[i].getValue();
				out.print("<br>" + cookieName + " : " + cookieValue);
			}
		}
	%>
</body>
</html>