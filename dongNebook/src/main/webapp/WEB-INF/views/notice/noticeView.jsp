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
table>tbody>tr{
	text-indent:20px;
}
.contentTd{
	text-align:center;
	height:300px;
}

.main-wrap{
	width:80%;
	margin:0 auto;
}
.adminSideMenu li:nth-child(7) a{
   	background:#a8dba8;
	color:white;
}

.btn-div{
	text-align:right;
}
.btn{
	margin-bottom:15px;
}
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="main-wrap">
		<c:choose>
			<c:when test="${sessionScope.loginAdmin !=null}">
				<jsp:include page="/views/common/adminSide.jsp" />
			</c:when>
			<c:otherwise>
				<jsp:include page="/views/common/userSide.jsp" />
			</c:otherwise>
		</c:choose>
		<div class="contents">
			<div class="admin-contents">
				<div id="main-container" class="main-container nav-effect-1">
				<h1 style="font-size:30px;">공지사항</h1>
	<hr>
	
	<table class="table">
		<tr>
			<th style="width:20%;">제목</th>
			<td>${n.noticeTitle }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${n.noticeWriter }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${n.enrollDate }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:forEach items="${n.fileList }" var="f">
					<a href="javascript:fileDownload('${f.filename }','${f.filepath }')">${f.filename }</a>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="contentTd" style="padding-top:40px;">
				${n.noticeContentBr }<br><br>
				<c:forEach items="${n.fileList }" var="f">
					<script>
						var ext = '${f.filepath}'.split('.').pop().toLowerCase();
						console.log('${f.filepath}');
						console.log("확장자>>"+ext)
						if($.inArray(ext, ['gif','png','jpg','jpeg']) != -1){
							var imgTag = "<img src='/resources/upload/notice/${f.filepath }' width='88%;'><br>";
							$(".contentTd").append(imgTag);
						}
					</script>
					<%-- <img src='/resources/upload/notice/${f.filepath }' width="500px"><br> --%>
				</c:forEach>
			</td>
		</tr>
	</table>
	<div class="btn-div">
		<button onclick="noticeList();" class="btn btn-lg btn-outline-secondary notice-list">목록</button>
		<c:if test="${n.noticeWriter.equals(sessionScope.loginAdmin.nickName) }">
			<button onclick="updateNotice();" class="btn btn-lg btn-primary notice-btn">수정하기</button>
			<button onclick="deleteNotice();" class="btn btn-lg btn-danger notice-btn">삭제하기</button>
		</c:if>
	</div>
		</div></div></div>
	
	</div>
	<script>
      //첨부파일 다운로드
		function fileDownload(filename,filepath){//인코딩작업해주려고 자바스크립트로 함
        	var url = "/notice/noticeDownload.do";
        	var encFilename = encodeURIComponent(filename);
        	var encFilepath = encodeURIComponent(filepath);
        	location.href=url+"?filename="+encFilename+"&filepath="+encFilepath+"&noticeNo="+${n.noticeNo};
     	}
      
      	function noticeList(){
      		location.href="/notice/noticeList.do?reqPage=1";
      	}
		
		function updateNotice(){
			location.href="/notice/updateNoticeFrm.do?noticeNo="+${n.noticeNo};
		}
		
		function deleteNotice(){
			location.href="/notice/deleteNotice.do?noticeNo="+${n.noticeNo};
		}
   </script>

</body>
</html>