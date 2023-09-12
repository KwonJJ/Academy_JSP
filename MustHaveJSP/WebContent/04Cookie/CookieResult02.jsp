<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();
		if( cookies != null ){
			for(int i = 0; i < cookies.length; i++){
				String cookieId = cookies[i].getName();
				String cookiePw = cookies[i].getValue();
				out.print(cookieId + " : " + cookiePw);
			}
		}
	%>
</body>
</html>