<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <% 
	if(session.getAttribute("id").equals("")) {
		JSFunction.alertLocation("판매자만 접근가능합니다.", "login.jsp", out);
		return;
	}
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 페이지</title>
</head>
<body>
<!--판매자가 한명이라고 가정
	마스터아이디 한개로 운영함-->

		<h1>판매자 페이지</h1>
			<a class='#' href='sellerpage_addProduct.jsp'>상품등록</a>
			<a class='#' href='#'>상품관리</a>
			<a class='#' href='#'>통계</a>
			<a class='#' href='#'>민원관리</a>
</body>
</html>