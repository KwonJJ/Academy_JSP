<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="medel1.board.BoardDAO"%>
<%@page import="medel1.board.BoardDTO"%>
<%@page import= "utils.BoardPage" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	BoardDAO dao = new BoardDAO(application);
	//DAO를 생성해 DB에 연결

	Map<String, Object> param = new HashMap<String, Object>();
	// 사용자가 입력한 검색 조건을 Map에 저장
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	// 사용자가 입력한 검색필드와 검색 단어를 저장함
	
	if(searchWord != null) {
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int totalCount = dao.selectCount(param); // 전체 게시물 개수 저장
	
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	// web.xml에서 설정한 한 페이지 당 출력 게시물 개수 저장(10개)
	
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	// web.xml에서 설정한 페이지 번호 출력 수 저장(5개)
	
	int totalPage = (int)Math.ceil((double)totalCount/pageSize);
	// 전체 페이지 개수 저장
	
	int pageNum = 1; // 페이지 번호 초기값 설정
	String pageTemp = request.getParameter("pageNum");
	// 사용자가 출력한 페이지 번호를 가져와 pageNum에 저장
	if(pageTemp != null && !pageTemp.equals("")){
		pageNum = Integer.parseInt(pageTemp);
	}
	
	int start = (pageNum - 1) * pageSize + 1; // 각 페이지의 시작 번호와 끝 번호 설정
	int end = pageNum * pageSize;
	param.put("start", start);
	param.put("end", end);
	
	List<BoardDTO> boardLists = dao.selectList(param);
	// 게시물 목록 받아서 저장
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원제 게시판 </title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"/>
	<h2> 목록 보기 - 현재 페이지 : <%=pageNum %> (전체 : <%=totalPage %>) </h2>
	
	<form method = "post">
		<table border = "1" width = "90%">
			<tr>
				<td align = "center">
					<select name = "searchField">
						<option value = "title">제목</option>
						<option value = "content">내용</option>
					</select>
					<input type = "text" name = "searchWord">
					<input type = "submit" value = "검색하기">
				</td>
			</tr>
		</table>
	</form>
	<!-- 게시물 목록 테이블(표) -->
	
	<table border = "1" width = "90%">
		<tr>
			<td width = "10%">번호</td>
			<td width = "50%">제목</td>
			<td width = "15%">작성자</td>
			<td width = "10%">조회수</td>
			<td width = "15%">작성일</td>
		</tr>
		<!-- 목록의 내용 -->
		
		<%
			if(boardLists.isEmpty()){
			// 게시물이 하나도 없을 때				
		%>
			<tr>
				<td colspan = "5" align = "center">
					등록된 게시물이 없습니다^^*
				</td>
			</tr>
		<%
			}
			else { 
				// 게시물이 있을 때
				int virtualNum = 0; 
				// 화면상에서의 게시물 번호
				// 가상 번호 생성(DB에 있는 num X, 화면상에서의 번호)
				
				int countNum = 0;
				for(BoardDTO dto : boardLists){ 
					// virtualNum = totalCount--; //전체 게시물 수에서 시작해 1씩 감소	
					virtualNum = totalCount - (((pageNum - 1) + pageSize) + countNum++);
		%>
			<tr align = "center">
				<td><%= virtualNum %></td> <!-- 게시물 번호 -->
				<td align = "left"> <!-- 제목(+ 하이퍼링크) -->
					<a href = "View.jsp?num=<%=dto.getNum() %>"> <%=dto.getTitle() %></a>
				</td>
					<td align = "center"><%= dto.getId() %></td> <!-- 작성자 아이디 -->
					<td align = "center"><%= dto.getVisitcount() %></td> <!-- 조회수 -->
					<td align = "center"><%= dto.getPostdate() %></td> <!-- 작성일 -->
			</tr>
		<%
				}
			}
		%>
	</table>
		
		<table border = "1" width = "90%">
			<tr align = "center">
			<td>
				<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
			</td>
				<td><button type = "button" onclick = "location.href = 'Write.jsp';">글쓰기</button></td>
			</tr>
		</table>
		<!-- 목록 하단의 [글쓰기] 버튼 -->
</body>
</html>