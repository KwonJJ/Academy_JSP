<%@page import="dto.StudentDTO"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	StudentDAO dao = new StudentDAO(); // db연결
	StudentDTO dto = dao.selectStudent();
	// dto 객체에 이름, 학번, 성별 데이터가 삽입됨
	
	
	dao.close(); // db연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 이름 : <%=dto.getName() %></h1>
	<h1> 학번 : <%=dto.getStudentId() %></h1>
	<h1> 성별 : <%=dto.getGender() %></h1>
	<h1> 국어 : <%=dto.getKor() %></h1>
</body>
</html>