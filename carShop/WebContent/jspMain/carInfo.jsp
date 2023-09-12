<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Car"%>
<%@ page import="dto.carRepository"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 정보</title>
</head>
<body>
	<%@ include file="carHome.jsp"%>
	<%
		String id = request.getParameter("id");
	carRepository dao = new carRepository().getInstance();
	Car car = dao.getCarById(id);
	%>

	<div class="container">
		<img src="../resources/images/<%=car.getCarId()%>.jpg">
		<h1><%=car.getCarType()%></h1>

		<h3>
			차 이름 :
			<%=car.getCarType()%></h3>
		<h3>
			차 회사 :
			<%=car.getCarCompany()%></h3>
		<h3>
			차 가격 :
			<%=car.getCarCost()%>만원
		</h3>
		<h3>
			차 색상 :
			<%=car.getCarColor()%></h3>
		<h3>
			차 옵션 :
			<%=car.getCarOption()%></h3>
	</div>

</body>
</html>