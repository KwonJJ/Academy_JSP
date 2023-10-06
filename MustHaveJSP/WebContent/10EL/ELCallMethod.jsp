<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="el.MyELClass"%>
<%
	MyELClass myClass = new MyELClass();
	pageContext.setAttribute("myClass", myClass);
	String jumin2 = request.getParameter("jumin");
	
	if(jumin2 != null) {
		pageContext.setAttribute("result", myClass.getGender(jumin2));
		String email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
		pageContext.setAttribute("result2", myClass.getId(email));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		이름 : <input type = "text" name = "name"> <br>
		주민번호 : <input type = "text" name = "jumin"><br>
		이메일 : <input type = "text" name = "mail">@
		<select>
			<option value = "naver.com">naver.com</option>
			<option value = "daum.net">daum.net</option>
			<option value = "google.com">google.com</option>
		</select>
		<br>
		<input type = "submit" value = "전송">
	</form>
	
	<h1> 성별 확인</h1>
	<h3> 이름 : ${param.name }</h3>
	<h3> 성별 : ${result }</h3>
	<h3> 이메일 아이디 : ${result2 }</h3>
</body>
</html>