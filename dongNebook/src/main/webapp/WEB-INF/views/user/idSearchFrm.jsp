<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인하기</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<form action="/user/searchId.do" method="post">
		<h1>아이디 찾기</h1><hr>
			이메일 찾기<input type="text" name="email"><br>
			<button>아이디 찾기</button>
	</form>
</body>
</html>