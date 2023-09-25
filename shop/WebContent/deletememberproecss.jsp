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

	String id = (String)session.getAttribute("user_id");
	String password = request.getParameter("password");
	String user_name = (String)session.getAttribute("user_name");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	MemberDAO dao = new MemberDAO();
	String result = dao.deleteMember(id, password);
	
	if(result.equals("")){
		request.getRequestDispatcher("deletemember.jsp?error=1").forward(request, response);
	} else {
		session.invalidate();
		dao.close();
		response.sendRedirect("logout.jsp");
	}
%>

	<div class="jumbotron">
		<div class="container">
			<h5 class="display-3"><%=user_name %> 님의 회원탈퇴가 완료되었습니다.</h5>
		</div>
	</div>

</body>
</html>