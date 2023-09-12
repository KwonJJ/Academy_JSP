<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>이름과 비밀번호를 입력</h1>
	<%
		String pwErr = request.getParameter("pwErr");
		if(pwErr != null) { 
			// pwErr이 null값이 아니라면 출력
			// pwErr은 1의 값을 넘겨줬으니 null값이 아니라서 출력됨
			out.print("<h2> 비밀번호가 틀렸습니다. </h2>");
		}
	%>
	<form action="examProcess01.jsp" method = "post">
		<p>
			이름 : <input type = "text" name = "name"> <br>
			비밀번호 : <input type = "password" name = "pw"> <br>
			<input type = "submit" value = "전송">
		</p>
	</form>
	
</body>
</html>