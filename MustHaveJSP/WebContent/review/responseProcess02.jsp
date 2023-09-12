<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String travel = request.getParameter("travel");
	
		if(travel.equals("보라카이")){
			response.sendRedirect("http://www.klook.com/ko/city/40-boracay-things-to-do/");
		}
		
		if(travel.equals("세부")){
			response.sendRedirect("http://www.klook.com/ko/city/97-cebu-things-to-do/");
		}
		
		if(travel.equals("파리")){
			response.sendRedirect("http://www.france.fr/ko/paris");
		}
		
		if(travel.equals("런던")){
			response.sendRedirect("http://www.klook.com/ko/city/106-london-things-to-do/");
		}
	%>
</body>
</html>