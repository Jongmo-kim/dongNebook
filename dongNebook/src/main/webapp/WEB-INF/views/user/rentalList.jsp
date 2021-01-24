<!-- @author 진수경 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출 목록</title>
<style>
.pagination {
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 50px;
}

.pagination>li>a {
	color: #79bd9a;
	border: none;
}

.pagination>li>.selectPage {
	color: black;
	border: none;
}

.pagination>li>a:hover {
	color: #79bd9a;
}

table {
	border-top: 3px solid lightgray;
	border-bottom: 3px solid lightgray;
	width: 1100px;
	margin-top: 30px;
	margin:0 auto;
}

table>tbody>tr>td:first-child {
	width: 20px;
	text-align:center;
}

table>tbody>tr>td:nth-child(2) {
	width: 100px;
	text-align:left;
}

table>tbody>tr>td:nth-child(3) {
	width: 500px;
}

table>tbody>tr>td {
	font-size: 15px;
	border-top: 1px solid lightgray;
	height: 150px;
}

table>tbody>tr>td>p:nth-child(2) {
	color:gray;
	font-weight:500;
}
table>tbody>tr>td>p:last-child {
	font-size:15px;
	font-weight:500;
	text-align:right;
}
.con {
	margin: 0 auto;
	width: 1100px;
	margin-top: 30px;
}

.con>h1 {
	color: #404040;
	font-size: 33px;
}

.no-list-div{
	text-align:right;
}
.no-list-text {
	text-align: center;
	margin-top: 100px;
	margin-bottom:100px;
	font-size:1.3em;
}

.img-td{
	padding-top:50px;
	padding-bottom:50px;
	padding-left:120px;
	padding-right:120px;
}
.img-td>a>img{
	width:100%;
}
.prev{
text-align:right;}
.bookName{
	text-decoration: none;
	color:black;
	font-weight: bold;
	font-size:18px;
}
.bookName:hover{
color:black;
}
</style>
<jsp:include page="/views/common/linkHead.jsp" />
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="contents-frame">

		<div class="contents">
			<jsp:include page="/views/common/userSide.jsp" />
			<div class="admin-contents">
				<div id="main-container" class="main-container nav-effect-1">
					<h1 style="font-size: 30px;">대출 목록</h1>
					<hr>
					<c:choose>
						<c:when test="${not empty list}">
							<table>
								<c:forEach items="${list }" var="r">
									<tr>
										<td class="img-td" style="width:40%;">
											<a href="/book/selectOneBook.do?bookNo=${r.bookNo }">
												<img alt="${r.bookName }Image" src="${r.imageurl }">
											</a>
										</td>
										<td><p>
												<a class="bookName" href="/book/selectOneBook.do?bookNo=${r.bookNo }">${r.bookName }</a>
											</p>
											<p>${r.bookWriter }</p><br>
											<p><b>대출장소</b> : ${r.placeName }</p>
											<p><b>대출일</b> : ${r.enrollDate }</p>
											<p><b>반납일</b> : ${r.returnDate }</p>
											<br><br>
											<c:choose>
												<c:when test="${r.isReturn.equals('Y') }">
													<p>반납</p>
												</c:when>
												<c:otherwise>
													<p style="color:red;">미반납</p>
												</c:otherwise>
											</c:choose></td>
									</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
							<div class="no-list-div">
								<p class="no-list-text">대출한 책이 없습니다.</p>
								<button class="btn btn-lg btn-primary prev" onclick="prev();">이전으로</button>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="pagination justify-content-center" id="pageNavi">${pageNavi }</div>
			</div>
		</div>
	</div>
	<script>
		function prev(){
			location.href="/user/mypageFrm.do";
		}
	</script>
</body>
</html>