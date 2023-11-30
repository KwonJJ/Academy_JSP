<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>비회원 로그인 페이지</title>
</head>
<body>
	<div>
		<div>
			<h1>비회원 로그인</h1>
			<h1>${warning }</h1>
			<form action="#" method="post">
				<div>
					<div>
						<label>주문자명</label>
						<input type="text" name="name" />
					</div>
					<div>
						<label>주문번호</label>
						<input type="text" name="ordernumber" />
					</div>
				
					<div>
						<button type="submit">주문내역 조회하기</button>
					</div>
				</div>
			</form>
			<p >
				계정이 없으신가요? <a href="Register.jsp">회원가입</a>
			</p>
		</div>
	</div>
</body>
</html>