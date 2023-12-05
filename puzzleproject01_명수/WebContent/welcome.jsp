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
<link rel="stylesheet" href="resources/css/layout.css">
<link rel="stylesheet" href="resources/css/main.css">
<meta charset="UTF-8">
<title>홈화면</title>

</head>
<body>

      	<%@include file="top-menu.jsp" %>
		<%@include file="left-menu.jsp" %>
		<div class="main-image-wrapper">
			<div class="main-image">
				<img alt="main-image" src="resources/images/main_1.JPG">
			</div>
		</div>
		<%@include file="main-items.jsp" %>
		<%@include file="footer.jsp" %>

</body>
</html>











