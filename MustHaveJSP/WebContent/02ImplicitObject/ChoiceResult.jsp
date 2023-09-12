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
		String fr = request.getParameter("fruit");
		String none = request.getParameter("none");
		
		// result파일에서 if문 추가
		// 만약 넘어온 값이 none라면 다시 돌아가기(Choice.jsp)
		// 파라미터값을 가지고 돌아가기
		// 최종출력 : 좋아하는 과일이 없군요.
		if(fr.equals("none")){
			request.getRequestDispatcher("Choice.jsp?none=1").forward(request, response);
		}
	%>
	<h1>당신이 좋아하는 과일은 <%=fr %>입니다.</h1>
</body>
</html>