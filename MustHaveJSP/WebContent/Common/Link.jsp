<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table border = "1" width ="90%">
			<tr>
				<td align = "center">
					<% if(session.getAttribute("UserId") == null){ %>
						<a href = "../06session/LoginForm.jsp">로그인</a>
					<% } else { %>
						<a href = "../06session/Logut.jsp">로그아웃</a>
					<% } %>
					
					&nbsp;&nbsp;&nbsp;
					<a href = "../08Board/List.jsp"> 게시판(페이징X)</a>
					
					&nbsp;&nbsp;&nbsp;
					<a href = "../09PagingBoard/List.jsp">게시판(페이징O)</a>							
			</tr>
		</table>
</body>
</html>