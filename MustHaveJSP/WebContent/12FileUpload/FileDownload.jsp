<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*" %>
<%
	String saveDirectory = application.getRealPath("/Uploads"); // 실제 저장 폴더 위치
	String saveFilename = request.getParameter("sName");
	String originalFileName = request.getParameter("oName");
%>