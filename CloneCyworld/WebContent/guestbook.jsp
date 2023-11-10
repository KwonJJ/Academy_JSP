<%@page import="model.GuestbookReply"%>
<%@page import="model.Guestbook"%>
<%@page import="java.util.List"%>
<%@page import="model.GuestbookDAO"%>
<%@page import="model.memberDAO"%>
<%@page import="model.member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<link rel="stylesheet" href="./resources/css/guestbook.css" />
<script type="text/javascript" src="./resources/js/guestbook.js"></script>
<%
	String owner_id = request.getParameter("id");
	memberDAO cyMemberDAO = new memberDAO();
	member user = cyMemberDAO.GetMember(owner_id);
	GuestbookDAO guestbookDAO = new GuestbookDAO();
	List<Guestbook> guestbooklist = guestbookDAO.GetUserGuestbookList(owner_id);
%>
<title>방명록</title>
</head>
<body class = "center-layout-column">
	<div class = "container"> 
		<c:if test="${loginUserId ne param.id}">
			<form action="GuestbookServlet" method="post">
				<input type="hidden" name="owner_id" value=<%=owner_id%> />
				<div>
					<img alt="profile-img-${loginUserId}" src="./resources/img/<%=user.getImgName()%>" style = "width : 200px; height : 200px;">
				</div>
				<div style = "display: flex; padding-top: 5px; padding-bottom: 10px;">
					<input type="text" name="content"/>
					<button type="submit" class = "button">방명록 등록</button>
				</div>
			</form>
		</c:if>
	
		<c:forEach var="guestbookDTO" items="<%=guestbooklist%>" varStatus="i">
			<div class = "post" style="border: 1px solid black; background-color: #D5D5D5"> NO.${guestbookList.size()-i.index }
				<div class = "post-content"> 작성자 : ${guestbookDTO.id}</div>
				<img src="./resources/img/${guestbookDTO.imgName}" style = "width : 200px; height : 200px;"/>
				<div class = "post-content"> 작성글 : ${guestbookDTO.content}</div>
				<div class = "post-content"> 작성 일자 : ${guestbookDTO.created}</div>
				
				<form action="GuestbookReplyServlet" method = "post" style = "display: flex;">
					<input type = "hidden" name = "b_no" value = "${guestbookDTO.no}">
					<input type = "hidden" name = "id" value = "<%=owner_id%>">
					
					<div>
						<input type = "text" name = "content" style = "padding: 10px;">
					</div>
						<button class = "button" type = "submit">댓글 작성</button>
				</form>
				
				<c:if test="${loginUserId eq param.id || loginUserId eq owner_id }">
					<form action="GuestbookDeleteServlet" method = "post" style = "padding:10px;">
						<input type = "hidden" name = "deleteNo" value = "${guestbookDTO.no }">
						<input type = "hidden" name = "id" value = "<%=owner_id%>">
						<button type = "submit" class = "button delete-btn" data-no = "{guestbookDTO.no}">게시글 삭제</button>
					</form>
				</c:if>
				
				<%
					Guestbook dt = (Guestbook)pageContext.getAttribute("guestbookDTO");
					int no = dt.getNo();
					List<GuestbookReply> replyList = guestbookDAO.selectReply(no);
				%>
				<div class = "comment">
					<c:forEach var = "reply" items = "<%=replyList %>">
						<div class = "comment-border">
							<p>작성자 : ${reply.id }</p>
							<p>작성 일자 : ${reply.created }</p>
							<p>댓글 : ${reply.content }</p>
						</div>
						
						<c:if test="${loginUserId eq param.id || loginUserId eq owner_id}">
							<form action="GuestbookReplyDeleteServlet" method="post">
								<input type="hidden" name="deleteR_no" value="${reply.r_no}">
								<input type="hidden" name="r_no" value="${guestbookDTO.no}">
								<input type="hidden" name="id" value="<%=owner_id%>">
								<button type="submit" class="button delete_Reply-btn" data-r_no = "{reply.r_no}">댓글 삭제</button>
							</form>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>