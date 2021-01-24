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
				<h2>관리자</h2>
			</div>
			<ul>
				<li><a href="/aladin/searchInAladin.do">도서등록</a></li>
				<li><a href="/book/bookList.do?reqPage=1">도서수정</a></li>
				<li><a href="/proposal/proposalList.do?reqPage=1&selectType=0">도서신청목록</a></li>
				<li><a href="/admin/manageUser.do?reqPage=1">회원관리</a></li>
				<li><a href="/chat/oneByOneChat.do?reqPage=1">1:1상담</a></li>
				<li><a href="/notice/noticeList.do?reqPage=1">공지사항 목록</a></li>
				<li><a href="/notice/noticeFrm.do">공지사항 작성</a></li>
				<li><a href="/calendar/calendarView.do">일정 관리</a></li>
			</ul>
		</div>
	</div>
</body>
</html>