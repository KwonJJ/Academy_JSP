<%@page import="medel1.board.BoardDTO"%>
<%@page import="medel1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");

	BoardDAO dao = new BoardDAO(application); // 오라클 DB연결
	dao.updateVisitCount(num); // 게시물 조회수 증가
	BoardDTO dto = dao.selectView(num); // 게시물 상세 내역 가져오기
	
	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function deletePost() {
		var confirmed = confirm("정말로 삭제하겠습니까?");
		if(confirmed){
			var form = document.writeFrm; // 이름(name)이 'writeFrm'인 폼 선택
			form.method = "post"; // 전송 방식
			form.action = "DeleteProcess.jsp"; // 전송 경로
			form.submit(); // 폼값 전송
		}
	}
</script>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"/>
	<h2> 회원제 게시판 - 상세 보기 </h2>
	<form name = "writeFrm">
		<input type = "hidden" name = "num" value = "<%=num%>">
		<table border = "1" width = "90%">
			<tr>
				<td>번호</td>
				<td><%= dto.getNum() %></td>
				<td>작성자</td>
				<td><%= dto.getName() %></td>
			</tr>
			
			<tr>
				<td>작성일</td>
				<td><%= dto.getPostdate() %></td>
				<td>조회수</td>
				<td><%= dto.getVisitcount() %></td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td colspan = "3" height = "100">
					<%=dto.getContent().replace("\r\n",	"<br/>") %>
				</td>
			</tr>
			
			<tr>
				<td colspan = "4" align = "center">
					<%
						if(session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(dto.getId())){
							
					%>
					<button type = "button" onclick = "location.href = 'Edit.jsp?num=<%= dto.getNum() %>';">
						수정하기
					</button>
					<button type = "button" onclick = "deletePost();">삭제하기</button>
					<%
						}
					%>
					<button type = "button" onclick = "location.href = 'List.jsp';">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>