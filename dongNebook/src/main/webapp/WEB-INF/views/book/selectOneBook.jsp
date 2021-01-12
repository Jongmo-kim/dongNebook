<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세정보</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	
	<h1 style="font-size:30px;">책 상세정보</h1>
	<hr>
	<table border=1>
		<tr>
			<th>책이름</th><th>카테고리</th><th>저자</th><th>출판사</th><th>소개</th><th>대출</th><th>이미지</th>
		</tr>
		<tr>
			<td>${b.bookName }</td><td>${b.bookKind }</td><td>${b.bookWriter }</td><td>${b.bookPublisher}</td><td>${b.bookIntroduce }</td><td><a href="/book/bookRental.do?bookNo=${b.bookNo}">대출신청</a></td><td>${b.imageurl}</td>	
		</tr>
	</table>
</body>
</html>