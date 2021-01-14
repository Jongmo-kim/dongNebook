<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<style>
</style>
</head>
<body>
<br>
	<div class="adminSideBar">
		<div class="adminSideMenu">
			<div class="adminSideMain">
				<h2>Admin</h2>
			</div>
			<ul>
				<li><a href="/aladin/searchInAladin.do">도서등록</a></li>
				<li><a href="/book/bookList.do?reqPage=1">도서수정</a></li>
				<li><a href="/proposal/proposalList.do?reqPage=1">도서신청목록</a></li>
				<li><a href="/admin/manageUser.do?reqPage=1">회원관리</a></li>
			</ul>
		</div>
	</div>
</body>
</html>