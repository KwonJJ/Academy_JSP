<%@page import="common.JSFunction"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");  // 삭제할 게시물 번호
	String id = (String)session.getAttribute("user_id");   
	// 현재 로그인한 아이디

	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	String id2 = dto.getId();   // 글 작성한 아이디
	
	if(id.equals(id2)) {  // 로그인 아이디와 글작성 아이디가 일치하면
		int result = dao.updateDelete(dto);
	
		if(result==1) {
			JSFunction.alertLocation("게시글이 삭제 되었습니다.","View.jsp", out);
		} else {
			JSFunction.alertBack("수정하기 실패했어요", out);
		}
		
	} else {
		JSFunction.alertBack("작성자만 삭제 가능합니다.", out);
	}
	dao.close();	

%>