<%@page import="dao.MemberShipDAO"%>
<%@page import="dto.MemberShipDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.getParameter("utf-8");
	String memberid = request.getParameter("memberid");
	String memberpw = request.getParameter("memberpw");
	String membername = request.getParameter("membername");
	String memberaddress = request.getParameter("memberaddress");
	String membertel = request.getParameter("membertel");
	
	MemberShipDAO dao = new MemberShipDAO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>