<%@page import="dao.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("user_id");
	String password = request.getParameter("password");

	MemberDAO dao = new MemberDAO();
	String result=dao.deleteMember(id,password);
	
	if(result.equals("")) {	
		request.getRequestDispatcher("deletemember.jsp?error=1")
		.forward(request,response);
	} else {
		dao.close();
		response.sendRedirect("logout.jsp");
	}
%>    