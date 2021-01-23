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

<link rel="stylesheet" type="text/css" href="/lib/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="/lib/slick/slick-theme.css"/>



<style>
	.content{
	width:80%;
	margin: 0 auto;
	}
</style>

</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="content">
	<h2>리뷰 보기</h2>
	<hr>

	<form action="/review/updateFrm.do" method="post">
		<input type="hidden" name="userNo" value="${sessionScope.loginUser.userNo }">
		<input type="hidden" name="reviewNo" value="${view.reviewNo}">
		<table class="table table-bordered">
				<tr>
						<td>
							<h2>${view.title}</h2>
							<h4 style="text-align:right;">글쓴이 : ${view.user.userName }</h4>
						</td>
				</tr>
				<tr>
				<td>
				<div style="width:1300px">
				<div class="your-class">
					<c:forEach var="t" items="${tags }">
					<div style="text-align:center; outline:none;">
						<img src="${t.book.imageurl }" style="width:180px; display:inline; height:270px;">
						</div>
					</c:forEach>
					</div>
					</div>
					</td>
					
					</tr>
			<tr>
				<td>
					<p>${view.content}</p>
				</td>
			<tr>
			<c:forEach var="t" items="${tags }">
			<tr>
				<td>
				<a href="/book/selectOneBook.do?bookNo=${t.book.bookNo }">#${t.book.bookName }</a>
				
				</td>
			</tr>
			</c:forEach>
			
			  </table>
			  <div style="text-align:center;">
		<c:choose>
			<c:when test="${sessionScope.loginUser.userNo == view.user.userNo }" >
				<button class="btn btn-lg btn-outline-secondary">수정하기</button>
				
				</form>
			
				</div>		
					<form name="delete" method="post" style="display:inline;">
					<input type="hidden" name="reviewNo" value="${view.reviewNo }">
					<button class="deleteBtn btn btn-lg btn-outline-secondary">삭제하기</button>
				</form>		
			</c:when>
			<c:otherwise>
				</form>
			</c:otherwise>
		</c:choose>
		</div>
		
	</div>
	<script src="/lib/slick/slick.min.js" type="text/javascript"></script>
	<script src="/js/review/reviewView.js" type="text/javascript"></script>
</body>
</html>