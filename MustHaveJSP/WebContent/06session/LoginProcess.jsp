<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	// 로그인 폼으로부터 받은 아이디와 패스워드
	
	/*
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	// web.xml에서 가져온 데이터베이스 연결 정보
	*/
	
	MemberDAO dao = new MemberDAO(/*oracleDriver, oracleURL, oracleId, oraclePwd*/);
	MemberDTO memberDTO = dao.getmemberDto(userId, userPwd);
	dao.close();
	// 회원 테이블 DAO를 통해 회원 정보 DTO 획득
	
	if(memberDTO.getId() != null){ // 로그인 성공 여부에 따른 처리
		// 로그인 성공
		session.setAttribute("UserId", memberDTO.getId());
		session.setAttribute("UserName", memberDTO.getName());
		response.sendRedirect("LoginForm.jsp");
		
	} else{
		// 로그인 실패
		request.setAttribute("LoginErrMsg", "로그인 오류 입니다.");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
		
%>