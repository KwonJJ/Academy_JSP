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
		request.setCharacterEncoding("utf-8"); // 한글처리

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	if (id.equalsIgnoreCase("jsp") && pw.equalsIgnoreCase("1234")) {
		out.print("환영합니다");
	} else if (id.equalsIgnoreCase("jsp") && pw != "1234") {
		out.print("비밀번호가 틀립니다.");
	} else {
		out.print("사용할 수 없는 아이디 입니다.");
	}
	
/* 강사님 방식
	if (id.equals("jap")) {
		if (pw.equals("1234")) {
			out.print("환영합니다.");
		} else {
			out.print("비밀번호가 틀렸씁니다.");
		}
	} else {
		out.print("사용할 수 없는 아이디입니다.");
	}
*/
	%>
</body>
</html>