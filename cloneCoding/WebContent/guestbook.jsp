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
	member user = cyMemberDAO.getMember(owner_id);
	GuestbookDAO guestbookDAO = new GuestbookDAO();
	List<Guestbook> guestbooklist = guestbookDAO.GetUserGuestbookList(owner_id);
%>
<title>방명록</title>
</head>
<body>
	<div> 
		<c:if test="${loginUserId ne param.id}">
			<form action="GuestbookServlet" method="post">
				<input type="hidden" name="owner_id" value=<%=owner_id%> />
				<div>
					<img alt="profile-img-${loginUserId}"
						src="./resources/img/<%=user.getImgName()%>">
				</div>
				<div>
					<input type="text" name="content" />
				</div>
				<button type="submit">등록</button>
			</form>
		</c:if>
		<c:forEach var="guestbookDTO" items="<%=guestbooklist%>" varStatus="i">
			<div style="border: 1px solid black;">
				NO.${guestbookList.size()-i.index }
				<div>${guestbookDTO.id}</div>
				<img src="./resources/img/${guestbookDTO.imgName}" />
				<div>${guestbookDTO.content}</div>
				<div>${guestbookDTO.created}</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>