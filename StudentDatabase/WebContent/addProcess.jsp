<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.OracleConnect"%>
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
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		OracleConnect oc = new OracleConnect(); // 오라클 DB에 연결
		String sql = "insert into student values(?, ?, ?)";
		PreparedStatement psmt = oc.con.prepareStatement(sql);
		// 주어진 문자열로 동적 쿼리문을 생성
		psmt.setString(1, name);
		psmt.setString(2, id);
		psmt.setString(3, pw); 
		// sql문과 순서 맞춰야함
		
		int result = psmt.executeUpdate(); // 쿼리를 실행
		
		if(result == 1){
			out.print("정상 처리 되었습니다.");
		} else{
			out.print("회원 추가에 문제가 발생했습니다");
		}
		
		oc.close(); // 데이터베이스 연결 해제
	%>
</body>
</html>