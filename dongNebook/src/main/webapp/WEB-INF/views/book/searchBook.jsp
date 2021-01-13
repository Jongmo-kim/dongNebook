<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 검색</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link rel="stylesheet" href="/css/book/searchBook.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript" src="/js/book/searchBook.js?v=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />

	<div class="searchBox">
		<div class="searchFrm">
			<form action="/book/searchBook.do" method="get" >
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
				<input type="text" id="searchFrm" name="inputStr">
				<button>검색하기</button>
			</form>
		</div>
		<div class="guessedBox">
			
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
	</div>
	<script>
		
		
	</script>
</body>
</html>