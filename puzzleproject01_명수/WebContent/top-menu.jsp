<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top-menu</title>
<link rel="stylesheet" href="resources/css/top-menu.css">
<link rel="stylesheet" href="resources/css/layout.css">
</head>
<body>
	<nav>
		<div class="nav-top">
        <h1><a href="welcome.jsp">Puzzle</a></h1>
      	</div>
	      <div class="nav-bottom">
	        <c:choose>
	        	<c:when test="${empty id}">
		        <div class="bottom-left-logout">
					<a href="login.jsp">로그인</a>
					<a href="register.jsp">회원가입</a>
			     </div>
				</c:when>
				<c:otherwise>
	    	    <div class="bottom-left-login">
					<a href="./logout.do">로그아웃</a>
					<a href="mypage.jsp">마이페이지</a>
					<a href="#">커뮤니티</a>
		    	 </div>
				</c:otherwise>
			 </c:choose>
	        <div class="bottom-right">
				<a href="#">고객센터</a>
				<a href="cart.jsp">장바구니</a>
				<a href="viewed_goods.jsp">최근본상품</a>
	        </div>
     	 </div>
   	 </nav>
</body>
</html>