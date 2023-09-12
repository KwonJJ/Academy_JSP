<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.mysqlConnect"%>
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
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String pwCheck = request.getParameter("pwCheck");
		String tel = request.getParameter("tel");
		String email01 = request.getParameter("email01");
		String email02 = request.getParameter("email02");
		String select = request.getParameter("select");
		String join = request.getParameter("join");
		
		mysqlConnect mc = new mysqlConnect(); // mysql DB에 연결
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement psmt = mc.con.prepareStatement(sql);
		// 주어진 문자열로 동적 쿼리문을 생성
		
		psmt.setString(1, id);
		psmt.setString(2, name);
		psmt.setString(3, pw);
		psmt.setString(4, pwCheck);
		psmt.setString(5, tel);
		psmt.setString(6, email01 + "@" + email02);
		psmt.setString(7, select);
		psmt.setString(8, join);
		
		int result = psmt.executeUpdate(); // 쿼리 실행
		
		if(result == 1){
			out.print(name + "님의 회원가입이 완료되었습니다.");
		} else {
			out.print(name + "님의 회원가입이 되지 않았습니다.");
		}
		mc.close();
	%>
</body>
</html>