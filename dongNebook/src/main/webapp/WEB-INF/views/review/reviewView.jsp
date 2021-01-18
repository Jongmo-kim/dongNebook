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


</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<h2>리뷰 보기</h2>
	<hr>
	<div class="content">
	<form action="/review/updateFrm.do" method="post">
		<input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo }">
		<input type="hidden" name="reviewNo" value="${view.reviewNo}">
		<input type="text" name="title" value="${view.title}">
		<textarea rows="5" name="content" cols="50" style="resize:none;">${view.content}</textarea>
		
		<c:forEach var="t" items="${tags }">
			<a href="/book/searchBook.do?reqPage=1&searchKeyword=전체&inputStr=${t.book.bookName }">${t.book.bookName }</a>
		</c:forEach>
		<c:if test="${sessionScope.loginUser.userNo == view.user.userNo }">
			<button>수정하기</button>
		</c:if>
	</form>
	</div>
	<script src="/js/review/reviewView.js" type="text/javascript"></script>
</body>
</html>