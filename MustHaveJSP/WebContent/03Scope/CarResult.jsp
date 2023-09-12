<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="common.Car"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 자동차 영역 속성 </h2>
	<%
		Map<String, Car> maps = (Map<String, Car>)application.getAttribute("maps");
		Set<String> keys = maps.keySet();
			for(String key : keys){
				Car car = maps.get(key);
					out.print("차 종류 : " + car.getCarName() + "<br>");
					out.print("차 가격 : " +  car.getCarPrice() + "만원" + "<br><br>");
					
			}
		
	%>
</body>
</html>