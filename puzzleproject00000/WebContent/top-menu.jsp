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
	        <div class="bottom-left">
	        <c:choose>
	        	<c:when test="${empty id}">
					<div><a href="login.jsp">로그인</a></div>
					<div><a href="register.jsp">회원가입</a></div>
				</c:when>
				<c:otherwise>
					<div><a href="./logout.do">로그아웃</a></div>
					<div><a href="mypage_save.jsp">마이페이지</a></div>
				</c:otherwise>
			 </c:choose>
		     </div>
	        <div class="bottom-middle">
	          <a href="#">실시간랭킹</a>
	          <a href="#">래플</a>
	          <a href="#">고객센터</a>
	          <a href="#">커뮤니티</a>
	        </div>
	        <div class="bottom-right">
	          <a href="#">장바구니</a>
	          <a href="#">최근본상품</a>
	        </div>
     	 </div>
   	 </nav>
</body>
</html>