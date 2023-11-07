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
<%
	String owner_id = request.getParameter("id");
	memberDAO cyMemberDAO = new memberDAO();
	member user = cyMemberDAO.GetMember(owner_id);
	GuestbookDAO guestbookDAO = new GuestbookDAO();
	List<Guestbook> guestbooklist = guestbookDAO.GetUserGuestbookList(owner_id);
%>
<title>방명록</title>
</head>
<body>
	<div> 
		<c:if test="${loginUserId ne param.id}">
			<form action="Guestbook
			Servlet" method="post">
				<input type="hidden" name="owner_id" value=<%=owner_id%> />
				<div>
					<img alt="profile-img-${loginUserId}" src="./resources/img/<%=user.getImgName()%>" style = "width : 200px; height : 200px;">
				</div>
				<div>
					<input type="text" name="content" />
				</div>
				<button type="submit">등록</button>
			</form>
		</c:if>
	
		<c:forEach var="guestbookDTO" items="<%=guestbooklist%>" varStatus="i">
			<div style="border: 1px solid black;"> NO.${guestbookList.size()-i.index }
				<div>${guestbookDTO.id}</div>
				<img src="./resources/img/${guestbookDTO.imgName}" style = "width : 200px; height : 200px;"/>
				<div>${guestbookDTO.content}</div>
				<div>${guestbookDTO.created}</div>
				
				<form action="GuestbookReplyServlet" method = "post">
					<input type = "hidden" name = "b_no" value = "${guestbookDTO.no}">
					<input type = "hidden" name = "id" value = "<%=owner_id%>">
					
					<div>
						<input type = "text" name = "content">
					</div>
					<button type = "submit">댓글 작성</button>
				</form>
				<%
					Guestbook dt = (Guestbook)pageContext.getAttribute("guestbookDTO");
					int no = dt.getNo();
					List<GuestbookReply> replyList = guestbookDAO.selectReply(no);
				%>
				<div>
					<c:forEach var = "reply" items = "<%=replyList %>">
						<p>${reply.id }</p>
						<p>${reply.created }</p>
						<p>${reply.content }</p>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>