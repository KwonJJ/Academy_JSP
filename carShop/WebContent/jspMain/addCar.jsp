<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<div class="container">
		<h1>상품 등록</h1>
	</div>

	<div class="container">
		<form name="newCar" action="processAddCar.jsp" method="post">
			<label>상품 코드</label>
			<div>
				<input type="text" name="carId">
			</div>
			<label>차량 종류</label>
			<div>
				<input type="text" name="carType">
			</div>
			<label>차량 회사</label>
			<div>
				<input type="text" name="carCompany">
			</div>
			<label>차량 가격</label>
			<div>
				<input type="text" name="carCost">
			</div>
			<label>차량 색상</label>
			<div>
				<input type="text" name="carColor">
			</div>
			<label>차량 옵션</label>
			<div>
				<input type="text" name="carOption">
			</div>

			<div>
				<input type="submit" value="등록">
			</div>

		</form>
	</div>
</body>
</html>