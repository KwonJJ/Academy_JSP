<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 로그인 결과 </h2>
		<ul>
			<li>
				아이디 : <%=request.getAttribute("id") %>
			</li>
			<li>
				비밀번호 : <%=pageContext.getAttribute("pw") %>
			</li>
		</ul>
</body>
</html>