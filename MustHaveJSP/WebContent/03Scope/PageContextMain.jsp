<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "common.Person" %>
<%
	pageContext.setAttribute("pageInteger", 1000);
	pageContext.setAttribute("pageString", "페이지 영역의 문자열");
	pageContext.setAttribute("pagePerson", new Person("한석봉", 30));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> page 영역의 속성값 읽기 </h2>
	<%
		int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
		String pString = pageContext.getAttribute("pageString").toString();
		Person nPerson = (Person)(pageContext.getAttribute("pagePerson"));
		
		
	%>
	
	<h1><%=pInteger %></h1>
	<h1><%=pString %></h1>
	<h1><%=nPerson.getName() %></h1>
	
	<h2> include된 파일에서 page 영역 읽어오기 </h2>
	<%@ include file = "PageInclude.jsp" %>
	
	<h2> 페이지 이동 후 page 영역 불러오기 </h2>
	
	<a href = "pageLocation.jsp"> 페이지로케이션 바로가기 </a>
</body>
</html>