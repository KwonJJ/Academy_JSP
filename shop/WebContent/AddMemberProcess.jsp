<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<script></script>
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
	String password2= request.getParameter("password2");
	String name = request.getParameter("name");

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
	
	if(result == "") {
		String sql2 = "insert into member values(?, ?, ?)";
		PreparedStatement psmt2 = dao.con.prepareStatement(sql2);
		psmt2.setString(1, id);
		psmt2.setString(2, name);
		psmt2.setString(3, password);
		psmt2.executeUpdate();
	}
%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=name %>님의 회원가입을 환영합니다.</h1>
		</div>
	</div>
</body>
</html>