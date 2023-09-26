<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BookDAO dao = new BookDAO();
	List<BookDTO> booklist = dao.selectList();
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
</head>
<body>
<%@ include file="top.jsp"%>
	<table border = "1" width = "100%" padding = "10%">
		<tr>
			<th width = "5%">책 ID</th>
			<th width = "10%">작가</th>
			<th width = "20%">제목</th>
			<th width = "35%">내용</th>
			<th width = "10%">가격</th>
			<th width = "15%">발행일</th>
			<th width = "5%">회원 ID</th>
		</tr>
		
		<%
			for(BookDTO dto : booklist) {		
		%>
		
		<tr align = "center">
			<td><%=dto.getBookid() %></td>
			<td><%=dto.getAuthor() %></td>
			<td><%=dto.getBooktitle() %></td>
			<td><%=dto.getBookcontent() %></td>
			<td><%=dto.getBookprice() %>원</td>
			<td><%=dto.getBookdate() %></td>
			<td><%=dto.getMemberid() %></td>
		</tr>
		
		<%
			}
		%>
	</table>
</body>
</html>