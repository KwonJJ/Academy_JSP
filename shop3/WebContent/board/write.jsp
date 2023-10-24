<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">


<title>Board</title>

</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	
	<div class="container">
	
		<form name = "newWrite" action="./BoardWriteAction.do" class = "form-horizontal" method="post">
			
			<div class="form-group row">
				<label class = "col-sm-2 control-label">아이디</label>		
				<div class = "col-sm-3">
					<input name = "id" type = "text" class = "form-control" value = "${user_id }" readonly>
				</div>	
			</div>
			
			<div class="form-group row">
				<label class = "col-sm-2 control-label">이름</label>		
				<div class = "col-sm-3">
					<input name = "name" type = "text" class = "form-control" value = "${user_name }" readonly>
				</div>	
			</div>
			
			<div class="form-group row">
				<label class = "col-sm-2 control-label">제목</label>		
				<div class = "col-sm-3">
					<input name = "subject" type = "text" class = "form-control" placeholder = "제목">
				</div>	
			</div>
			
			<div class="form-group row">
				<label class = "col-sm-2 control-label">내용</label>		
				<div class = "col-sm-3">
					<textarea name = "content" placeholder = "내용"></textarea>
				</div>	
			</div>
			
			
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<td width = "100%" align = "left">
							<input type = "submit" id = "btnAdd" class = "btn btn-primary" value = "등록">
							<input type = "submit" id = "btnCancel" class = "btn btn-primary" value = "취소">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>





