<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "common.Person" %>
	<%
		request.setAttribute("requestInteger", 8282);
		request.setAttribute("requestString", "리퀘스트 영역의 문자열");
		request.setAttribute("requestPerson", new Person("안중근", 31) );
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 리퀘스트 영역에 설정된 값 읽기 </h2>
	<%
		int num1 = (Integer)(request.getAttribute("requestInteger"));
		Person nPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	
	<ul>
		<li> Integer 객체 : <%= num1 %></li>
		<li> String 객체 : <%=request.getAttribute("requestString") %></li>
	</ul>
	<%
		request.getRequestDispatcher("RequestForward01.jsp?name=" + nPerson.getName()).forward(request, response);
		
	%>
</body>
</html>