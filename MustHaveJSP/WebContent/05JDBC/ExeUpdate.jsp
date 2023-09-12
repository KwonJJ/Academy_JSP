<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 추가 테스트</h2>
	<%
		JDBConnect jdbc = new JDBConnect();
	
		String id = "test1";
		String pass = "1111";
		String name = "테스트1회원";
		
		String sql = "insert into member values (?,?,?,sysdate)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		// 동적 쿼리문 생성하여 sql문을 생성
		psmt.setString(1, id);
		psmt.setString(2, pass);
		psmt.setString(3, name);
		
		int inResult = psmt.executeUpdate();
		out.print(inResult + "행이 추가되었습니다.");
		// update의 실행 결과는 숫자가 나옴(몇 줄이 바뀌었는지)
		
		jdbc.close();
		
	%>
</body>
</html>