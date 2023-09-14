<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<script></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>
		
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-5">
			<h5 class="form-signin-heading">아이디와 비밀번호를 입력해주세요</h5>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.print("<div class='alert alert-danger'>");
					out.print("아이디가 중복되었습니다.");
					out.print("</div>");
				}
				
			%>
			<form name = "login" class="form-signin" action="AddMemberProcess.jsp" method="post">

				<div class="form-group">
					<label for="inputUserId" class="sr-only">아이디</label> 
					<input type="text" class="form-control" placeholder="아이디" 
					name="id" id= "inputUserId" required autofocus>
				</div>

				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label> 
					<input type="password" class="form-control" 
					placeholder="비밀번호" name="password" id = "inputPassword" required>
				</div>

				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호 확인</label> 
					<input type="password" class="form-control" 
					placeholder="비밀번호 확인" name="password" id = "inputPassword" required>
				</div>

				<div class="form-group">
					<label for="inputName" class="sr-only">이름</label> 
					<input type="text" class="form-control" 
					placeholder="이름" name="name" id = "inputName" required>
				</div>
				
				<button class="btn btn-lg btn-success btn-block" 
					type="submit">회원가입</button>

			</form>
		</div>
	</div>
	
</body>
</html>