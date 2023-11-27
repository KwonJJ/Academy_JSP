<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="car.CarDTO"%>
<%@page import="car.CarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	CarDAO dao = new CarDAO();

	request.setCharacterEncoding("utf-8");
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	List<CarDTO> list = dao.selectList(searchField, searchWord);
	
	dao.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
	<div class="top-container">
		<div class="top-box">
			<div class="logo"><h1><span class="SM">SM</span>렌트카</h1></div>
			<div><p id = "login-text">Guest님 환영합니다.</p></div>
		</div>
		<div class="top_menu">
			<ul>
				<li><a href = "#">예약하기</a></li>
				<li><a href = "#">예약확인</a></li>
				<li><a href = "#">자유게시판</a></li>
				<li><a href = "#">이벤트</a></li>
				<li><a href = "#">고객센터</a></li>
			</ul>
		</div>
	</div>
	<div class="car-container">
		<div class="car-box">
		<c:forEach var="carlist" items="<%=list %>">
			<div class="car-item">
				<div><img class="carImg" alt="차량이미지" src="resources/image/${carlist.car_image}"></div>
				<p align="center">차량명 : ${carlist.car_name }</p>
				<p align="center">출고날짜 : ${carlist.car_deliveryDate }</p>
			</div>
		</c:forEach>
		</div>
		
		<div class = "AllSearch">
			<h2>차량 검색 하기</h2>
		</div>
		
		<div align="center">
			<form>
				<select name="searchField" class='txt'>
					<option value="car_name">차량이름</option>
					<option value="car_deliveryDate">제조회사</option>
				</select>
				<input name="searchWord" type="text">
				<input type="submit" value="검색">
			</form>
		</div>
	</div>
</body>
</html>