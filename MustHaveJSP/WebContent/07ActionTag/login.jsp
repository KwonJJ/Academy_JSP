<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginprocess.jsp" method="post">
		<table>
			<tr>
				<td>
					아이디 : <input type="text" name="id" placeholder="아이디 입력">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호 : <input type="password" name="pw" placeholder="비밀번호 입력">
				<td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>