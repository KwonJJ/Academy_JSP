<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <% 
	if(session.getAttribute("user_id") == null) {
		JSFunction.alertLocation("로그인 후 이용하세요", "login.jsp", out);
		return;
	}
%>