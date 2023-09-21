<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 로그인 페이지 </h1>
	<span style = "color : red; font-size : 1.2em;">
		<%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
	</span>
	
	<%
		if(session.getAttribute("UserId") == null) {
	%>
	<script>
		function validateForm(form){
			if(!form.user_id.value){
				alert("아이디 입력");
				return false;
		 	}
			if(form.user_pw.value == ""){
				alert("비밀먼호 입력");
				return false;
			}
		}
	</script>
	<form action="LoginProcess.jsp" method = "post" name = "loginFrm" onsubmit = "return validateForm(this);">
		아이디 : <input type = "text" name = "user_id"> <br>
		패스워드 : <input type = "password" name = "user_pw"><br>
		<input type = "submit" value = "로그인 하기">
	</form>
	<%
		} else {
			
	%>
		<%= session.getAttribute("UserName")%> 회원님, 로그인 하셨습니다. <br>
		<a href = "Logut.jsp">[로그아웃]</a>
		<a href = "../08Board/Write.jsp">글쓰기</a>
		<a href = "../08Board/List.jsp">목록보기</a>

	<%
		}
	%>
		
</body>
</html>