<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입하기</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<form action="/user/signup.do" method="post">
		<h1>회원가입</h1><hr>
		카테고리
		<select name="categoryName">
			<option value="컴퓨터">컴퓨터</option>
			<option value="사회">사회</option>
		</select>
		아이디 <input type="text" name="userId"><br>
		비밀번호 <input type="password" name="userPw"><br>
		이름 <input type="text" name="userName"><br>
		전화번호 <input type="text" name="phone"><br>
		이메일 <input type="text" name="email"><br>
		주소 <input type="text" name="addr"><br>
		<input type="submit" value="회원가입하기">
	</form>
</body>
</html>