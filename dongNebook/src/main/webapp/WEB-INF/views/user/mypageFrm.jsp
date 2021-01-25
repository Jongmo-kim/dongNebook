<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link href="../css/user/inputBox.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="../css/common/button.css">
<script type="text/javascript" src="../js/user/inputBox.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link href="../css/user/mypageFrm.css" type="text/css" rel="stylesheet">

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
	
	<div class="content">	
		
	<form action="/user/update.do" method="post">
		<h1>내 정보 수정하기</h1><hr>
		<input type="hidden" name="userNo" value="${loginUser.userNo }">
		<br>
		<div class="name inputBox">
				
	            <input type="text" name="userId" value="${loginUser.userId }" style="background-color: #80808030;" readonly class="form-textbox">
	            <span class="form-label label-focused">아이디</span>
	            <span class="additional-info" id="idInfo"></span>
        </div>
		<div class="name inputBox">
	            <input type="text" name="userName" value="${loginUser.userName }" style="background-color: #80808030;" readonly class="form-textbox">
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
	            <input type="text" name="addr" value="${loginUser.addr }" readonly style="background-color: #80808030;"class="form-textbox">
	            <span class="form-label label-focused">주소</span>
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
	
	<form name="delete" style="text-align:right; width:80%;">
	<input type="hidden" name="userNo" value="${loginUser.userNo }"><br>
	<button type="button" class="btn btn-outline-primary" onclick="rentalList();">대출 목록</button>
		<button class="btn btn-outline-primary">탈퇴하기</button>
	</form>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
	<script>
	function rentalList(){
		location.href="/rentalList.do?reqPage=1&userNo="+$("input[name=userNo]").val();
	}
	document.delete.addEventListener('submit',deleteFunc);

	function deleteFunc(e){
	  e.preventDefault();
	  const swalWithBootstrapButtons = Swal.mixin({
	  customClass: {
	    confirmButton: 'btn btn-success',
	    cancelButton: 'btn btn-danger'
	  },
	  buttonsStyling: false
	})
	//
	swalWithBootstrapButtons.fire({
	  title: '정말 탈퇴하실 건가요?',
	  text: "저장된 모든 정보가 파기됩니다.",
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonText: '탈퇴하기',
	  cancelButtonText: '취소하기',
	  reverseButtons: true
	}).then((result) => {
	  if (result.isConfirmed) {
	    document.delete.action = "/user/delete.do";
	    document.delete.submit();
	  }
	})
	}
	</script>
	<jsp:include page="/views/common/footer2.jsp" />
</body>
</html>