<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 회원 목록 조회 테스트 </h2>
	<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			String url = "jdbc:mysql://localhost:3306/member";
			String id = "manager";
			String pw = "1234";
			
			
		} catch(Exception e){
			
		}
	%>
</body>
</html>