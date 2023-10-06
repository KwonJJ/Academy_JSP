<%@page import="common.BoardPage"%>
<%@page import="java.util.List"%>
<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BoardDAO dao = new BoardDAO();
	int totalCount = dao.selectCount();	 
	// 게시물 전체 개수
	int postPage = Integer.parseInt(application.getInitParameter("POST_PAGE")); 
	// 한 페이지 게시물 개수(20개)
	int blockCount = Integer.parseInt(application.getInitParameter("BLOCK_COUNT")); 
	// 하단 표시 페이지 숫자(10개)
	int totalPage = (int)Math.ceil((double)totalCount / postPage);  
	// 게시물 페이지 전체 개수
	
	int pageNum = 1;  // 기본 페이지 번호는 1로 세팅
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	int start = (pageNum - 1) * postPage + 1;

	List<BoardDTO> boardLists = dao.selectList(start);
	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	<%@ include file="LoginCheck.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<table border="1" width="100%">
			<tr align="center">
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">아이디</th>
				<th width="10%">조회수</th>
				<th width="15%">작성일</th>
			</tr>
			<%
				for(BoardDTO bto : boardLists) {
			
			%>
			<tr align="center">
				<td><%=bto.getNum()%></td>
				<td> <a href="View.jsp?num=<%=bto.getNum()%>"> <%=bto.getTitle()%> </a> </td>
				<td><%=bto.getId()%></td>
				<td><%=bto.getVisitcount()%></td>
				<td><%=bto.getPostdate()%></td>
			</tr>
			
			<% } %>
			<tr align="center">
				<td colspan="5">
					<%=BoardPage.pagingStr(totalCount, postPage, blockCount, pageNum, totalPage) %>
				</td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
	</div>
</body>
</html>










