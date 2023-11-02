<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory = application.getRealPath("/Uploads"); // 실제 저장 폴더 위치
	int maxPostSize = 5 * 1024 * 1024;   // 파일 최대 용량 5MB
	String encoding = "utf-8";

	MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding,new DefaultFileRenamePolicy());

	String id = mr.getParameter("id");
	String password = mr.getParameter("password");
	String name = mr.getParameter("name");		
	String phone = mr.getParameter("phone");		
	String address = mr.getParameter("address");
	String photoimage = mr.getFilesystemName("photoImage");
	
	File photoFile = new File(saveDirectory + File.separator + photoimage);
	
	MemberDAO dao = new MemberDAO();
		
	String sql = "select * from member";
	PreparedStatement psmt = dao.con.prepareStatement(sql);
	ResultSet rs = psmt.executeQuery();
	
	String result="";
	while(rs.next()) {
		String id2 = rs.getString(1);
		
		if(id.equals(id2)) {
	result="기존회원";		
	request.getRequestDispatcher("addmember.jsp?error=1").forward(request,response);
	break;
		} 
	}
	
	if(result=="") {
		dao.insertMember(id, name, password, phone, address,photoimage);
		dao.close();
	
	}
%>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	
	<div class="container">
			<h1 class="display-5"><%=name%>님 회원가입을 환영합니다!!</h1>
	</div>
</body>
</html>