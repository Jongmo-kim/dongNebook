<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
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
				<%-- <a href="javascript:fileDownload('${n.filename }','${n.filepath }')">${n.filename }</a> --%>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${n.noticeContent }</td>
		</tr>
	</table>
	<a href="/notice/noticeList.do?reqPage=1">목록으로 돌아가기</a>

	<script>
      //첨부파일 다운로드
       function fileDownload(filename,filepath){//인코딩작업해주려고 자바스크립트로 함
         var url = "/noticeDownload.do";
         var encFilename = encodeURIComponent(filename);
         var encFilepath = encodeURIComponent(filepath);
         location.href=url+"?filename="+encFilename+"&filepath="+encFilepath+"&noticeNo="+${n.noticeNo};
      }
   </script>

</body>
</html>