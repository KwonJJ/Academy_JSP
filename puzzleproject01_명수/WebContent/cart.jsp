<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/cart.css">
</head>
<body>
	<!-- 무신사 장바구니 가져옴 | input type hidden부분은 필요한부분 빼고 지우면 됨 -->
	<%@include file="top-menu.jsp"%>
	<%@include file="left-menu.jsp"%>
	<div class="cart-wrapper" id="page-cart">
		<div class="cart-top">
			<h2 class="title-page">Order / Payment</h2>
			<!--cart process-->
			<div class="page-sorting">
				<span class="current-page">장바구니</span> <span class="arrow">></span>
				<span>주문서</span> <span class="arrow">></span> <span>주문 완료</span>
			</div>
			<!-- end cart process-->
		</div>
		<form name="form11">
			<input type="hidden" name="popup"> <input type="hidden"
				name="logged_in" value=""> <input type="hidden"
				id="coupon_apply_yn" value="">

			<div class="order-cart">
				<div class="order-contents">

					<!--cart products-->
					<table class="table-basic cart-table n-cart-table">
						<colgroup>
							<col width="5%">
							<col width="4%">
							<col width="25%">
							<col width="5%">
							<col width="8%">
							<col width="11%">
							<col width="7%">
							<col width="9%">
							<col width="12%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">전체 <strong>2</strong>개
								</th>
								<th scope="col" style="cursor: pointer"><input
									type="checkbox" class="chk_all" id="chk_all" checked=""
									title="전체 상품 선택"></th>
								<th scope="col">상품명(옵션)</th>
								<th scope="col">판매가</th>
								<th scope="col">회원 할인</th>
								<th scope="col">수량</th>
								<th scope="col">주문금액<br>(적립 예정)
								</th>
								<th scope="col">주문관리</th>
								<th scope="col">배송비/배송 형태</th>
							</tr>
						</thead>
						<tbody>
							<tr class="cart-group">
								<td colspan="9" class="cart-cont">
									<table class="table-basic cart-table n-cart-table">
										<colgroup>
											<col width="5%">
											<col width="4%">
											<col width="25%">
											<col width="5%">
											<col width="8%">
											<col width="11%">
											<col width="7%">
											<col width="9%">
											<col width="12%">
										</colgroup>
										<tbody>
											<tr class="cart-list-no" data-cart-no="954615759">
												<td>1 <input type="hidden" name="no" value="954615759">
													<input type="hidden" id="cart_idx_954615759" value="0">
													<input type="hidden" name="cart_info"
													value="3469199|0|2 (32)"> <input type="hidden"
													name="sale_yn" value="Y"> <input type="hidden"
													name="sales_pause_yn" value="N"> <input
													type="hidden" name="domestic_disable_order_yn" value="N">
													<input type="hidden" name="good_qty" value="139"> <input
													type="hidden" name="good_price" id="good_price_0"
													value="33900"> <input type="hidden"
													name="goods_normal_price" id="goods_normal_price_0"
													value="38000"> <input type="hidden"
													name="goods_opt_price" value="0"> <input
													type="hidden" name="goods_addopt_amt" value="0"> <input
													type="hidden" name="goods_form_type"
													value="DELIVERY_PRODUCT"> <input type="hidden"
													name="dc_amt" value="0"> <input type="hidden"
													name="ptn_dc_amt" value="0"> <input type="hidden"
													name="dlv_amt" value="0"> <input type="hidden"
													name="used_yn" value="N"> <input type="hidden"
													name="offline_goods_yn" value=""> <input
													type="hidden" name="goods_nm"
													value="(올시즌) All-Sunday 와이드 데님 팬츠_그레이"> <input
													type="hidden" name="brand_nm" value="디미트리블랙"> <input
													type="hidden" name="raffle_purchase" value="Y"> <input
													type="hidden" name="raffle_yn" value="N"> <input
													type="hidden" name="app_goods_yn" value=""> <input
													type="hidden" name="use_point_yn" value="N"> <input
													type="hidden" name="sell_dt_yn" value="Y"> <input
													type="hidden" name="sell_s_dt" value="202308251500">
													<input type="hidden" name="sell_e_dt" value=""> <input
													type="hidden" name="exclusive_msspay" value="N"> <input
													type="hidden" name="exclusive_msspay_hyundaicard" value="N">
													<input type="hidden" name="group_dc_limit_yn" value="N">
												</td>
												<td><input type="checkbox" class="checked_cart"
													name="cart_no" value="954615759" checked="checked"
													title="상품 선택"></td>
												<td>
													<div class="connect-img">
														<a href="/app/goods/3469199/0" class="img-block"> <img
															src="//image.msscdn.net/images/goods_img/20230816/3469199/3469199_16928612246762_62.jpg"
															alt="디미트리블랙(DIMITRI BLACK) (올시즌) All-Sunday 와이드 데님 팬츠_그레이">
														</a>
													</div>
													<div class="article-info connect-info">
														<p class="txt-brand"></p>
														<p class="list-info ">
															<a href="/app/goods/3469199/0"> [디미트리블랙] (올시즌)
																All-Sunday 와이드 데님 팬츠_그레이 </a>
														</p>
														<p class="txt-option">옵션: 2 (32) /&nbsp;재고 5개 이상</p>
														<p class="box-coupon-product">
															<a onclick="couponDown('','3469199','0'); return false;"
																href="javascript:void(0)"><span class="icon-dc-06c">￦1,999</span><span
																class="icon-coupon-06c">COUPON</span></a>
														</p>
														<p class="last"></p>
													</div>
												</td>
												<td class="td-price">
													<div class="td-price-wrap">
														<span class="txt-origin-price">38,000</span><br>
														33,900
													</div>
												</td>
												<td>로그인<br>필요
												</td>
												<td><input type="hidden" name="goods_no_954615759"
													value="3469199"> <input type="hidden"
													name="goods_sub_954615759" value="0"> <input
													type="hidden" name="org_cart_qty_954615759" value="1">
													<input type="hidden" name="limited_qty_yn_954615759"
													value=""> <input type="hidden"
													name="limited_total_qty_yn_954615759" value=""> <input
													type="hidden" name="limited_total_qty_period_954615759"
													value="0"> <input type="hidden"
													name="limited_total_qty_period_start_date_954615759"
													value=""> <input type="hidden"
													name="limited_min_qty_954615759" value="1"> <input
													type="hidden" name="limited_max_qty_954615759" value="999">
													<input type="hidden" name="cart_qty"
													id="cart_qty_954615759" value="1" data-origin-quantity="1">
													1</td>
												<td>33,900<br>(0)
												</td>
												<td class="flex-col"><a href="javascript:void(0)"
													onclick="Cart.showOptionModifyLayer('3469199', '2 (32)', '1', '954615759', '1', '33900'); return false;"
													class="plain-btn btn">옵션/수량</a> <a
													href="javascript:void(0)"
													onclick="Cart.deleteCart('954615759'); return false;"
													class="plain-btn btn">삭제하기</a></td>
												<td>택배배송 <br> <strong>배송비무료</strong><br>0원 이상
													무료
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<!--//cart products-->
					<div class="delete-btn-area">
						<a href="javascript:void(0)" id="del_soldout"
							class="click-disalbe"
							onclick="Cart.deleteSoldout(); return false;">품절모두삭제</a> <a
							href="javascript:void(0)" id="del_chk"
							onclick="Cart.deleteSelect(); return false;" class="" style="">선택삭제</a>
					</div>
					<div class="box-explain-cart">
						<ul class="n-info-txt">
							<li>퍼즐은 제주/도서산간 지역 제외 전 지역, 전 상품 무료 배송입니다.</li>
							<li>주문완료 후 출고 전 배송지 변경은 동일 권역(일반, 제주, 제주 외 도서산간 지역) 내에서만
								가능합니다.</li>
							<li>2개 이상의 브랜드를 주문하신 경우, 개별 배송됩니다.</li>
							<li>결제 시 각종 할인 적용이 달라질 수 있습니다.</li>

							<li>해외배송 상품은 배송료가 추가로 발생될 수 있습니다.</li>
							<li>장바구니 상품은 최대 1년 보관(비회원 2일)되며 담은 시점과 현재의 판매 가격이 달라질 수
								있습니다.</li>
							<li>장바구니에는 최대 100개의 상품을 보관할 수 있으며, 주문당 한번에 주문 가능한 상품수는 100개로
								제한됩니다.</li>

							<li>구매 가능 수량이 1개로 제한된 상품은 주문 취소 시, 24시간 내 가상계좌 재주문이 불가합니다.</li>
							<li>수량 제한 상품의 경우, 가상계좌를 통한 주문은 최대 2건까지만 가능합니다.(미입금 주문 기준, 기존
								주문 합산)</li>
						</ul>
					</div>
					<!--cart button-->
					<div class="n-btn-group n-btn-order">
						<button type="button" onclick="sel_goods_order(); return false;"
							class="n-btn btn-lg btn-accent" id="btn-order">
							주문하기 <span class="n-btn-order-sm-txt"></span>
						</button>
					</div>
				</div>




				<!--discount list-->
				<div class="section-contents section-discount-cont">

					<p class="title_s">할인 금액</p>
					<div class="section-discount-cont-box">
						<ul class="cart-discount-method">
							<li class="cart-method">상품 할인</li>
							<li class="cart-discount"><strong><span
									id="cart-total-sale-amt">39,600</span></strong> 원</li>
						</ul>
						<ul class="cart-discount-method">
							<li class="cart-method">등급 할인</li>
							<li class="cart-discount"><strong><span
									id="cart-user-dc-amt">0</span></strong> 원 <span class="txt_level">(PUZZLE
									회원)</span></li>
						</ul>
						<ul class="cart-discount-method">
							<li class="cart-method">쿠폰 할인</li>
							<li class="cart-discount"><span class="txt-range">회원만
									사용할 수 있습니다.</span></li>
						</ul>
						<ul class="cart-discount-method">
							<li class="cart-method">적립금 사용</li>
							<li class="cart-discount box-usr-point"><span
								class="txt-range">회원만 사용할 수 있습니다.</span> <input type="hidden"
								name="point" readonly="" value="0"></li>
						</ul>
						<!--// discount list -->
						<!--discount sum-->
						<ul class="cart-discount-method">
							<li class="cart-method amount">할인 합계</li>
							<li class="cart-discount amount"><strong
								id="total-pay-dc-amt" class="txt-amount cart-total-add-opt-save">39,600</strong>원</li>
						</ul>
					</div>

					<input type="hidden" name="kcoupon" value="0"> <input
						type="hidden" name="prepoint" value="0"> <input
						type="hidden" name="total-sale-amt" id="total-sale-amt"
						value="39600">
					<!-- 상품 할인-->
					<input type="hidden" name="dc-price" value="0">
					<!-- 등급할인 -->

					<input type="hidden" id="total-prd-amt" value="353400"> <input
						type="hidden" id="total-dlv-amt" value="0">
					<ul class="final-payment">
						<li>
							<p class="final-payment-ti">상품 금액</p>
							<p class="final-payment-price">
								<input type="hidden" class="cart-normal-price" value="393000">
								<span class="cart-normal-add-opt-price">393,000</span>원
							</p>
						</li>
						<li class="final-payment-ic"><img class="ic-18-line-minus" src="resources/images/minus.png"></img>
						</li>
						<li>
							<p class="final-payment-ti">할인 합계</p> <input type="hidden"
							class="cart-total-save" value="39600">
							<p class="final-payment-price">
								<span class="cart-total-add-opt-save">39,600</span>원
							</p>
						</li>
						<li class="final-payment-ic"><img class="ic-18-line-handle" src="resources/images/equals-icon.png" ></img>
						</li>
						<li>
							<p class="final-payment-ti">최종 결제 금액</p>
							<p class="final-payment-price">
								<span id="pay-amt">353,400</span>원
							</p>
							<p class="final-payment-save">
								<span id="total-dc-rate">10</span>% SAVE
							</p>
							<p class="final-payment-estimate" style="display: none;">
								(<span id="total-expected-billing-dc-amt">0</span>원 <span
									class="card-discount-type">청구</span> 예상)
							</p>
						</li>
					</ul>
					<!--//discount sum-->
				</div>
			</div>
		</form>
	</div>

	<%@include file="footer.jsp"%>
</body>
</html>