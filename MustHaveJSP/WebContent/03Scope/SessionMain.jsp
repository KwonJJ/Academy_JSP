<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
		ArrayList<String> lists = new ArrayList<String>();
		lists.add("리스트");
		lists.add("컬렉션");
		session.setAttribute("lists", lists);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 페이지 이동 후 세션 영역의 속성 읽기 </h2>
	<a href="SessionLocation.jsp"> 세션 이동하기 </a>
</body>
</html>