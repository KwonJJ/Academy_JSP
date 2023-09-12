<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 애플리케이션 영역의 속성 읽기 </h2>
	
	<%
		Map<String, Person> maps = (Map<String, Person>)application.getAttribute("maps");
		
		Set<String> keys = maps.keySet();
		for(String key : keys){
			Person person = maps.get(key);
				out.print(person.getName() + " : " + person.getAge() + "<br>");
		}
	%>
</body>
</html>