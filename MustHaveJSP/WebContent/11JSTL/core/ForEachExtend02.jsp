<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 리스트 컬렉션 사용하기 </h3>
	<%
		LinkedList<Person> lists = new LinkedList<>();
		lists.add(new Person("맹사성", 34));
		lists.add(new Person("장영실", 44));
		lists.add(new Person("신숙주", 54));
	%>
	
	<c:set var = "lists" value = "<%=lists %>"/>
	<c:forEach var = "list" items = "${lists }">
		<li>
			이름 : ${list.name }, 나이 : ${list.age }
		</li>
	</c:forEach>
	
	<h3> 맵 컬렉션 사용하기 </h3>
	
	<%
		Map<String, Person> maps = new HashMap<>();
		maps.put("1st", new Person("맹사성", 34));
		maps.put("2st", new Person("장영실", 44));
		maps.put("3st", new Person("신숙주", 54));
	%>
	<c:set var = "maps" value = "<%=maps %>"/>
	<c:forEach var = "map" items = "${maps }">
		<li> 키 => ${map.key } <br>
		 	 값 => 이름 : ${map.value.name }, 나이 : ${map.value.age }
		</li>
	</c:forEach>
</body>
</html>