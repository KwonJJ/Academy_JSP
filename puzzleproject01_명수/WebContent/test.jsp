<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카테고리 선택</title>
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
            }
            // 다른 대분류에 대한 소분류 추가는 여기에 계속해서 추가할 수 있습니다.
        }

        function addOption(selectElement, value, text) {
            var option = document.createElement("option");
            option.value = value;
            option.text = text;
            selectElement.add(option);
        }
    </script>
</head>
<body>
    <div class="#">
        <label class="#">카테고리[대분류]</label>
        <div class="#">
            <select id="mainCategory" name="productCategory" onchange="updateSubCategories()">
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
            <select id="subCategory" name="productCategory">
                <!-- 소분류 옵션은 JavaScript에서 동적으로 추가됩니다. -->
            </select>
        </div>
    </div>
</body>
</html>