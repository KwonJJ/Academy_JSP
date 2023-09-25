<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원탈퇴</h1>
		</div>
	</div>
		
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h5 class="form-signin-heading">비밀번호를 입력해 주세요</h5>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.print("<div class='alert alert-danger'>");
					out.print("비밀번호가 일치하지 않습니다!");
					out.print("</div>");
				}
			%>
			<h3></h3>
			<form class="form-signin" action="deletememberprocess.jsp" method="post">
				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label> 
					<input type="password" class="form-control" 
					placeholder="비밀번호" name="password" required>
				</div>
				<button class="btn btn-lg btn-success btn-block" 
					type="submit">회원 탈퇴</button>

			</form>
		</div>
	</div>
	
</body>
</html>