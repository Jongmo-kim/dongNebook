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
	<jsp:include page="/views/common/header.jsp" />
	
	<h1 style="font-size:30px;">북마크</h1>
	
	<hr>
	<table border=1>
		<tr>
			<th>선택</th>
			<th>이미지</th>
			<th>책이름</th>
			<th>저자</th>
		</tr>
				<c:forEach items="${bookList }" var ="b">
			<tr>
				<td><input type="checkbox" class="chk"></td>
				<td><img alt="${b.bookName }Image" src="${b.imageurl }"></td>
				<td>${b.bookName }</td>
				<td>${b.bookWriter }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>