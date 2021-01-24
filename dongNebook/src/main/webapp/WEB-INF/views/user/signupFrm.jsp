<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입하기</title>
<jsp:include page="/views/common/linkHead.jsp"/>

<link rel="stylesheet" href="/css/user/inputBox.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript" src="/js/user/inputBox.js?v=<%=System.currentTimeMillis()%>"></script>
<link rel="stylesheet" href="/css/user/signupFrm.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="/css/common/button.css">
<script type="text/javascript" src="/js/user/signupFrm.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function addrSearch(){
    new daum.Postcode({
        oncomplete: function(data) {
        	$('input[name="addr"]').val(data.address);
        }
    }).open();
	}
</script>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<form name="signFrm" method="post">
		 <div class="container">
		<div style="text-align:center;">		 
	    <h1>회원가입</h1>
	    <br><br>
	     <p>이미 동서남북의 회원이신가요? 
	    <a href="/user/idSearchFrm.do">ID</a> / <a href="/user/pwChangeFrm.do">PW</a>찾기</p>
	    <p style="font-size:14px;">가입을 하면 동서남북의 이용약관, <a href="/views/signup/terms.jsp">개인정보취급방침</a> 및 <a href="/views/signup/privacy.jsp">개인정보3자제공에 동의하게 됩니다.</a><p>
		<br><br>
	    </div>
		<hr>
		<br>
		
	        <div class="name inputBox">
	            <input autofocus type="text" class="form-textbox" id="nameInput"name="userName">
	            <span class="form-label label-focused">이름</span>
	            <span class="additional-info" id="nameInfo"></span>
	        </div>
	        <hr>
	        <br>
	        <div class="inputBox">
	            <input type="text" class="form-textbox phoneInput" id="phoneInput"name="phone">
	            <span class="form-label">전화번호</span>
	            <span class="additional-info" id="phoneInfo"></span>
	        </div>
			<hr>
	        <br>
			<div class="name inputBox">
	            <input type="text" class="form-textbox" id="idInput" name="userId">
	            <span class="form-label">아이디</span>
	            <span class="additional-info" id="idInfo"></span>
	        </div>
	        
	        <div class="name inputBox">
	            <input type="password" class="form-textbox" id="pwInput" name="userPw">
	            <span class="form-label">비밀번호</span>
	            <span class="additional-info" id="pwInfo"></span>
	        </div>
	        <div class="name inputBox">
	            <input type="password" class="form-textbox" id="pwreInput">
	            <span class="form-label">비밀번호확인</span>
	            <span class="additional-info" id="pwreInfo"></span>
	        </div>
	        <hr>
	        <br>
	        
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" id="emailInput" name="email">
	            <span class="form-label">이메일</span>
	            <span class="additional-info" id="emailInfo"></span>
	            
	        </div>
	        <hr>
	        <br>
	        <div class="name inputBox">
	            <input type="text" class="form-textbox readonly"value=" " readonly id="addrInput" name="addr">
	            <span class="form-label label-focused">주소</span>
	            <span class="additional-info" id="addrInfo"></span>
	        </div>
	        
	        <div class="name inputBox">
	            <input type="text" class="form-textbox" name="addrDetail">
	            <span class="form-label">상세주소</span>
	            <button class="btn btn-outline-primary" id="searchBtn" type="button" onclick="addrSearch()">주소검색</button>
	        </div>
	    	<hr>
	    	<br>
			<div class="submitBtn" style="text-align:center;">
				<button class="btn btn-outline-primary" id="submitBtn">
				회원가입하기</button>
			</div>
			
		</div>
		
	</form>
	<jsp:include page="/views/common/footer2.jsp" />
</body>
</html>