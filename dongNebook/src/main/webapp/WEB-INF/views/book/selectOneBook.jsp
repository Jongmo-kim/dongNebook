<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세정보</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link rel="stylesheet" href="/css/book/selectOneBook.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="contents-frame">
		<div class="contents">
			<jsp:include page="/views/common/userSide.jsp" />
			<div class="admin-contents">
				<div id="main-container" class="main-container nav-effect-1">
					<h1 style="font-size:30px;">도서등록</h1>
					<hr>
					<div class="content">
						<div class="content-top">
							<div class="BookInfo">
								<div id="selectBookImg">
									<img alt="${b.bookName }Image" src="${b.imageurl}" width="100%" height="100%">
								</div>
								<div id="bookTable">
									<table border="0" width="700" style="table-layout:fixed;">
										<tr id="title">
											<th>제목</th><td>${b.bookName}</td>
										</tr>
										<tr id="title">
											<th>저자</th><td>${b.bookWriter}</td>
										</tr>
										<tr id="title">
											<th>카테고리</th><td>${b.bookKind}</td>
										</tr>
										<tr id="title">
											<th>출판사</th><td>${b.bookPublisher}</td>
										</tr>
										<tr id="title">
											<th>표준부호</th><td>${b.ISBN}</td>
										</tr>
										<tr id="introduce">
											<th style="padding-bottom: 50px;">책소개</th><td style="word-break:break-all;">${b.bookIntroduce}</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="content-middle">
							<ul class="status">
								<li><strong>표준부호(ISBN)</strong></li>
								<li><strong>반납 예정일</strong></li>
								<li><strong>대출상태</strong></li>
								<li>${b.ISBN}</li>
								<c:if test="${b.bookCount!=0}"> 
								<li></li>
								<li style="line-height: normal; color: blue;">대출 가능</li>
								</c:if>
								<c:if test="${b.bookCount==0 && returnDate!=null}"> 
								<li>${returnDate}</li>
								<li style="line-height: normal;">대출불가상태(다른 사용자 대출중 ${returnDate} 반납예정)</li>
								</c:if>
								<c:if test="${b.bookCount==0 && (b.rCount==0 || returnDate==null)}">
								<li>${returnDate}</li>
								<li style="line-height: normal;">대출불가상태(재고 없음)</li>
								</c:if>
							</ul>
						</div>
						<div class="content-bottom">
							<c:if test="${loginUser!=null }">
								<c:if test="${b.bookCount!=0}"> 
									<a href="/bookRental.do?bookNo=${b.bookNo}">대출신청</a><a href="javascript:history.back();">이전으로</a>
								</c:if>
								<c:if test="${b.bookCount==0 && returnDate!=null}"> 
									<a href="/insertReserve.do?bookNo=${b.bookNo}">예약신청</a><a href="javascript:history.back();">이전으로</a>
								</c:if>
								<c:if test="${b.bookCount==0 && returnDate==null}"> 
									<a href="/proposal/bookProposal.do">도서신청</a><a href="javascript:history.back();">이전으로</a>
								</c:if>
			 				</c:if>
			 				<c:if test="${loginUser==null }">
								<a id="notLogin" href="/user/loginFrm.do">대출신청</a><a href="javascript:history.back();">이전으로</a>
							</c:if>
						</div>
					</div>
				</div>
			 </div>
		 </div>
	 </div>
</body>
<script>
	$('#notLogin').click(function () {
		alert('로그인 후 이용가능합니다');
	});
</script>
</html>