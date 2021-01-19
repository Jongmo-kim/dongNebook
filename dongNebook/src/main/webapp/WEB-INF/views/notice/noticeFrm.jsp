<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp" />
<style>
/* .drag-over { 
	background-color: #ff0; 
} */
table{
	width:100%;
}
table>tbody>tr>th{
	text-indent: 10px;
	width:150px;
}
.adminSideMenu li:nth-child(7) a{
   	background:#a8dba8;
	color:white;
}
.main-wrap{
	width:1200px;
	margin:0 auto;
}
input{
	width: 100%;
	outline:none;
	height : 35px;
	border : 1px solid #cccccc;
}
textarea{
	width:100%;
	height: 200px;
	border : 1px solid #cccccc;
}
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="main-wrap">
	<jsp:include page="/views/common/adminSide.jsp" />
		<!-- 파일 업로드를 하려면 method는 post, enctype는 multipart/form-data를 써야지만 업로드가 가능함! 파일을 업로드 할 폼이라고 미리 명시하는 것 -->
		<div class="contents">
         <h1 style="font-size:30px;">공지사항 작성</h1>
         <hr>
         <br>
				<form id="upFileFrm" action="/notice/insertNotice.do" method="post" enctype="multipart/form-data">
					<table class="table">
						<tr>
							<th>제목</th>
							<td><input type="text" name="noticeTitle" id="noticeTitle"></td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<div class="card text-secondary bg-light mb-3 upfile">
									<div class="card-header text-primary">FILE ZONE</div>
									<!-- <form id="upFileFrm" action="/file/upFile.do" method="post" enctype="multipart/form-data"> -->
										<input type="hidden" name="path" value="/">
										<input type="file" name="files" id="upFile" multiple style="display:none;">					
										<div class="card-body filezone">						
											<div class="card-text">
												<div class="defaultMsg">파일을 여기에 올려주세요</div>
											</div>
										</div>										
									<!-- </form> -->
									<!-- <button type="button" class="btn btn-primary btn-block upBtn">파일전송</button> -->
								</div>
								<!-- <input type="file" name="files" id="input-file" multiple> -->
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="noticeWriter" value="${sessionScope.loginAdmin.nickName }" readonly></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="noticeContent" id="noticeContent" row="3" col="40" style="resize: none;"></textarea></td>
						</tr>
					</table>
					<button type="button" id="insert" class="btn btn-primary">등록하기</button>
					<button type="button" id="back" class="btn btn-outline-secondary">취소</button>
				</form>
			</div>
	</div>
		
	<script>
		var upFiles = new Array();	
		var filezone = $(".filezone");
		filezone.on("dragenter",function(e){        
		    e.stopPropagation();
		    e.preventDefault();
		    $(this).css('border', '3px dashed #593196');
	
		});
		filezone.on("dragleave",function(e){
		    e.stopPropagation();
		    e.preventDefault();
		    $(this).css('border', '3px dashed #a991d4');
		});
		filezone.on("dragover",function(e){
		  	e.stopPropagation();
		  	e.preventDefault();
			$(this).css('border', '3px solid #593196');
		});
	  	filezone.on("drop",function(e){
	    	e.preventDefault();
		    $(this).css('border', '3px dashed #593196');
		    $(".defaultMsg").hide();
		    
		    //드롭한 항목
			var files = e.originalEvent.dataTransfer.files;
		    
		    //파일만큼 반복
		    for(var i=0;i<files.length;i++){
				var div = "<div class='upFileList'><span>"+files[i].name+"</span> <button type='button' class='btn btn-primary btn-sm cancelBtn'>삭제</button></div>" 
			    $(".card-text").append(div);
			    console.log(files[i]);
				upFiles.push(files[i]);
		    }
	    	if(upFiles.lengh == 0){
				$(".defaultMsg").show();
	      		$(this).css('border', '3px dashed #a991d4');
	    	}        
	  	});
		
	  	$(document).on("click",".cancelBtn",function(){
	  		console.log(upFiles);
	  		var idx = $(".cancelBtn").index(this);
	  		$(".upFileList").eq(idx).remove();
	  		upFiles.pop(idx);
	  	});
		
	  	
	  	$("#back").click(function(){
	  		location.href="/notice/noticeList.do?reqPage=1";
	  	});
	  	
		
		
		$("#insert").click(function(event){
			var form = $("#upFileFrm")[0];    	
		  	var frmData = new FormData(form);
			for(var i=0;i<upFiles.length;i++){  		
				frmData.append("files", upFiles[i]);
		  	}  		
			console.log(frmData);
			var title = $("#noticeTitle").val();
			var content = $("#noticeContent").val();
			
			var chk = true;
			if(title==""){
				alert("제목을 입력하세요");
				chk = false;
			}
			if(content==""){
				alert("내용을 입력하세요");
				chk = false;
			}
			
			if(chk){
				$.ajax({
					url : "/notice/insertNotice.do",
					type : "POST",
					data : frmData,
					enctype : "multipart/form-data",
					processData : false,
					contentType : false,
					cache:false,
					success:function(data){
						location.href="/notice/noticeList.do?reqPage=1";
					}
				})
			}
		})
	</script>
</body>
</html>