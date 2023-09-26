<%@page import="common.JSFunction"%>
<%@page import="dao.MemberShipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = (String) session.getAttribute("member_id");
	String member_pw = (String) request.getParameter("member_pw");
	String member_name = (String) session.getAttribute("member_name");
	
	MemberShipDAO dao = new MemberShipDAO();
	int result = dao.deleteMember(member_id, member_pw);
	dao.close();
	
	if(result!=1){
		request.getRequestDispatcher("deletemember.jsp?error=1").forward(request, response);
	} else {
		JSFunction.alertLocation(member_name + "님 회원탈퇴성공", "logout.jsp", out);
	}
%>