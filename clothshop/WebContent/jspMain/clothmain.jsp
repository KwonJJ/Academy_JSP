<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Cloth"%>
<%@ page import="dto.clothRepository"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		clothRepository dao = new clothRepository();
	ArrayList<Cloth> allCloth = dao.getAllCloth();

	for (int i = 0; i < allCloth.size(); i++) {
		Cloth cloth = allCloth.get(i);
	%>
	<img src="../resources/images/<%=cloth.getClothId()%>.jpg">
	
		<a href = "clothinfo.jsp?id=<%=cloth.getClothId()%>" 
		role = "button">상세보기</a>
	<h2>상품 코드 : <%=cloth.getClothId()%></h2>
	<h2>상품명 : <%=cloth.getClothName()%></h2>
	<%
		}
	%>
</body>
</html>