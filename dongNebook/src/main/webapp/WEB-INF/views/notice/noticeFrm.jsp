<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<section>
		<!-- 파일 업로드를 하려면 method는 post, enctype는 multipart/form-data를 써야지만 업로드가 가능함! 파일을 업로드 할 폼이라고 미리 명시하는 것 -->
 			<form action="/notice/insertNotice.do" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<th colspan="2">공지사항 작성</th>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="noticeTitle"></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<input multiple="multiple" type="file" name="filename">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="noticeWriter" value="${sessionScope.loginUser.userId }" readonly>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="noticeContent" row="3" col="40"></textarea></td>
					</tr>
					<tr>
						<th colspan="2">
							<button type="submit" class="btn btn-primary">등록하기</button>
						</th>
					</tr>
				</table>
			</form>
			<a href="/notice/noticeList.do?reqPage=1">목록으로 돌아가기</a>
	</section>
</body>
</html>