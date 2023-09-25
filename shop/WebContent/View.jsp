<%@page import="java.util.List"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();

	dao.updateVisitCount(num); // 게시물 조회수 증가
	BoardDTO dto = dao.selectView(num);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상세 게시물 보기</title>
<style>
#col{
	margin-bottom : 20px;
}
</style>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%@ include file="LoginCheck.jsp"%>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상세 게시물 보기</h1>
		</div>
	</div>

	<div class="container" align="center">
		<form action="EditBoardProcess.jsp" method = "post">
		<input type = "hidden" name = "id" value = "<%=dto.getId() %>">

		<div class="row g-2 align-items-cemter" id="col">
			<div class="col-auto">
				<label for="num" class="col-form-label">게시물 번호</label>
			</div>

			<div class="col-auto">
				<input type="text" id="num" name="num" class="form-control"
					value="<%=dto.getNum()%>" readonly>
			</div>
		</div>



			<div class="row g-2 align-items-cemter" id="col">
				<div class="col-auto">
					<label for="name" class="col-form-label">작성자 이름</label>
				</div>

				<div class="col-auto">
					<input type="text" id="name" name="name" class="form-control"
						value="<%=dto.getName()%>" readonly>
				</div>
			</div>



			<div class="row g-2 align-items-cemter" id="col">
				<div class="col-auto">
					<label for="title" class="col-form-label">게시물 제목</label>
				</div>

				<div class="col-auto">
					<input type="text" id="title" name="title" class="form-control"
						value="<%=dto.getTitle()%>">
				</div>
			</div>



			<div class="row g-2 align-items-cemter" id="col">
				<div class="col-auto">
					<label for="content" class="col-form-label">게시물 내용</label>
				</div>

				<div class="col-auto">
					<textarea class="form-control" name="content"><%=dto.getContent()%></textarea>
				</div>
			</div>



			<div class="row g-2 align-items-cemter" id="col">
				<div class="col-auto">
					<label for="visitcount" class="col-form-label">게시물 조회수</label>
				</div>

				<div class="col-auto">
					<input type="text" id="visitcount" name="visitcount" class="form-control"
						value="<%=dto.getVisitcount()%>">
				</div>
			</div>

					
			<div class="row g-2 align-items-cemter" id="col">
				<button type = "button" onclick = "location.href = 'boardmain.jsp';">목록보기</button>
				<button type = "submit">게시물 수정</button>
				<button type = "button" onclick = "location.href = 'Delete.jsp';">게시물 삭제</button>
			</div>
		</form>
	</div>
	

</body>
</html>