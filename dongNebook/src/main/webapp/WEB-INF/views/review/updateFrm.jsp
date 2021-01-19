<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 쓰기</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link rel="stylesheet" href="/lib/choices/choices.min.css" type="text/css">
<script src="/lib/choices/choices.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<h2>리뷰 수정하기</h2>
	<hr>
	<div class="content">
	<form action="/review/update.do" method="post" accept-charset="UTF-8">
		<input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo }">
		<input type="hidden" name="reviewNo" value="${view.reviewNo }">
		<input type="text" name="title" value="${view.title }">
		<textarea rows="5" name="content" cols="50" style="resize:none;">${view.content }</textarea>
		
		<select class="form-control" name="tags" id="choices" placeholder="This is a placeholder" multiple>
			<c:forEach var="t" items="${tags }">
				<option value="${t.book.bookName }" selected>${t.book.bookName }</option>
			</c:forEach>
		</select>
		<button>수정하기</button>
	</form>
	<form name="delete" method="post">
		<input type="hidden" name="reviewNo" value="${view.reviewNo }">
		<button class="deleteBtn">삭제하기</button>
	</form>
	</div>
	<script src="/js/review/updateFrm.js" type="text/javascript"></script>
</body>
</html>