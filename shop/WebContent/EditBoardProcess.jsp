<%@page import="common.JSFunction"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="LoginCheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = request.getParameter("id");
	String id2 = (String)session.getAttribute("user_id"); // 현재 로그인 한 사람의 아이디
	
	if(id.equals(id2)){
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setNum(num);

		BoardDAO dao = new BoardDAO();
		int result = dao.updateEdit(dto);
		dao.close();

		if(result == 1) {
			JSFunction.alertLocation("게시글이 수정되었습니다.", "View.jsp?num=" + dto.getNum(), out);
		} else{
			JSFunction.alertBack("수정 실패", out);
		}
	} else {
		JSFunction.alertBack("작성자만 수정이 가능합니다.", out);
	}
	
%>