<%@page import="common.JSFunction"%>
<%@page import="dao.MemberShipDAO"%>
<%@page import="dto.MemberShipDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String member_id = request.getParameter("member_id");
	String member_pw = request.getParameter("member_pw");
	String member_name = request.getParameter("member_name");
	String member_address = request.getParameter("member_address");
	String member_tel = request.getParameter("member_tel");
	
	MemberShipDAO dao = new MemberShipDAO();
	int result = dao.AddMember(member_id, member_pw, member_name, member_address, member_tel);

	
	if(result == 1){
		JSFunction.alertLocation(member_name + "님 회원가입 완료", "login.jsp", out);
	} else{
		JSFunction.alertBack("회원가입 실패", out);
	}
		
	
	
%>
