<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
 <script>
        function updateSubCategories() {
            var mainCategory = document.getElementById("mainCategory").value;
            var subCategorySelect = document.getElementById("subCategory");

            // 모든 옵션 제거
            subCategorySelect.innerHTML = "";

            // 대분류에 따라 소분류 옵션 추가
            if (mainCategory === "상의") {
            	//첫번째 select(하위), 두번째 value, 세번째 user에게 보여짐
                addOption(subCategorySelect, "니트", "니트");
                addOption(subCategorySelect, "맨투맨", "맨투맨");
                addOption(subCategorySelect, "셔츠", "셔츠");
                addOption(subCategorySelect, "후드티셔츠", "후드티셔츠");
            } else if (mainCategory === "아우터") {
            	addOption(subCategorySelect, "코트", "코트");
                addOption(subCategorySelect, "패딩", "패딩");
                addOption(subCategorySelect, "블루종", "블루종");
                addOption(subCategorySelect, "기타아우터", "기타아우터");
			}
            // 다른 대분류에 대한 소분류 추가는 여기에 계속해서 추가할 수 있습니다.
        }

        function addOption(selectElement, value, text) {
            var option = document.createElement("option");
            option.value = value;
            option.text = text;
            selectElement.add(option);
        }
        
        // 페이지 로드 시 초기화
        document.addEventListener("DOMContentLoaded", function () {
            updateSubCategories();
        });
    </script>
</head>
<body>
<form name="newProduct" action="./addproduct.product" class="#" method="post" enctype="multipart/form-data">
			<h2>${warn }</h2>
			<div class="#">
				<label class="#">상품코드</label>
				<div class="#">
					<input type="text" name="productId" class="#">
				</div>
			</div>
			<div class="#">
				<label class="#">상품명</label>
				<div class="#">
					<input type="text" name="productName" class="#">
				</div>
			</div>
			<div class="#">
				<label class="#">상품가격</label>
				<div class="#">
					<input type="text" name="productUnitPrice" class="#">
				</div>
			</div>
			<div class="#">
				<label class="#">상품설명</label>
				<div class="#">
					<input type="text" name="productDescription" class="#">
				</div>
			</div>
			<div class="#">
				<label class="#">브랜드</label>
				<div class="#">
					<input type="text" name="productBrand" class="#">
				</div>
			</div>
			 <div class="#">
		        <label class="#">카테고리[대분류]</label>
		        <div class="#">
		            <select id="mainCategory" name="productCategory1" onchange="updateSubCategories()">
		                <option value="상의">상의</option>
		                <option value="아우터">아우터</option>
		                <option value="바지">바지</option>
		                <option value="신발">신발</option>
		                <option value="악세사리">악세사리</option>
		            </select>
		        </div>
		    </div>

		    <div class="#">
		        <label class="#">카테고리[소분류]</label>
		        <div class="#">
		            <select id="subCategory" name="productCategory2">
		                <!-- 소분류 옵션은 JavaScript에서 동적으로 추가됩니다. -->
		            </select>
		        </div>
		    </div>
		    
			<div class="#">
				<label class="#">재고개수</label>
				<div class="#">
					<input type="text" name="productInStock" class="#">
				</div>
			</div>
			<div class="#">
				<label class="col-sm-2">상품 사진</label>
				<div class="#">
					<input type="file" name="productImage" class="#"  > 
				</div>
			</div>
			<div class="#">
				<input type="submit" class="#" value="등록">
			</div>
		</form>
</body>
</html>