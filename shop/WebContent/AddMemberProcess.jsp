<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%@ include file="footer.jsp" %>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");

	MemberDAO dao = new MemberDAO();
	
	String sql = "select * from member";
	PreparedStatement psmt = dao.con.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
	
	String result = "";
	
	while(rs.next()){
		String id2 = rs.getString(1);
		
		if(id.equals(id2)){
			result = "기존회원";
			request.getRequestDispatcher("addMember.jsp?error=1").forward(request, response);
			break;
		}
	}
	if(result == ""){
		dao.insertMember(id, password, name, phone, address);
		out.print(name + "님 회원가입이 완료되었습니다.");
	}
	dao.close();
	/*
	if(result == "") {
		 jsp에서 바로 sql연결 후 회원가입
		String sql2 = "insert into member values(?, ?, ?, ?, ?)";
		PreparedStatement psmt2 = dao.con.prepareStatement(sql2);
		psmt2.setString(1, id);
		psmt2.setString(2, name);
		psmt2.setString(3, password);
		psmt2.setString(4, phone);
		psmt2.setString(5, address);
		psmt2.executeUpdate();
		
	}
*/	
%>

	<div class="jumbotron">
		<div class="container">
			<h5 class="display-3"><%=name %>님 회원가입을 환영합니다.</h5>
		</div>
	</div>
</body>
</html>