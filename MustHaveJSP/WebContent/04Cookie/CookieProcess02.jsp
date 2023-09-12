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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		if (id.equals("abcd") && pw.equals("1234")) {
			Cookie cook_id = new Cookie("userId", id);
			Cookie cook_pw = new Cookie("userPw", pw);
			response.addCookie(cook_id);
			response.addCookie(cook_pw);
			response.sendRedirect("CookieResult02.jsp");
		}
	%>
</body>
</html>