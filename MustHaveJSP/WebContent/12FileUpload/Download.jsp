<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>


<%
	String saveDirectory = application.getRealPath("/Uploads"); // 실제 저장 폴더 위치
	String saveFilename = request.getParameter("sName");
	String originalFilename = request.getParameter("oName");
	
	try{
		File file = new File(saveDirectory, saveFilename);
		InputStream inStream = new FileInputStream(file);
		
		String client = request.getHeader("User-Agent");
		
		if(client.indexOf("WOW64") == 1){
			// 브라우저가 인터넷 익스플로러가 아니면 utf-8,
			// 인테넛 익스플로러면 ksc5601방식으로 한글 처리
			originalFilename = new String(originalFilename.getBytes("utf-8"), "ISO-8859-1");
		} else{
			originalFilename = new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
		}
		
		response.reset(); // 응답 헤더 초기화
		response.setContentType("application/octet-stream"); // 8비트 스트림 설정
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
		response.setHeader("Content-Length", "" + file.length());
		
		out.clear(); // 출력 스트림 초기화
		
		OutputStream outStream = response.getOutputStream();
		byte b[] = new byte[(int)file.length()];
		int readBuffer = 0;
		while((readBuffer = inStream.read(b)) > 0) {
			outStream.write(b, 0, readBuffer);
		}
		
		inStream.close();
		outStream.close();
		
	} catch(Exception e){
		e.printStackTrace();
		JSFunction.alertBack("예외가 발생했습니다.", out);
	}
%>