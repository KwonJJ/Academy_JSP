<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="LoginCheck.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	SimpleDateFormat curdateformat=new SimpleDateFormat("yyyy-MM-dd");
	String postdate = curdateformat.format(new Date());
	
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId((String)session.getAttribute("user_id"));
	dto.setPostdate(postdate);
	
	BoardDAO dao = new BoardDAO();
	
	int result = dao.insertWrite(dto);
	
	dao.close();
	
	if(result==1) {
		response.sendRedirect("boardmain.jsp");
	} else {
		JSFunction.alertBack("글쓰기에 실패했습니다.", out);
	}
%>

