<%@page import="dto.carRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>\
<%@ page import="dto.Car"%>
<%@ page import="dto.carRepository"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	String carId = request.getParameter("carId");
	String carType = request.getParameter("carType");
	String carCompany = request.getParameter("carCompany");
	int carCost = Integer.parseInt(request.getParameter("carCost"));
	String carColor = request.getParameter("carColor");
	String carOption = request.getParameter("carOption");

	carRepository cr = new carRepository().getInstance();
	Car newCar = new Car();
	newCar.setCarId(carId);
	newCar.setCarType(carType);
	newCar.setCarCompany(carCompany);
	newCar.setCarCost(carCost);
	newCar.setCarColor(carColor);
	newCar.setCarOption(carOption);

	cr.addCar(newCar);
	response.sendRedirect("carMain.jsp");
	%>
</body>
</html>