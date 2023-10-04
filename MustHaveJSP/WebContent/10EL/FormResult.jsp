<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border = 1>
		<tr>
			<td> 이름 </td>
			<td> ${param.name } </td>
		</tr>

		<tr>
			<td> 성별 </td>
			<td> ${param.gender } </td>
		</tr>

		<tr>
			<td> 학력 </td>
			<td> ${param.grade } </td>
		</tr>

		<tr>
			<td> 관심사항 </td>
			<td> 
				${paramValues.inter[0] }
				${paramValues.inter[1] }
				${paramValues.inter[2] }
				${paramValues.inter[3] }
			</td>
		</tr>
	</table>
</body>
</html>