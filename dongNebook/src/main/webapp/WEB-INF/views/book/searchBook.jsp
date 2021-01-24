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
	<div class="contents-frame">
		<div class="contents">
				<jsp:include page="/views/common/userSide.jsp" />
			<div class="admin-contents">
				<div id="main-container" class="main-container nav-effect-1">
	<h2>도서검색</h2>
	<hr>
	<div class="searchBox">
		<div class="searchFrm">
			<form action="/book/searchBook.do" name="searchBook" method="get" >
				<input type="hidden" name="reqPage" value="1">
				<div class="inputField">
					<div class="searchFieldFrm">
						<select name="searchKeyword" class="default">
							<option value="전체" placeholder="">전체</option>
							<option value="책이름">책이름</option>
							<option value="저자">저자</option>
							<option value="출판사">출판사</option>
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
		<div class="guessedBox">
			
		</div>
	</div>
	<div class="searchResult">
	<c:choose>
	<c:when test="${bookList == null }">
		<!-- 첫 페이지 -->
	</c:when>
	<c:when test="${bookList!=null && bookList.size() > 0  }">
		<table class="bookListTable" border=1>
			<tr class="table-header">
				<th>이미지</th>
				<c:if test="${loginUser!=null }">
					<th>북마크</th>
				</c:if>
				<th>책 이름</th>
				<th>소개글</th>
				<th>책 종류</th>
				<th>저자</th>
				<th>출판사</th>
			</tr>
			<c:forEach var="b" items="${bookList }">
			<tr>
				<td><a href="/book/selectOneBook.do?bookNo=${b.bookNo}"><img alt="${fn:length(b.bookIntroduce)<8 ? b.bookName : fn:substring(b.bookName,0,7)  }Image" src="${b.imageurl }"></a></td>
				
				<!-- 여기는 북마크 전용 구간입니다. -->
				<c:if test="${loginUser!=null }">
					<c:set var="chk" value="false"/>
					<c:forEach var="m" items="${bookMarkList }">
						<c:if test="${b.ISBN eq m }">
							<c:set var="chk" value="true"/>
						</c:if>
					</c:forEach>
					<c:if test= "${chk == false}">
						<td><label for="bookmark-chk${b.bookNo }" id="label-chk${b.bookNo }"><img src="/image/bookmark/bookmark-false.png"></label><input type="checkbox" id="bookmark-chk${b.bookNo }" style="display:none" onclick="bookmarkChkBox(checked,'label-chk${b.bookNo }','${b.ISBN }')"></td>
					</c:if>
					<c:if test= "${chk == true}">
						<td><label for="bookmark-chk${b.bookNo }" id="label-chk${b.bookNo }"><img src="/image/bookmark/bookmark-true.png"></label><input type="checkbox" id="bookmark-chk${b.bookNo }" style="display:none" checked=true onclick="bookmarkChkBox(checked,'label-chk${b.bookNo }','${b.ISBN }')"></td>
					</c:if>
					<!-- 
					<td><label for="bookmark-chk${b.bookNo }"><img id="bookmark-false${b.bookNo }" src="/image/bookmark/bookmark-false.png"></label><input type="checkbox" id="bookmark-chk${b.bookNo }" onclick="bookmarkChkBox(checked,${b.bookNo })"><label for="bookmark-chk${b.bookNo }"><img id="bookmark-true${b.bookNo }" src="/image/bookmark/bookmark-true.png"></label></td>
					 -->
				 </c:if>
				 <!-- 여기는 북마크 전용 구간입니다. -->
				<td><a href="/book/selectOneBook.do?bookNo=${b.bookNo}">${fn:length(b.bookName) < 25 ? b.bookName : fn:substring(b.bookName,0,12).concat("...") }</a></td>
				<td>${fn:length(b.bookIntroduce)==0 ? "소개글이 없습니다."  : fn:length(b.bookIntroduce) <25 ?b.bookIntroduce : fn:substring(b.bookIntroduce,0,50).concat("...")}</td>
				<c:set var="kindArr" value="${fn:split(b.bookKind, '>') }" />
				<td>${kindArr[1]}</td>
				<td>${b.bookWriter }</td>
				<td>${b.bookPublisher }</td>
			</tr>			
			</c:forEach>
		</table>
		
	</div>
	</c:when>
	<c:otherwise>
	<div class="notice" style="text-align:center;">
		<h2>검색 결과가 없습니다.</h2>
	</div>
	</c:otherwise>
	</c:choose>
		<div class="navi">
			<ul class="pagination justify-content-center" id="pageNavi">
				${navi}
			</ul>
		</div>
	</div>
	</div>
</div>
</body>
</html>