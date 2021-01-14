<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 검색</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link rel="stylesheet" href="/css/book/searchBook.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript" src="/js/book/searchBook.js?v=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<h2>도서검색</h2>
	<div class="searchBox">
		<div class="searchFrm">
			<form action="/book/searchBook.do" name="searchBook" method="get" >
				<select name="searchKeyword">
					<option value="전체">전체</option>
					<option value="책이름">책이름</option>
					<option value="저자">저자</option>
					<option value="출판사">출판사</option>
				</select>
				<select name="reqPage">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
				</select>
				<div class="inputField">
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
		<table>
			<tr>
				<th>책 번호</th>
				<c:if test="${loginUser!=null }">
					<th>북마크</th>
				</c:if>
				<th>책 이름</th>
				<th>책 종류</th>
				<th>저자</th>
				<th>출판사</th>
				<th>소개글</th>
				<th>이미지</th>
			</tr>
			<c:forEach var="b" items="${bookList }">
			<tr>
				<td>${b.bookNo }</td>
				
				<!-- 여기는 북마크 전용 구간입니다. -->
				<c:if test="${loginUser!=null }">
					<c:set var="chk" value="false"/>
					<c:forEach var="m" items="${bookMarkList }">
						<c:if test="${b.ISBN13 eq m }">
							<c:set var="chk" value="true"/>
						</c:if>
					</c:forEach>
					<c:if test= "${chk == false}">
						<td><label for="bookmark-chk${b.bookNo }" id="label-chk${b.bookNo }"><img src="/image/bookmark/bookmark-false.png"></label><input type="checkbox" id="bookmark-chk${b.bookNo }" style="display:none" onclick="bookmarkChkBox(checked,'label-chk${b.bookNo }','${b.ISBN13 }')"></td>
					</c:if>
					<c:if test= "${chk == true}">
						<td><label for="bookmark-chk${b.bookNo }" id="label-chk${b.bookNo }"><img src="/image/bookmark/bookmark-true.png"></label><input type="checkbox" id="bookmark-chk${b.bookNo }" style="display:none" checked=true onclick="bookmarkChkBox(checked,'label-chk${b.bookNo }','${b.ISBN13 }')"></td>
					</c:if>
					<!-- 
					<td><label for="bookmark-chk${b.bookNo }"><img id="bookmark-false${b.bookNo }" src="/image/bookmark/bookmark-false.png"></label><input type="checkbox" id="bookmark-chk${b.bookNo }" onclick="bookmarkChkBox(checked,${b.bookNo })"><label for="bookmark-chk${b.bookNo }"><img id="bookmark-true${b.bookNo }" src="/image/bookmark/bookmark-true.png"></label></td>
					 -->
				 </c:if>
				 <!-- 여기는 북마크 전용 구간입니다. -->
				<td><a href="/book/selectOneBook.do?bookNo=${b.bookNo}">${b.bookName }</a></td>
				<td>${b.bookKind }</td>
				<td>${b.bookWriter }</td>
				<td>${b.bookPublisher }</td>
				<td>${b.bookIntroduce }</td>
				<td><img alt="${b.bookName }Image" src="${b.imageurl }"></td>
			</tr>			
			</c:forEach>
		</table>
	<script>
		
		
	</script>
</body>
</html>