<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String saveDirectory = application.getRealPath("/Uploads"); // 실제 저장 폴더 위치
	int maxPostSize = 1024 * 1000;   // 파일 최대 용량 1MB
	String encoding = "utf-8";
	
	try {
		MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding);
		
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String[] cateArray = mr.getParameterValues("cate");
		
		StringBuffer cateBuf = new StringBuffer();
		if(cateArray==null) {
			cateBuf.append("선택 없음");
		} else {
			for(String s : cateArray) {
				cateBuf.append(s + ", ");
			}
		}
		
		String fileName = mr.getFilesystemName("attachedFile");
		// 업로드한 파일 이름
		String ext = fileName.substring(fileName.lastIndexOf("."));
		// 업로드한 파일 이름에서 확장자를 빼옴 (예 장동건.jpg -> .jpg)
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		// 현재 날짜 시간 저장
		String newFileName = now + ext;
		// 신규 파일명 생성   예) 장동건.jpg -> 20231012_133925.jpg

		File oldFile = new File(saveDirectory+File.separator + fileName);
		File newFile = new File(saveDirectory+File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		MyfileDTO dto = new MyfileDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		
		MyfileDAO dao = new MyfileDAO();
		dao.insertFile(dto);
		dao.close();
		
		response.sendRedirect("FileList.jsp");
		
		
		
	} catch(Exception e) {
		e.printStackTrace();
		request.setAttribute("errorMessage","파일 업로드 오류");
		request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	}
%>
