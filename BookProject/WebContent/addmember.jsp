<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>



	<form action="addmemberProcess.jsp" method = "post">
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
					이름 입력 : <input type = "text" id = "member_name" name = "member_name">
				</td>

			</tr>
			
			<tr>
				<td>
					주소 입력 : <input type = "text" id = "memberaddress" name = "memberaddress">
				</td>

			</tr>
			
			<tr>
				<td>
					전화번호 입력 : <input type = "text" id = "membertel" name = "membertel">
				</td>

			</tr>

			<tr>
				<td>
					<button type = "submit" value = "add">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>