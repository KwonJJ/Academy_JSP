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
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby"); 
		// 변수는 배열로 해주고 Values로 해줘야 여러개 가져올 수 있음.
		
		//향상된 for문
		String hobby2 = "";
		for(String h : hobby){
			hobby2 += h +" ";
		}
		
		// 일반 for문
		String hobby3 = "";
		for(int i = 0; i < hobby.length; i++){
			hobby3 += hobby[i] + " ";
		}
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>비밀번호 : <%=pw %></h3>
	<h3>이름 : <%=name %></h3>
	<h3>성별 : <%=gender %></h3>
	<h3>취미 : <%=hobby2 %></h3>
	<h3>취미 : <%=hobby3 %></h3>
</body>
</html>