<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 메인 페이지</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link rel="stylesheet" href="/lib/choices/choices.min.css" type="text/css">
<script src="/lib/choices/choices.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="/css/book/searchBook.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript" src="/js/book/searchBook.js?v=<%=System.currentTimeMillis()%>"></script>

</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="content">
	<h2>리뷰페이지</h2>
	<hr>
	<c:if test="${sessionScope.loginUser != null }" >
	<div style="text-align:right; font-size:25px;">
	<a  href="/review/writeFrm.do">글쓰기</a>
	</div>
	</c:if>
	<c:choose>
		<c:when test="${reviewList == null }">
			<!-- 첫 페이지 -->
			<div class="notice" style="text-align:center;">
				<h2>게시글이 없습니다.</h2>
			</div>
		</c:when>
		<c:when test="${reviewList!=null && reviewList.size() > 0  }">
			<table class="bookListTable" border=1>
				<tr class="table-header">
					<th>게시글번호</th>
					<th>글쓴이</th>
					<th>제목</th>
				</tr>
			<c:forEach var="b" items="${reviewList }">
				<tr>
					<td>${b.reviewNo }</td>
					<td>${b.user.userName }</td>
					<td><a href="/review/view.do?reviewNo=${b.reviewNo }">${b.title }</a></td>
				</tr>
			</c:forEach>
			</table>
			<div class="navi">
				<ul class="pagination justify-content-center" id="pageNavi">
					${navi }
				</ul>
			</div>
		</c:when>
		<c:otherwise>
			<div class="notice" style="text-align:center;">
				<h2>게시글이 없습니다.</h2>
			</div>
		</c:otherwise>
		</c:choose>
	</div>
</body>
</html>