<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 대출</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	
	<h1 style="font-size:30px;">책 대출</h1>
	${loginUser!=null }
	<hr>
	<table border=1>
		<tr>
			<th>책 번호</th><th>이미지</th><th>책이름</th><th>저자</th><th>수량</th><th>대출일자</th><th>반납일자</th>
		</tr>
		<tr>
			<td>{b.bookNo}</td><td>${b.imageurl}</td><td>${b.bookName }</td><td>${b.bookWriter }</td><td>${b.bookCount}</td><td>오늘날짜(yyyy-mm-dd)</td><td>반납날짜(yyyy-mm-dd)</td>	
		</tr>
		<tr>
			<td><input type="submit" value="대출하기"><input type="reset" value="취소하기"></td> 
		</tr>
	</table>
</body>
</html>