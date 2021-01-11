<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link href="../css/user/mypageFrm.css" type="text/css" rel="stylesheet">
<link href="../css/user/inputBox.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="../css/common/button.css">
<script type="text/javascript" src="../js/user/inputBox.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function addrSearch(){
    new daum.Postcode({
        oncomplete: function(data) {
        	$('input[name="addr"]').val(data.address);
        	$('input[name="addrPostcode"]').val(data.zonecode);
        }
    }).open();
	}
</script>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<form action="/user/update.do" method="post">
		<h1>수정하기</h1><hr>
		<input type="hidden" name="userNo" value="${loginUser.userNo }">
		<div class="name inputBox">
	            <input type="text" name="userId" value="${loginUser.userId }" class="form-textbox">
	            <span class="form-label label-focused">아이디</span>
	            <span class="additional-info" id="idInfo"></span>
        </div>
		<div class="name inputBox">
	            <input type="text" name="userName" value="${loginUser.userName }" class="form-textbox">
	            <span class="form-label label-focused">이름</span>
	            <span class="additional-info" id="nameInfo"></span>
        </div>
		<div class="name inputBox">
	            <input type="text" name="phone" value="${loginUser.phone }" class="form-textbox">
	            <span class="form-label label-focused">전화번호</span>
	            <span class="additional-info" id="phoneInfo"></span>
        </div>
		<div class="name inputBox">
	            <input type="text" name="email" value="${loginUser.email }" class="form-textbox">
	            <span class="form-label label-focused">이메일</span>
	            <span class="additional-info" id="emailInfo"></span>
        </div>
		<div class="name inputBox">
	            <input type="text" name="addr" value="${loginUser.addr }" class="form-textbox">
	            <span class="form-label label-focused">주소</span>
	            <span class="additional-info" id="addrInfo"></span>
        </div>
        <div class="name inputBox">
            <input type="text" class="form-textbox readonly" value=" "readonly name="addrPostcode">
            <span class="form-label label-focused">Zipcode</span>
            <button class="btn btn-outline-primary" id="searchBtn" type="button" onclick="addrSearch()">주소검색</button>
        </div>
        <div class="submitBtn">
			<button class="btn btn-outline-primary">수정하기</button>
		</div>
	</form>
	<form action="/user/pwChangeFrm.do" method="post">
		<input type="hidden" name="userNo" value="${loginUser.userNo }"><br>
		<div class="submitBtn">
			<button class="btn btn-outline-primary">비밀번호 수정하기</button>
		</div>
	</form>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	<jsp:include page="/views/common/footer.jsp" />
</body>
</html>