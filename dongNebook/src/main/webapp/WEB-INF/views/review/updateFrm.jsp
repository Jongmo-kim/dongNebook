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
<link rel="stylesheet" href="../css/review/content.css" type="text/css">
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="content">
	<h2>리뷰 수정하기</h2>
	<hr>
	<form action="/review/update.do" method="post" accept-charset="UTF-8">
		<input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo }">
		<input type="hidden" name="reviewNo" value="${view.reviewNo }">
		<table class="table table-bordered">
				<tr>
					<th style="width:10%;">
						제목
					</th>
					<td style="width:75%;">
						<input type="text" name="title" value="${view.title }" style="width:100%;">
					</td>
				</tr>
				<tr>
					<th>
						내용
					</th>
					<td>
						<textarea rows="5" name="content" cols="50" style="resize:none; width:100%;">${view.content }</textarea>
					</td>
				</tr>
				<tr>
					<th>
						책 태그
					</th>
					<td>
					<select class="form-control" name="tags" id="choices" placeholder="This is a placeholder" multiple>
						<c:forEach var="t" items="${tags }">
							<option value="${t.book.bookName }" selected>${t.book.bookName }</option>
						</c:forEach>
					</select>
					</td>
				</tr>
		</table>
		
		
		<div style="text-align:right">
		<button class=" btn btn-lg btn-outline-secondary">수정하기</button>
		</div>
	</form>
	
	</div>
	
	<script src="/js/review/updateFrm.js" type="text/javascript"></script>
</body>
</html>