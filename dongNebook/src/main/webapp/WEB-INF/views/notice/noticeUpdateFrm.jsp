<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp" />
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<form action="/notice/updateNotice.do" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="noticeNo" value=${n.noticeNo }>
		<table border="1">
			<tr>
				<th colspan="2">공지사항 수정</th>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="noticeTitle"
					value=${n.noticeTitle }></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
				<input type="file" name="filename" multiple>
				<c:choose>
					<c:when test="${n.fileList != null}">
						
							<c:forEach items="${n.fileList }" var="f">
								<div class="fileWrap">
									<input type="hidden" class="status" name="status" value="stay"> 
									<img src="/common/file.png" width="16px" class="delFile">
									<span class="delFile">${f.filename }</span>
									<button type="button"class="btn btn-primary btn-sm delFile fileDelBtn">삭제</button>
									
									<!-- 기존 파일 -->
									<input type="hidden" name="oldFilename" class="oldFilename" value=${f.filename }>
									<input type="hidden" name="oldFilepath" class="oldFilepath" value=${f.filepath }>
								</div>
							</c:forEach>
					</c:when>
				</c:choose>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="noticeWriter" value="${sessionScope.loginUser.userName }" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="noticeContent" row="3" col="40">${n.noticeContent }</textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="submit" class="btn btn-primary">수정하기</button>
				</th>
			</tr>
		</table>
		<input type="hidden" name="delFileList" id="delFileList">
	</form>
	<script>
		var arr = new Array();	
		$(".fileDelBtn").click(function() {
			var idx = $(".fileDelBtn").index(this);
			if (confirm('첨부파일을 삭제하시겠습니까?')) {
				//해당 파일의 div를 숨김처리
				$(".fileWrap").eq(idx).hide();
				
				//삭제한 첨부파일의 이름을 받아온 후 배열에 넣어줌
				//var delFileName = $(".fileWrap").eq(idx).children('span').html();
				var delFilepath = $(".oldFilepath").eq(idx).val();
				arr.push(delFilepath);
				
				//input hidden에 첨부파일의 이름(filepath)을 넣어줌
				$("#delFileList").val(arr);
				
				//$("#status").eq(idx).value("delete");
				
				//모든 div가 숨김처리되면 input file이 보이게 하고싶음
			}
		});
	</script>
</body>
</html>