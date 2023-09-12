<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String none = request.getParameter("none");
		if(none != null) out.print("좋아하는 과일이 없군요.");
	%>
	<h1> 좋아하는 과일을 선택하세요 </h1>
	<form action="ChoiceResult.jsp" method = "post">
		<!-- 
		dropbox목록으로 과일 선택
		하나 선택 시 선택한 과일 result로 넘겨받기
		result에는 '당신이 좋아하는 과일은 ~ 입니다' 출력
		 -->
		 <select name = fruit>
		 	<option value = "바나나"> 바나나 </option>
		 	<option value = "사과"> 사과 </option>
		 	<option value = "수박"> 수박 </option>
		 	<option value = "멜론"> 멜론 </option>
		 	<option value = "복숭아"> 복숭아 </option>
		 	<option value = "none">없음</option>
		 </select>
		 <input type = "submit" value = "보내기">
	</form>
</body>
</html>