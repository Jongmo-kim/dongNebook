<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
		<div class="SideBar">
			<div class="blank"></div>
			<div class="SideMenu">
				<div class="SideMain">
					<h2>메뉴</h2>
				</div>
				<ul>
					<li><a href="/book/searchBookFrm.do">도서검색</a></li>
					<li><a href="/proposal/bookProposal.do">도서신청</a></li>
					<li><a href="/rank/rankList.do?reqPage=1">대출순위</a></li>
					<li><a href="/book/bookMarkList.do">북마크</a></li>
					<li><a href="/notice/noticeList.do?reqPage=1">공지사항</a></li>
					<li><a href="/calendar/calendarView.do">일정</a></li>
				</ul>
			</div>
		</div>
</body>
</html>