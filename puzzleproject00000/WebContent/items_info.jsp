<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel="stylesheet" href="./resources/css/main.css">
<link rel="stylesheet" href="./resources/css/info_img.css">
<link rel="stylesheet" href="./resources/css/info_layout.css">
<meta charset="UTF-8">
<title>상품 상세보기</title>
</head>
<body>
	<%@ include file="top-menu.jsp"%>
	<%@ include file="left-menu.jsp"%>

	<div class="container">
		<div class="product_box">
			<div class="product_view">
				<h2>상품 정보 - 상품 이름</h2>
				<table>
					<colgroup>
						<col style="width: 180px" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>판매가</th>
							<td class="product_price">${productdto.productUnitPrice }</td>
						</tr>
						<tr>
							<th>상품 코드</th>
							<td>${productdto.productId }</td>
						</tr>
						<tr>
							<th>브랜드</th>
							<td>${productdto.productBrand }</td>
						</tr>
						<tr>
							<th>구매 수량</th>
							<td>
								<div class="product_length">
									<input type="number" min="1" value="1" name="number"/>
								</div>
							</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>무료 배송</td>
						</tr>
						<tr>
							<th>결제 금액</th>
							<td class="total_price"><b>${productdto.productUnitPrice }</b>원</td>
						</tr>
					</tbody>
				</table>

				<div class="img_box">
					<img class="info_img" src="./resources/images/${productdto.productImage }" alt="상세보기 이미지 예시" />
				</div>

				<div class="product_btn">
					<a href="#" class="basket_btn">장바구니</a>
					<a href="#" class="buy_btn">구매하기</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "product_info_img_container">
		<h1>상품 정보</h1>
		<img class = "product_info_img" alt="상품 정보" src="./resources/images/상품정보이미지예시.jpg">
	</div>


	<div class = "product_review_container">
		<h1>구매 후기</h1>
		<div class = "product_review_box">
			<form action="#">
				<textarea></textarea>
				<button type = "submit">구매후기 등록</button>
			</form>
		</div>
	</div>
</body>
</html>