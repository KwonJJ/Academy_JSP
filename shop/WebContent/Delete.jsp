<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="LoginCheck.jsp" %>
<%
	String num = request.getParameter("num"); // 삭제할 게시물 번호
	String sessionId = (String)session.getAttribute("user_id"); // 현재 로그인한 아이디

	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	
	String id = dto.getId(); // 글 작성한 아이디
	if(sessionId.equals(id)){ 
		// 로그인한 아이디와 글 작성 아이디가 일치할 시
		int result = dao.deletePost(dto);
		
		if(result == 1){
			JSFunction.alertLocation("삭제 성공", "boardmain.jsp", out);
		} else {
			JSFunction.alertBack("삭제 실패", out);
		}
	} else {
		JSFunction.alertBack("본인만 삭제 가능", out);
	}
	
	
	dao.close();
%>
