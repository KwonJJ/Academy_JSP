<%@page import="common.JDBConnect2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MySQL</h1>
	<h2>JDBC 테스트</h2>
	<%
		JDBConnect2 jdbc1 = new JDBConnect2();
		jdbc1.close();
	%>
	
	<h2>JDBC 테스트2</h2>
	<%
		String driver = application.getInitParameter("MysqlDriver");
		String url = application.getInitParameter("MysqlURL");
		String id = application.getInitParameter("MysqlId");
		String pwd = application.getInitParameter("MysqlPwd");
		JDBConnect2 jdbc2 = new JDBConnect2(driver,url,id,pwd,out);
		jdbc2.close();
	%>
</body>
</html>