<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 1. 쿠키 설정 </h2>
	<%
		Cookie cookie = new Cookie("myCookie", "애플쿠키맛있음"); // 쿠키 생성
		cookie.setPath(request.getContextPath()); // 경로륵 컨텍스트 루트로 설정
		cookie.setMaxAge(60*60); // 1시간 유지
		response.addCookie(cookie); // 응답헤더에 쿠키 추가
	%>
	
	<h2> 2. 쿠키 설정 후 값 확인하기 </h2>
	<% 
		Cookie[] cookies = request.getCookies();
		if( cookies != null ){
			for(Cookie c : cookies){
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				out.print(cookieName + " : " + cookieValue);
			}
		}
	%>
	
	<h2> 3. 페이지 이동 후 쿠키 값 확인하기 </h2>
	<a href = "CookieResult.jsp">다음 페이지에서 확인하기</a>
</body>
</html>