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
	table>tbody>tr>th{
		width:150px;
	}
	table>tbody>tr>td{
		width:1000px;
	}
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<c:if test="${n.noticeWriter.equals(sessionScope.loginAdmin.nickName) }">
		<button onclick="deleteNotice();" class="btn btn-danger">삭제하기</button>
		<button onclick="updateNotice();" class="btn btn-primary">수정하기</button>
	</c:if>
	<table border="1">
		<tr>
			<th>제목</th>
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
					<script>
						console.log('${f.filepath}');
					</script>
					<a href="javascript:fileDownload('${f.filename }','${f.filepath }')">${f.filename }</a>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				${n.noticeContentBr }<br>
				<c:forEach items="${n.fileList }" var="f">
					<img src='/resources/upload/notice/${f.filepath }' width="500px"><br>
				</c:forEach>
			</td>
		</tr>
	</table>
	<a href="/notice/noticeList.do?reqPage=1">목록으로 돌아가기</a>
	<script>
      //첨부파일 다운로드
		function fileDownload(filename,filepath){//인코딩작업해주려고 자바스크립트로 함
        	var url = "/notice/noticeDownload.do";
        	var encFilename = encodeURIComponent(filename);
        	var encFilepath = encodeURIComponent(filepath);
        	location.href=url+"?filename="+encFilename+"&filepath="+encFilepath+"&noticeNo="+${n.noticeNo};
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