<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인하기</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link href="../css/user/loginFrm.css" type="text/css" rel="stylesheet">
<link href="../css/user/inputBox.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="../js/user/inputBox.js"></script>
<link rel="stylesheet" href="../css/common/button.css">
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="content">
		<form action="/user/login.do" method="post">
			<h1>로그인하기</h1><hr>
			    <div class="name inputBox">
		            <input type="text" class="form-textbox" name="userId">
		            <span class="form-label">아이디</span>
		            <span class="additional-info" id="idInfo"></span>
		        </div>
				
			    <div class="name inputBox">
		            <input type="password" class="form-textbox" name="userPw">
		            <span class="form-label">비밀번호</span>
		            <span class="additional-info" id="pwInfo"></span>
		        </div>
		        <div class="submitBtn">
					<button class="btn btn-outline-primary">로그인하기</button>
				</div>
		</form>
		<div class="searchFrm">
			<a href="/user/idSearchFrm.do">ID 찾기</a>
			<a href="/user/pwSearchFrm.do">비밀번호 찾기</a>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>