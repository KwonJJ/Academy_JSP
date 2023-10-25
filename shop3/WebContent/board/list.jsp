<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>

<%

	List boardlist = (List) request.getAttribute("boardlist");
	// 게시판 리스트
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	// 전체 게시물 개수
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	// 현재 페이지 번호
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
	// 전체 페이지 개수
%>
<%-- 
	세션ID를 가져오고 게시판 객체 생성. 전체 게시글 개수(total_record), 
	전체 페이지(total_page), 현재 페이지 번호(pageNum)로 대입시킴  
--%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">


<title>Board</title>
<script type="text/javascript">
	function checkForm() {	
		if (${user_id==null}) {
			alert("로그인 해주세요.");
			return false;
		}

		location.href = "./BoardWriteForm.do?id=${user_id}"
	}
</script>
<%-- 
	로그인했는지 점검하고, 로그인이 안되어 있으면 글작성 취소
	로그인이 되어 있으면 해당 로그인 아이디로 글 작성하게 처리함
--%>

</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	
	<div class="container">
	
		<form action='<c:url value="./BoardListAction.do"/>' method="post">
			
			<div class="text-right">
				<span class="badge badge-success">전체${total_record}건</span>
			</div>
			
			
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<c:forEach items="${boardlist}" var="list">
					<tr>
						<td>${list.num}</td>
						<td><a href="./BoardViewAction.do?num=${list.num}&pageNum=${pageNum}">${list.subject}</a></td>
						<td>${list.regist_day}</td>
						<td>${list.hit}</td>
						<td>${list.name}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
<%-- 
	게시판 틀을 작성
	게시판 오른쪽 위 부분에서 전체 게시글 개수 출력
	표 형태로 번호,제목,작성일,조회수,글쓴이 반복하여 출력함
--%>

			
			
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" />
				<c:forEach var="i" begin="1" end="<%=total_page%>">
				
					<a href="<c:url value='./BoardListAction.do?pageNum=${i}' /> ">
					
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color='red'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='black'> [${i}]</font>
							</c:otherwise>
						</c:choose>
						
					</a>
					
				</c:forEach>
			</div>
<%-- 
	게시판 하단에 페이지 수를 출력
	현재 선택한 페이지 수는 B태그 이용해서 굵게 표현함
--%>			
			
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp; 
							<select name="items" class="txt">
									<option value="subject">제목에서</option>
									<option value="content">본문에서</option>
									<option value="name">글쓴이에서</option>
							</select>
							<input name="text" type="text"/>
							<input type="submit" id="btnAdd" class="btn btn-primary" 
							value="검색 " >
						</td>
						
						<td width="100%" align="right">
							<a href="#" onclick="checkForm(); return false;" 
							class="btn btn-primary">글쓰기</a>
						</td>
					</tr>
				</table>
			</div>
<%-- 
	게시판 하단에 검색상자 및 글쓰기를 작성함 (제목,본문,글쓴이로 검색)
--%>
			
		</form>
	</div>
</body>
</html>





