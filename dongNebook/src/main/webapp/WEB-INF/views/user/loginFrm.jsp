<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인하기</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link href="/css/user/loginFrm.css" type="text/css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<form action="/user/login.do" method="post">
		<h1>로그인하기</h1><hr>
			아이디 <input type="text" name="userId"><br>
			비밀번호 <input type="password" name="userPw"><br>
		<button>로그인하기</button>
	</form>
</body>
</html>