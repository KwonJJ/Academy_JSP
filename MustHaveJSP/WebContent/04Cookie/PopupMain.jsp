<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String popupMode = "on";

	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			if(cookieName.equals("PopupClose")){
				popupMode = cookieValue;
			}
		}
	}
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
			var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
			
			$.ajax({
				url : "PopupCookie.jsp", 
				type : "get",
				data : {inactiveToday : chkVal},
				dataType : "text",
				success : function(resData){
					if(resData != "") location.reload();
				}
			 });
		});
	});
</script>
</head>
<body>
	<%
		for (int i = 1; i <= 10; i++) {
		out.print("현재 팝업창은 " + popupMode + "상태입니다." + "<br>");
	}
	if (popupMode.equals("on"))
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