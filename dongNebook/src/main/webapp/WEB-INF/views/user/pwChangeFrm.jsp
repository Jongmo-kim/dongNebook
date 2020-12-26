<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<form action="/user/update.do" method="post">
		<h1>비밀번호 변경</h1><hr>
		<input type="hidden" name="userNo" value="${loginUser.userNo }"><br>
		비밀번호 <input type="text" name="userPw"><br>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>