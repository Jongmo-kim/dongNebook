<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link href="../css/user/pwSearchFrm.css" type="text/css" rel="stylesheet">
<link href="../css/user/inputBox.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="../css/common/button.css">
<script type="text/javascript" src="../js/user/inputBox.js"></script>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="content">
	<form action="/user/pwSearch.do" method="post">
			<h1>로그인이 안 되시나요?</h1>
				<p>비밀번호를 찾기 위해 가입하셨던 이메일과 아이디를 적어주세요</p>
				<br>
				<br>
			<div class="name inputBox">
		            <input type="text" class="form-textbox" name="userId">
		            <span class="form-label">아이디</span>
		            <span class="additional-info" id="idInfo"></span>
	        </div>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="email">
	            <span class="form-label">이메일</span>
	            <span class="additional-info" id="emailInfo"></span>
	        </div>
	        <div class="submitBtn">
				<button class="btn btn-outline-primary">비밀번호찾기</button>
			</div>
	</form>
	</div>
	<br><br><br><br><br>
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>