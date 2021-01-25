<!-- @author 진수경 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<jsp:include page="/views/common/linkHead.jsp" />
<style>
table{
	width:100%;
}
table>tbody>tr>th{
	text-indent: 10px;
	width:150px;
}
table>tbody>tr>td{
	vertical-align: middle;
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
	height: 400px;
	border : 1px solid #cccccc;
	outline : none;
}
.btn-div{
	text-align:right;
}
.defaultMsg{
position: relative;
	text-align: center;
}
svg:not(:root).svg-inline--fa {
    position: absolute;
    margin: 0px;
    overflow: visible;
}
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="contents-frame">
	<div class="contents">
	<jsp:include page="/views/common/adminSide.jsp" />
	<div class="admin-contents">
	<div id="main-container" class="main-container nav-effect-1">
	<h1 style="font-size:30px;">공지사항 수정</h1>
	<hr>
	<form action="/notice/updateNotice.do" id="updateFrm" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="noticeNo" id="noticeNo" value=${n.noticeNo }>
		<table class="table">
			<tr>
				<th>제목</th>
				<td><input type="text" name="noticeTitle"
					value='${n.noticeTitle }'></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<div class="card text-secondary bg-light mb-3 upfile">
							<input type="file" name="files" id="upFile" multiple style="display:none;">					
							<div class="card-body filezone">						
								<div class="card-text">
											<div class="defaultMsg">
													<i class="fas fa-upload"></i><br>
													여기에 파일을 올려주세요
											</div>
											<c:forEach items="${n.fileList }" var="f">
												<div class='upFileList'>
													<span>${f.filename }</span> <button type='button' class='btn btn-primary btn-sm fileDelBtn'>삭제</button>
													<input type="hidden" name="oldFilename" class="oldFilename" value='${f.filename }'>
													<input type="hidden" name="oldFilepath" class="oldFilepath" value='${f.filepath }'>
												</div>
											</c:forEach>
								</div>
							</div>										
					</div>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="noticeWriter" value="${sessionScope.loginAdmin.nickName }" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="noticeContent" row="3" col="40" style="resize: none;">${n.noticeContent }</textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="updateNotice();" class="btn btn-lg btn-primary">수정하기</button>
					<button id="cancel" class="btn btn-lg btn-outline-secondary">취소</button>
				</th>
			</tr>
		</table>
		<input type="hidden" name="delFileList" id="delFileList">
	</form>
	</div>
	</div>
	</div>
	</div>
	
	<script>
		if($('.upFileList').length==0){
			$(".defaultMsg").show();
		} else {
			$(".defaultMsg").hide();
		}
		var upFiles = new Array();	
		var filezone = $(".filezone");
		filezone.on("dragenter",function(e){        
		    e.stopPropagation();
		    e.preventDefault();
		    $(this).css('border', '3px dashed #3b8686');
	
		});
		filezone.on("dragleave",function(e){
		    e.stopPropagation();
		    e.preventDefault();
		    $(this).css('border', '3px dashed #a8dba8');
		});
		filezone.on("dragover",function(e){
		  	e.stopPropagation();
		  	e.preventDefault();
		  	$(this).css('border', '3px solid #3b8686');
		});
	  	filezone.on("drop",function(e){
	  		e.preventDefault();
		    $(this).css('border', 'none');
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
		/* 
	  	$(document).on("click",".cancelBtn",function(){
	  		var idx = $(".cancelBtn").index(this);
	  		//$(".upFileList").eq(idx).remove();
	  		$(this).parent("div.upFileList").remove();
	  		upFiles.pop(idx);
	  	}); */
	  	
	  	$(document).on("click",".cancelBtn",function(){
	  		console.log(upFiles);
	  		var idx = $(".cancelBtn").index(this);
	  		$(".upFileList").eq(idx).remove();
	  		upFiles.pop(idx);
	  		
	  		//upFileList(첨부파일 div)가 없으면 defaultMsg를 보여줌
	  		if($('.upFileList').length==0){
	  			$(".defaultMsg").show();
	  		}
	  		console.log(upFiles);
	  	});
	
	
	  	$("#cancel").click(function(event){
	  		event.preventDefault();
	  		var noticeNo=$("#noticeNo").val();
			location.href="/notice/noticeView.do?noticeNo="+noticeNo;
	  	})
	
	  	function updateNotice(){
			var form = $("#updateFrm")[0];    	
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
					url : "/notice/updateNotice.do",
					type : "POST",
					data : frmData,
					enctype : "multipart/form-data",
					processData : false,
					contentType : false,
					cache:false,
					success:function(data){
						location.href="/notice/noticeView.do?noticeNo="+$("#noticeNo").val();
					}
				})
			}
		}
	
	
	
	
	
	
		var arr = new Array();	
		$(".fileDelBtn").click(function() {
			var idx = $(".fileDelBtn").index(this);
			//if (confirm('첨부파일을 삭제하시겠습니까?')) {
				var idx = $(".fileDelBtn").index(this);
				//삭제한 첨부파일의 이름을 받아온 후 배열에 넣어줌
				//var delFileName = $(".fileWrap").eq(idx).children('span').html();
				var delFilepath = $(".oldFilepath").eq(idx).val();
				arr.push(delFilepath);
		  		$(".upFileList").eq(idx).remove();
				
				//input hidden에 첨부파일의 이름(filepath)을 넣어줌
				$("#delFileList").val(arr);
				console.log(arr);
			//}
		});
	</script>
</body>
</html>