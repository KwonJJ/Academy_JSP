<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String member_id = (String) session.getAttribute("member_id");

	if(member_id == null){
		out.print("<a href = 'login.jsp'>로그인</a>");
		out.print(" ");
		out.print("<a href = 'addmember.jsp'>회원가입</a>");
	} else{
		out.print("<a href = 'logout.jsp'>로그아웃</a>");
		out.print(" ");
		out.print("<a href = 'deletemember.jsp'>회원탈퇴</a>");
		out.print(" ");
	}
%>