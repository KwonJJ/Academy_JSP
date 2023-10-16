<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String greeting = "쇼핑몰 방문을 환영합니다";
	String tagline = "자바 쇼핑몰에 어서오세요";
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$(function(){
		function getClock(){
			var date = new Date();
			var hour = date.getHours();
			var minute = date.getMinutes();
			var second = date.getSeconds();
			var ampm;	
			if(hour==12) {
				ampm="오후";
			} else if (hour<12) {
				ampm="오전";
			} else {
				ampm="오후";
				hour = hour - 12;
			}
			var time = ampm + " " + hour + ":" + minute + ":" + second;
			$("#clock").text(time); 
		}
		getClock();
		setInterval(getClock,1000);
	});
</script>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting %>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
			<c:set var="today" value="<%= new java.util.Date() %>"/>
			<h3><fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/></h3>
			<%
				response.setIntHeader("Refresh", 1);
			%>
		</div>	
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>











