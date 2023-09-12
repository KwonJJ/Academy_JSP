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
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pwd"); 
		//requset -> 보내는 기능
		
		if(id.equalsIgnoreCase("java") && pw.equals("1234") ){
			//equalsIgnoreCase -> 대소문자 무시하고 비교
			response.sendRedirect("ResponseWelcome.jsp");
			// response -> 가져오는 기능
		} else {
			request.getRequestDispatcher("ResponseMain01.jsp?loginErr=1").forward(request, response);
		}
	%>
</body>
</html>