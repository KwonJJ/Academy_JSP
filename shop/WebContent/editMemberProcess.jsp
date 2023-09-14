<%@page import="java.sql.ResultSet"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
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
	
	String id = (String)session.getAttribute("user_id");
	String user_name = (String)session.getAttribute("user_name");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	MemberDAO dao = new MemberDAO();
	String result = dao.editMember(id, password, phone, address);
	
	dao.close();
	
%>

	<div class="jumbotron">
		<div class="container">
			<h4 class="display-3"><%=user_name %>님의 정보 수정이 완료되었습니다.</h4>
		</div>
	</div>
</body>
</html>