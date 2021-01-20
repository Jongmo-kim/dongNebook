<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link rel="stylesheet" href="/lib/choices/choices.min.css" type="text/css">
<script src="/lib/choices/choices.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="/css/book/searchBook.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript" src="/js/book/searchBook.js?v=<%=System.currentTimeMillis()%>"></script>

</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<h2>저시기검색</h2>
	<hr>
	<div class="content">
	<div class="searchBox">
		<div class="searchFrm">
			<form action="/user/searchFrm.do" name="searchBook" method="get" >
				<input type="hidden" name="reqPage" value="1">
				<div class="inputField">
					<div class="searchFieldFrm">
						<select name="searchKeyword" class="default">
							<option value="전체" placeholder="">전체</option>
							<option value="이름">이름</option>
							<option value="아이디">아이디</option>
						</select>
					</div>
					<input type="text" id="searchFrm" name="inputStr" autocomplete="off">
					<div class="icon-wrap">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
							<path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
						</svg>
					</div>
				</div>
				
			</form>
		</div>
	</div>
	<c:choose>
	<c:when test="${userList == null }">
		<!-- 첫 페이지 -->
	</c:when>
	<c:when test="${userList!=null && userList.size() > 0  }">
		<table class="bookListTable" border=1>
			<tr class="table-header">
				<th>유저 번호</th>
				<th>이름</th>
				<th>아이디</th>
			</tr>
			<c:forEach var="u" items="${userList }">
			<tr>
				<td>${u.userNo }</td>
				<td>${u.userName }</td>
				<td>${u.userId }</td>
			</tr>			
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
	<div class="notice" style="text-align:center;">
		<h2>검색 결과가 없습니다.</h2>
	</div>
	</c:otherwise>
	</c:choose>
	</div>
	

</body>
</html>