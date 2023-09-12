<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Cloth" %>
<%@ page import = "dto.clothRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	<%@ include file = "head.jsp" %>
	<%@ include file = "bottom.jsp" %>
	<%
		String id = request.getParameter("id");
		clothRepository dao = new clothRepository();
		Cloth cloth = dao.getClothById(id);
	%>
	
	<div class = "container">
		<img src="../resources/images/<%=cloth.getClothId()%>.jpg">
		<h1><%=cloth.getClothName() %></h1>
		
		<h3> 상품 코드 : <%=cloth.getClothId() %></h3>
		<h3> 상품명 : <%=cloth.getClothName() %></h3>
		<h3> 가격 : <%=cloth.getClothCost() %></h3>
		<h3> 사이즈 : <%=cloth.getClothSize() %></h3>
		<h3> 색상 : <%=cloth.getClothColor() %></h3>
	
	</div>
</body>
</html>