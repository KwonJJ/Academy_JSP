<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String outerPath1 = "inc/Outerpage01.jsp";
	String outerPath2 = "inc/Outerpage02.jsp";
	String outerPath3 = "inc/Outerpage03.jsp";
	// 포함할 파일의 경로
	
	pageContext.setAttribute("pAttr", "동명왕"); 
	request.setAttribute("rAttr", "온조왕");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 지시어로 페이즈 포함하기 </h2>
	<%@ include file = "inc/OuterPage01.jsp" %>
	<p> 외부 파일에 선언한 변수 : <%=newVar1 %></p>
	<!-- 지시어 방식 -->
	
	<h3> 액션 태그로 페이지 포함하기 </h3>
	<jsp:include page="inc/OuterPage02.jsp"/>
	<!-- 액션 태그 방식 -->
</body>
</html>