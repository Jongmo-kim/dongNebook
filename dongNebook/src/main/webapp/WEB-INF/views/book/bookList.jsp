<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>책 리스트</h1>
	<hr>
	<table border=1>
		<tr>
			<th>책이름</th><th>카테고리</th><th>저자</th><th>출판사</th><th>소개</th><th>수정</th><th>삭제</th>
		</tr>
		<c:forEach items="${list }" var ="b">
			<tr>
				<td>${b.bookName }</td><td>${b.bookKind }</td><td>${b.bookWriter }</td><td>${b.bookPublisher}</td><td>${b.bookIntroduce }</td><td>수정</td><td><a href="/book/bookDelete.do?bookNo=${b.bookNo}">삭제</td>			
			</tr>
		</c:forEach>
	</table>

			<p style="text-align:center">${pageNavi }</p>

</body>
</html>