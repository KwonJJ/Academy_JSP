<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<%
		String error = request.getParameter("error");
		if(error != null){
			out.print("<h1>");
			out.print("회원 탈퇴 실패 <br>");
			out.print("비밀번호가 일치하지 않습니다.");
			out.print("</h1>");
		}
	%>
	
	<form action="deleteMemberProcess.jsp" method = "post">
		<table>
			<tr>
				<td>
					비밀번호 입력 : <input type = "password" name = "member_pw">
				</td>
			</tr>

			<tr>
				<td>
					<button type = "submit" value = "delete">회원탈퇴</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>