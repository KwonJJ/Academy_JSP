<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("user_id");
	String pw = (String)session.getAttribute("user_pw");
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(id, pw);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원수정</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="row">
			<div class="col-md-5">
				<img src="Uploads/<%=dto.getPhotoimage()%>" style="width:300px;">
			</div>
			
			<div class="col-md-5">
				<form name="login" class="form-signin" action="editmemberprocess.jsp" method="post">
	
					<div class="form-group">
						<label for="inputUserId" class="sr-only">아이디</label> 
						<input type="text" class="form-control"
						name="id" id="inputUserId" readonly value=<%=id%>>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="sr-only">비밀번호</label> 
						<input type="password" class="form-control" 
						placeholder="비밀번호" name="password" id="inputPassword" required>
					</div>
					<div class="form-group">
						<label for="inputName" class="sr-only">이름</label> 
						<input type="text" class="form-control" 
						placeholder="이름" name="name" id="inputName" required>
					</div>
					<div class="form-group">
						<label for="phone" class="sr-only">연락처</label> 
						<input type="text" class="form-control" 
						placeholder="연락처" name="phone" id="phone" required>
					</div>
					<div class="form-group">
						<label for="address" class="sr-only">주소</label> 
						<input type="text" class="form-control" 
						placeholder="주소" name="address" id="address" required>
					</div>
					
					
					<button class="btn btn-lg btn-info btn-block" 
						type="submit">회원수정</button>
	
				</form>
			</div>
		</div>
	</div>

</body>
</html>