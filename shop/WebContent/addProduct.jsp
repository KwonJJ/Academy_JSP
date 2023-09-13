<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="menu.jsp"%>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>

	<div class="container">
		<form name="newProduct" action="processAddProduct.jsp"
			class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" name="productId" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="pname" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPirce" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품설명</label>
				<div class="col-sm-3">
					<input type="text" name="description" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="menufacturer" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">재고</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품 상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value = "신상풍"> 신상품
					<input type="radio" name="condition" value = "중고상품"> 중고상품
					<input type="radio" name="condition" value = "재생품"> 재생품
				</div>
			</div>
			
			<div class = "from-group row">
				<div class = "col-sm-offset-2 col-sm-10">
					<input type = "submit" class = "btn btn-primary" value = "등록">
				</div>
			</div>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>