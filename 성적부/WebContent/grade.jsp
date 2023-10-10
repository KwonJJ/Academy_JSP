<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.StudentDAO"%>
<%@page import="dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String point = request.getParameter("point");
	StudentDAO dao = new StudentDAO();
	
	List<StudentDTO> studentlist = dao.selectAll(point);

	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<table border="1">
			<tr>
				<td>
					학점 : <input type="text" name="point"> 
					<input type="submit" value="찾기">
				</td>
			</tr>
		</table>
	</form>
	<table border="1">
		<tr>
			<th>학번</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>학점</th>
		</tr>
		<%
			for (StudentDTO dto : studentlist) {
		%>
		<tr>
			<th><%=dto.getStudentId()%></th>
			<th><%=dto.getKor()%></th>
			<th><%=dto.getEng()%></th>
			<th><%=dto.getMat()%></th>
			<th><%=dto.getPoint()%></th>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>