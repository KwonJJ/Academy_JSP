<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "menu.jsp" %>

	<div class = "container" align = "center">
		<div class = "col-md-4 col-md-offset-4">
			<h5 class = "form-signin-heading">아이디와 비밀번호를 입력해 주세요.</h5>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.print("<div class = 'alert alert-danger'>");
					out.print("아이디와 비밀번호를 확인해 주세요");
					out.print("</div>");
				}
			%>
			
			<form class = "form-signin" action="loginprocess.jsp" method = "post">
			
				<div class = "form-group">
					<label for = "inputUserName" class = "sr-only">아이디</label>
					<input type = "text" class = "form-control" placeholder = "아이디" name = "id" required autofocus>
				</div>
				
				<div class = "form-group">
					<label for = "inputPassword" class = "sr-only">비밀번호</label>
					<input type = "password" class = "form-control" placeholder = "비밀번호" name = "pw" required autofocus>
				</div>
			</form>
		</div>
	</div>
</body>
</html>