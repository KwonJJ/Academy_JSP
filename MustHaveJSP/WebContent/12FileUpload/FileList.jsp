<%@page import="java.net.URLEncoder"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.MyfileDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 데이터베이스에 등록된 파일 목록 보기 </h2>
	<a href="FileUploadMain.jsp"> 파일 등록하기 </a>
	<%
		MyfileDAO dao = new MyfileDAO();
		List<MyfileDTO> fileLists = dao.myFileList();
		dao.close();
	%>
	
	<table border="1">
		<tr>
			<td>순서</td>
			<td>작성자</td>
			<td>제목</td>
			<td>카테고리</td>
			<td>원본 파일명</td>
			<td>저장된 파일명</td>
			<td>작성일</td>
		</tr>
		<% for (MyfileDTO f : fileLists) { %>
		<tr>
			<td><%=f.getIdx() %></td>
			<td><%=f.getName() %></td>
			<td><%=f.getTitle() %></td>
			<td><%=f.getCate() %></td>
			<td><%=f.getOfile() %></td>
			<td><%=f.getSfile() %></td>
			<td><%=f.getPostdate() %></td>
			<td><a href = "Download.jsp?oName = <%=URLEncoder.encode(f.getOfile(),"UTF-8" ) %>&sName=<%=URLEncoder.encode(f.getSfile(), "UTF-8") %>">[다운로드]</a></td>
		</tr>
		<% } %>
	</table>
</body>
</html>