<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<form action="/user/update.do" method="post">
		<h1>수정하기</h1><hr>
		카테고리
		<select name="categoryName">
			<option value="컴퓨터">컴퓨터</option>
			<option value="사회">사회</option>
		</select>
		<input type="hidden" name="userNo" value="${loginUser.userNo }"><br>
		아이디 <input type="text" name="userId" value="${loginUser.userId }"><br>
		이름 <input type="text" name="userName" value="${loginUser.userName }"><br>
		전화번호 <input type="text" name="phone" value="${loginUser.phone }"><br>
		이메일 <input type="text" name="email" value="${loginUser.email }"><br>
		주소 <input type="text" name="addr" value="${loginUser.addr }"><br>
		<input type="submit" value="수정하기">
	</form>
</body>
</html>