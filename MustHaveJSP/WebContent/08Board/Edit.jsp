<%@page import="medel1.board.BoardDTO"%>
<%@page import="medel1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="IsLoggedIn.jsp"%>
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application); // 오라클 db접속
	BoardDTO dto = dao.selectView(num); // 편집할 게시물 가져오기
	String sessionId = (String)session.getAttribute("UserId");
	
	if(!sessionId.equals(dto.getId())) { // 로그인 아이디가 일치하지 않으면
		JSFunction.alertBack("작성자만 편집 가능해요", out);
		return;
	}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"/>
	
	<h2> 회원제 게시판 - 수정하기 </h2>
	
	<form name = "writeFrm" method = "post" action="EditProcess.jsp">
		<input type = "hidden" name = "num" value = "<%=dto.getNum()%>">
		<table border = "1" width = "90%">
			<tr>
				<td>제목</td>
				<td>
					<input type = "text" name = "title" style = "width : 90%;" value = "<%=dto.getTitle() %>">
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea name = "content" style = "width : 90%; height : 100px;"><%=dto.getContent() %></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan = "2" align = "center">
					<button type = "submit">작성 완료</button>
					<button type = "reset">다시 입력</button>
					<button type = "button" onclick = "location.href = 'List.jsp';">목록 보기</button>
				</td>			
			</tr>
		</table>
	</form>
</body>
</html>