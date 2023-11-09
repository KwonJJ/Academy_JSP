<%@page import="model.photoGallery"%>
<%@page import="model.photoGalleryDAO"%>
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
	String p_id = request.getParameter("id");
	memberDAO cyMemberDAO = new memberDAO();
	member user = cyMemberDAO.GetMember(p_id);
	photoGalleryDAO photoDAO = new photoGalleryDAO();
	List<photoGallery> photoList = photoDAO.GetUserPhotoList(p_id);
%>
<title>사진첩</title>
</head>
<body>
	<div class = "container"> 
			<form action="photoGalleryServlet" method="post" name = "frm" enctype = "multipart/form-data">
				<input type="hidden" name="id" value=<%=p_id%> />
				<div>
					<img alt="profile-img-${loginUserId}" src="./resources/img/<%=user.getImgName()%>" style = "width : 200px; height : 200px;">
				</div>
				
				<div>
					제목 입력 : <input type = "text" name = "title">
				</div>
				
				<div>
					글 입력 : <input type = "text" name = "content">
				</div>
			
				<div>
					<input type = "file" name = "image">
				</div>
				
				<div style = "display: flex; padding-top: 5px; padding-bottom: 10px;">
					<input type="text" name="content"/>
					<button type="submit" class = "button">사진 등록</button>
				</div>
			</form>
	
				<div class = "comment">
					<c:forEach var = "photo" items = "<%=photoList %>">
						<div class = "comment-border">
							<p>작성자 : ${photo.id }</p>
							<p>타이틀 : ${photo.title }</p>
							<p>작성 일자 : ${photo.created }</p>
							<p>작성글 : ${photo.content }</p>
							<img alt="photo" src="./resources/img/${photo.image }" style = "width: 200px; height: 200px;">
						</div>
					</c:forEach>
				</div>
	</div>
</body>
</html>