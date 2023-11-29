<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel="stylesheet" href="./resources/css/main.css">
<link rel="stylesheet" href="./resources/css/nav.css">
<link rel="stylesheet" href="./resources/css/left_menu.css">
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
							<td class="product_price">상품 가격</td>
						</tr>
						<tr>
							<th>상품 코드</th>
							<td>상품 코드 내용</td>
						</tr>
						<tr>
							<th>제조사 / 공급사</th>
							<td>제조사 내용 / 공급사 내용</td>
						</tr>
						<tr>
							<th>구매 수량</th>
							<td>
								<div class="product_length">
									<input type="number" min="1" value="1" />
								</div>
							</td>
						</tr>
						<tr>
							<th>사용 가능 쿠폰</th>
							<td>0개</td>
						</tr>
						<tr>
							<th>옵션 선택</th>
							<td>
								<select>
									<option>기본(+0)</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>무료 배송</td>
						</tr>
						<tr>
							<th>결제 금액</th>
							<td class="total_price"><b>123,123</b>원</td>
						</tr>
					</tbody>
				</table>

				<div class="img_box">
					<img class="info_img" src="./resources/images/상세보기이미지예시.png" alt="상세보기 이미지 예시" />
					<ul>
						<li>
						<a href="#">
							<img class="on" src="./resources/images/상세보기이미지예시.png" alt="상세보기 이미지 예시" />
						</a> 
						<a href="#">
							<img src="./resources/images/상세보기이미지예시.png" alt="상세보기 이미지 예시" />
						</a>
						</li>
					</ul>
				</div>

				<div class="product_btn">
					<a href="#" class="basket_btn">장바구니</a>
					<a href="#" class="buy_btn">구매하기</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>