<%@page import="common.JSFunction"%>
<%@page import="dto.MemberShipDTO"%>
<%@page import="dao.MemberShipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = request.getParameter("member_id");
	String member_pw = request.getParameter("member_pw");
	
	MemberShipDAO dao = new MemberShipDAO();
	MemberShipDTO dto = dao.selectMember(member_id, member_pw);
	
	String result = "";
	
	if(dto.getMemberid() != null){
		session.setAttribute("member_id", dto.getMemberid());
		session.setAttribute("member_name", dto.getMembername());
		result = dto.getMembername() + "님 환영합니다. ";
	} else {
		request.getRequestDispatcher("login.jsp?error=1").forward(request, response);
		JSFunction.alertBack("아이디 혹은 비밀번호가 틀렸습니다.", out);
	}
	
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="top.jsp" />

<h1><%=result %></h1>
</body>
</html>