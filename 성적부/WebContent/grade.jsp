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
			double avg = (dto.getKor() + dto.getEng() + dto.getMat()) / 3;
		%>
		<c:set var="avg" value="<%=avg%>" />
		<tr>
			<th><%=dto.getStudentId()%></th>
			<th><%=dto.getKor()%></th>
			<th><%=dto.getEng()%></th>
			<th><%=dto.getMat()%></th>
			<th>
				<c:choose>
					<c:when test="${avg >= 90 }">A학점</c:when>
					<c:when test="${avg >= 80 }">B학점</c:when>
					<c:when test="${avg >= 70 }">C학점</c:when>
					<c:otherwise>F학점</c:otherwise>
				</c:choose>
			</th>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>