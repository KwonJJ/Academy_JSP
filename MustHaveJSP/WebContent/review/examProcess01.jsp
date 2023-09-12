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
		String pw = request.getParameter("pw");
		
		if(pw.equals("1234")){
			response.sendRedirect("result01.jsp");
		} else{
			request.getRequestDispatcher("exam01.jsp?pwErr=1").forward(request, response);
			// ? -> 변수선언, 1은 pwErr이란 변수에 1의 값을 저장시킨거임
		}
	%>
</body>
</html>