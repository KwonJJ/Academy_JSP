<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String popupMode = "on";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cookie.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$(function() {
		$("#closeBtn").click(function() {
			$("#popup").hide();
		})
	})
</script>
</head>
<body>
	<%
		for (int i = 1; i <= 10; i++) {
		out.print("현재 팝업창은 " + popupMode + "상태상태입니다." + "<br>");
	}
	if (popupMode.equals("on"))
		;
	{
	%>
	<div id="popup">
		<h2 align="center">공지사항 팝업입니다.</h2>
		<div align="right">
			<form name="popFrm">
				<input type="checkbox" id="inactiveToday" value="1"> 하루 동안
				열지 않음 <input type="button" value="닫기" id="closeBtn">
			</form>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>