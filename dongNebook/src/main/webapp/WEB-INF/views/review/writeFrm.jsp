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
	<h2>리뷰 쓰기</h2>
	<hr>
	<div class="content">
	<form action="/review/write.do" method="post" accept-charset="UTF-8">
		<input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo }">
		<input type="text" name="title" value="title">
		<textarea rows="5" name="content" cols="50" style="resize:none;">왕</textarea>
		
		<select class="form-control" name="tags" id="choices" placeholder="This is a placeholder" multiple>
		</select>
		<button>제출하기</button>
	</form>
	</div>
	<script src="/js/review/writeFrm.js" type="text/javascript"></script>
</body>
</html>