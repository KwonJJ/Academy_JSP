<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 응답 헤더에 추가할 값 준비
	SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	long add_date = s.parse(request.getParameter("add_date")).getTime();
	int add_int = Integer.parseInt(request.getParameter("add_int"));
	// 8282(문자열) -> 숫자(int)로 변환
	String add_str = request.getParameter("add_str"); // 홍길동

	// 응답 헤더에 값 추가
	response.addDateHeader("myBirthday", add_date);
	response.addIntHeader("myNumber", add_int); // 8282
	response.addIntHeader("myNumber", 1004); // add : 추가(1004)
	response.addHeader("myName", add_str); // 홍길동
	response.setHeader("myName", "안중근"); // set : 수정(안중근)
	%>
	<h2>응답 헤더 정보 출력하기</h2>
	<%
		Collection<String> headerNames = response.getHeaderNames();
	for (String hName : headerNames) {
		String hValue = response.getHeader(hName); // Header -> 1개일 때 가져옴
	%>
	<li><%=hName%> : <%=hValue%></li>
	<%
		}
	%>

	<h2>myNumber만 출력하기</h2>
	<%
		Collection<String> myNumber = response.getHeaders("myNumber"); // Headers -> 여러개일 때 가져옴
	for (String myNum : myNumber) {
	%>
	<li>myNumber : <%=myNum%></li>
	<%
		}
	%>
</body>
</html>