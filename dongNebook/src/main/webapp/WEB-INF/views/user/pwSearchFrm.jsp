<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<form action="/user/pwSearch.do" method="post">
		<h1>비밀번호 찾기</h1><hr>
			아이디<input type="text" name="userId"><br>
			이메일<input type="text" name="email"><br>
			<button>비밀번호찾기</button>
	</form>
</body>
</html>