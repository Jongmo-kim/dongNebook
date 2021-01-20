<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link href="../css/user/mypageFrm.css" type="text/css" rel="stylesheet">
<link href="../css/user/inputBox.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="../css/common/button.css">
<script type="text/javascript" src="../js/user/inputBox.js"></script>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="content">
	<form action="/user/update.do" method="post">
		<h1 style="text-aligin:center;">비밀번호 변경</h1><hr>
		<br>
            <input type="hidden" name="userNo" value="${loginUser.userNo }" >
            <div class="name inputBox">
				<input type="password" name="userPw" class="form-textbox">
	            <span class="form-label">현재 비밀번호</span>
	            <span class="additional-info" id="pwInfo"></span>
        	</div>
	        <hr>
			<div class="name inputBox">
				<input type="password" name="userPw" class="form-textbox">
	            <span class="form-label">변경할 비밀번호</span>
	            <span class="additional-info" id="pwInfo"></span>
        	</div>
			<div class="name inputBox">
				<input type="password" name="userPwre" class="form-textbox">
	            <span class="form-label">비밀번호확인</span>
	            <span class="additional-info" id="pwreInfo"></span>
        	</div>
        <div class="submitBtn">
        	<button class="btn btn-outline-primary">수정하기</button>
        </div>
	</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>