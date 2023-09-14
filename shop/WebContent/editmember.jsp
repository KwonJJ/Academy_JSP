<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script>
	function check(){
		var pw1 = document.getElementById("inputPassword").value;
		var pw2 = document.getElementById("inputPassword2").value; 
		
		if(pw1!==pw2){
			alert("비밀번호가 서로 다릅니다");
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />


	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보 수정</h1>
		</div>
	</div>

	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-5">
			<h5 class="form-signin-heading">정보를 입력해주세요</h5>

			<form name = "edit" class = "form-signin" action="editMemberProcess.jsp" method = "post"  onsubmit="return check()" >
			
				<div class="form-group">
					<label for="inputUserId" class="sr-only">아이디</label> 
					<input type="text" class="form-control" placeholder="아이디" 
					name="id" id="inputUserId"  value="<%= session.getAttribute("user_id") %>" disabled required autofocus>
				</div>
			
				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label> 
					<input type="password" class="form-control" 
					placeholder="비밀번호" name="password" id = "inputPassword" required>
				</div>
				
				<div class="form-group">
					<label for="inputPassword2" class="sr-only">비밀번호 확인</label> 
					<input type="password" class="form-control" 
					placeholder="비밀번호 확인" name="password2" id="inputPassword2"  required>
				</div>

				<div class="form-group">
					<label for="inputName" class="sr-only">이름</label> 
					<input type="text" class="form-control" placeholder="이름" 
					name="name" id = "inputName" value ="<%= session.getAttribute("user_name") %>" disabled required autofocus>
				</div>

				<div class="form-group">
					<label for="inputPhone" class="sr-only">연락처</label> 
					<input type="tel" class="form-control" 
					placeholder="연락처 입력" name="phone" id = "inputPhone" required>
				</div>

				<div class="form-group">
					<label for="inputAddress" class="sr-only">주소</label> 
					<input type="text" class="form-control" 
					placeholder="주소 입력" name="address" id = "inputAddress" required>
				</div>
				
				<button class="btn btn-lg btn-success btn-block" type="submit">회원정보 수정</button>
			</form>
		</div>
	</div>

<%@ include file="footer.jsp" %>
</body>
</html>