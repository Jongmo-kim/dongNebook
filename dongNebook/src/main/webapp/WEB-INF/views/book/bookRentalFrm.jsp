<%@page import="com.dongnebook.book.model.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	Calendar cal = Calendar.getInstance();
	
	Date date = new Date();
	cal.setTime(date);
	cal.add(Calendar.DATE, +3);
	   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 대출</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link rel="stylesheet" href="/css/rental/bookRentalFrm.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<jsp:include page="/views/common/userSide.jsp" />
	<div class="wrap"> 
		<div class="content-wrap">
			<h1 style="font-size:30px;">책 대출</h1>
			<hr>
			<div class="content">
				<form action="/insertBookRental.do" method="POST">
					<div class="content-top">
						<table style="table-layout:fixed;" bordercolor="#feebe1" cellpadding="5" border="1" cellspacing="0" align="center" style="border-collapse:collapse; border:1px lightgray solid;">
							<tr>
								<th>도서번호</th>
								<th>이미지</th>
								<th>제목</th>
								<th>저자</th>
								<th style="width: 40px;">수량</th>
								<th>대출일자</th>
								<th>반납일자</th>
							</tr>
							<c:forEach items="${rentalList }" var ="b">
							<tr>
								<td>${b.bookNo}</td>
								<td style="width: 100px; height: 150px;"><img src="${b.imageurl }" width="100%" height="100%"></td>
								<td>${b.bookName}</td>
								<td>${b.bookWriter}</td>
								<td>1</td>
								<td><%= sf.format(nowTime) %></td>
								<td><%= sf.format(cal.getTime())%></td>
							</tr>
							</c:forEach>
						</table>
						<h3 style="display: inline-block;">상호대차 지정</h3>
						<div class="content-middle">
							<input type="text" name="placeName" value="${rentalLoc.placeName }" readonly><input type="button" class="goRentalLoc" value="검색">
							<input type="hidden" name="addr" value="${rentalLoc.addr }">
							<input type="hidden" name="phone" value="${rentalLoc.phone }">
						</div>
					</div>
					<div class="content-bottom">
						<input type="submit" value="대출하기"><a href="#">이전으로</a>
					</div>
				</form>
				<form action="/rentalLoc.do"  method="post">
					<input type="submit" id="goRentalLoc" value="검색" style="display:none">
				</form>
			</div>
		</div>
	</div>
	<!--<form action="/insertBookRental.do" method="post">
		<table border=1>
			<tr>
				<th>책 번호</th><th>이미지</th><th>책이름</th><th>저자</th><th>수량</th><th>대출일자</th><th>반납일자</th>
			</tr>
			<c:forEach items="${rentalList }" var ="b"> 
			<tr>
				<td><input type="text" name="bookNo" value="${b.bookNo}" readonly></td><td><img src=${b.imageurl}></td><td>${b.bookName }</td><td>${b.bookWriter }</td><td>${b.bookCount}</td><td><%= sf.format(nowTime) %>시</td><td><%= sf.format(cal.getTime())%></td>	
			</tr>
			</c:forEach>
			
				<tr>
					<td colspan="6">상호대차 장소 검색</td>
					<td>
						<input type="button" class="goRentalLoc" value="검색">
					</td>
				</tr>
				<tr>
					<input type="text" name="placeName" value="${rentalLoc.placeName }">
					<input type="hidden" name="addr" value="${rentalLoc.addr }">
					<input type="hidden" name="phone" value="${rentalLoc.phone }">
				</tr>
			<tr>
				<td colspan="7"><input type="submit" value="대출하기"><input type="reset" value="취소하기"></td> 
			</tr>
		</table>
	</form>
	
	<form action="/rentalLoc.do"  method="post">
		<input type="submit" id="goRentalLoc" value="검색" style="display:none">
	</form>-->
</body>
<script>
$('.goRentalLoc').on('click', function() {
	  $('#goRentalLoc').trigger('click');
	});
</script>
</html>