<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

	<%
		String error = request.getParameter("error");
		if(error != null){
			out.print("<h1>");
			out.print("아이디 혹은 비밀번호가 틀렸습니다.");
			out.print("</h1>");
		}
	%>

	<form action="loginprocess.jsp" method = "post">
		<table>
			<tr>
				<td>
					아이디 입력 : <input type = "text" id = "member_id" name = "member_id">
				</td>

			</tr>
			
			<tr>
				<td>
					비밀번호 입력 : <input type = "password" id = "member_pw" name = "member_pw">
				</td>
			</tr>
			
			<tr>
				<td>
					<button type = "submit" value = "login">로그인</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>