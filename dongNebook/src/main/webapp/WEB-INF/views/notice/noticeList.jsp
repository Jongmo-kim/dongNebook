<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동서남북 | 공지사항</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />

	<h1 style="font-size:30px;">공지사항 리스트</h1>
	<hr>
	<table border=1>
		<tr>
			<th>공지사항 번호</th><th>제목</th><th>내용</th><th>작성자</th><th>filename</th><th>filepath</th><th>작성일</th>
		</tr>
		<c:forEach items="${list }" var ="n">
			<tr>
				<td>${n.rNum }</td><td>${n.noticeTitle }</td><td>${n.noticeContent }</td><td>${n.noticeWriter }</td><td>${n.filename }</td><td>${n.filepath }</td><td>${n.enrollDate }</td>			
			</tr>
		</c:forEach>
	</table>
	<p style="text-align:center">${pageNavi }</p>

</body>
</html>