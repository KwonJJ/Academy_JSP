<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h2> 파일 첨부형 비회원제 게시판 - 비밀번호 확인 </h2>

	<form name = "writeFrm" method = "post" action = "../mvcboard/pass.do">
		<input type = "hidden" name = "idx" value = "${param.idx }">
		<input type = "hidden" name = "mode" value = "${param.mode }">
		
		<table border = "1" width = "90%">
			
			<tr>
				<td>비밀번호</td>
				<td><input type = "password" name = "pass" style = "width:100px;" required></td>
			</tr>
			
			<tr> 
				<td colspan = "2" align = "center">
					<button type = "submit">비밀번호 확인</button>
					<button type = "reset">비밀번호 리셋</button>
					<button type = "button" onclick = "location.href = '../mvcboard/list.do';">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>