<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.BoardDTO"%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<title>게시판 세부내용 보기</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판 상세보기</h1>
		</div>
	</div>
	
	
	<div class="container">
	
		<form action="BoardUpdateAction.do?num=${num}&pageNum=${page}" class="form-horizontal" method="post">
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" class="form-control"	value="${board.name}" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control" value="${board.subject}">
				</div>
			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8">
					<textarea name="content" class="form-control" cols="50" rows="5">${board.content}</textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >등록일자</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control" value="${board.regist_day}" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >조회수</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control" value="${board.hit}" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label" >ip주소</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control" value="${board.ip}" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<c:set var="userId" value="${board.id}" />
					<c:if test="${user_id==userId}">
						
							<a href="./BoardDeleteAction.do?num=${num}&pageNum=${page}" class="btn btn-danger">삭제</a> 
							<input type="submit" class="btn btn-success" value="수정">
					</c:if>
							<a href="./BoardListAction.do?pageNum=${page}" class="btn btn-primary">목록</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>


