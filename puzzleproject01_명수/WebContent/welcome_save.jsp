<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie tempCookie : cookies){
            if(tempCookie.getName().equals("id")){
                //쿠키값으로 대신 로그인 처리함
                session.setAttribute("id", tempCookie.getValue());
            }
        }
    }
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈화면</title>

</head>
<body>
<div>홈</div>
	<c:choose>
		<c:when test="${empty id}">
			<div><a href="login.jsp">로그인</a></div>
			<div><a href="register.jsp">회원가입</a></div>
		</c:when>
		<c:otherwise>
			<h2>${id }님 환영합니다.</h2>
			<div><a href="./logout.do">로그아웃</a></div>
			<div><a href="mypage.jsp">마이페이지</a></div>
		</c:otherwise>
	</c:choose>

</body>
</html>











