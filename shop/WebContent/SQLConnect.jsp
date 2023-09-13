<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
		Statement stmt = null;
		ResultSet rs = null;
	
		
		try{
			String url = "jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf-8";
			String id = "manager";
			String pw = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			String sql = "select * from member";
			
			con = DriverManager.getConnection(url, id, pw);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				String s_name = rs.getString(1);
				String s_id = rs.getString(2);
				String s_pw = rs.getString(3);

				out.print(" DB 연결 성공");
			}
			
			
		} catch(Exception e){
			out.print(" DB 연결 실패");
		} finally{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
		}
	%>
</body>
</html>