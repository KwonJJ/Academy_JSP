<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Car"%>
<%@ page import="dto.carRepository"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>차 목록</h1>
	<%
		carRepository dao = new carRepository().getInstance();
	ArrayList<Car> allCar = dao.getallCar();

	for (int i = 0; i < allCar.size(); i++) {
		Car car = allCar.get(i);
	%>
	<img src="../resources/images/<%=car.getCarId()%>.jpg">

	<a href="carInfo.jsp?id=<%=car.getCarId()%>" role="button">상세 보기 </a>
	<h3>
		차 회사 :
		<%=car.getCarCompany()%></h3>
	<h3>
		차 종류 :
		<%=car.getCarType()%></h3>
	<%
		}
	%>
</body>
</html>