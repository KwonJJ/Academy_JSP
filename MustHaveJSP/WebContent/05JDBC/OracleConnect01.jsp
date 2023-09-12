<%@page import="java.sql.DriverManager"%>
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
	<%
		Connection con = null;
	
		try{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "manager";
			String pw = "1234";
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, id, pw);
			out.print("데이터 베이스 연결이 성공했습니다.");
			
		} catch(Exception e){
			out.print("데이터 베이스 연결이 실패했습니다.");
			
		} finally{
			if(con != null){
				con.close();
			}
		}
	%>
</body>
</html>