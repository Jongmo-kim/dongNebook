<%@page import="com.dongnebook.proposal.model.vo.ProposalVO"%>
<%@page import="com.dongnebook.book.model.vo.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

<style>
#pageNavi {
	text-align: center;
}

.pagination {
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
	width: 100%;
	margin: 0 auto;
	border-top: 3px solid lightgray;
	border-bottom: 3px solid lightgray;
	text-align: center;
}

table>tbody>tr:first-child>th {
	border-bottom: 2px solid lightgray;
	border-right: 1px dashed lightgray;
}
.container{
    max-width: 1900px !important;
}
table>tbody>tr:first-child>th:last-child {
	border-right: none;
}

table>tbody>tr:first-child>th {
	height: 50px;
	border-right: 1px dashed lightgray;
}

table>tbody>tr:first-child>th:first-child {
	width: 50px;
}

table>tbody>tr:first-child>th:nth-child(2) {
	width: 130px;
}

table>tbody>tr:first-child>th:nth-child(3) {
	width: 500px;
}

table>tbody>tr:first-child>th:nth-child(4) {
	width: 100px;
}

table>tbody>tr:first-child>th:nth-child(5) {
	width: 100px;
}

table>tbody>tr:first-child>th:nth-child(6) {
	width: 100px;
}

table>tbody>tr>td {
	font-size: 15px;
	border-top: 1px solid lightgray;
	height: 200px;
	border-right: 1px dashed lightgray;
}

table>tbody>tr>td:last-child {
	border-right: none;
}

table>tbody>tr>td:nth-child(3) {
	text-align: left;
}

table>tbody>tr>td:nth-child(3)>p:first-child {
	font-size: 18px;
	color: #404040;
}

table>tbody>tr>td:nth-child(3)>p:nth-child(2) {
	font-size: 15px;
	color: gray;
}

table>tbody>tr>td:nth-child(3)>p:nth-child(3) {
	font-size: 15px;
	color: gray;
}

.botton {
	text-align: center;
}
	img{
	/* width:95%; */
	height : 95%;
	}
.pbtn {
	width: 100px;
	height: 50px;
	margin-top: 50px;
	border: 2px solid #3b8686;
	background-color: white;
	font-size: 18px;
	color: #404040;
	border-radius: 5px;
	outline: none;
	margin-right: 5px;
	margin-left: 5px;
}

.pbtn:hover {
	background-color: #3b8686;
	color: white;
}

#hideB {
	border: 1px solid #3b8686;
	background-color: #3b8686;
	color: white;
}

#con {
	margin: 0;
}

.bn {
	font-size: 18px;
	font-weight: bold;
	color: #404040;
}

.adminSideMenu li:nth-child(3) a {
	background: #a8dba8;
	color: white;
}
.selectBook{
	width: 130px;
	height : 50px;
	font-size: 18px;
	border : none;
	color : white;
	background-color : lightgray;
	outline : none;
	margin-right : -2px;
}
.selectOn{
	background-color : #3b8686;
}
.reason1{
	display : none;
}
.reason{
	outline: none;
	border : none;
	background-color: white;
	border-radius: 5px;
}
.reason:focus{
	outline : none;
}
</style>
<jsp:include page="/views/common/linkHead.jsp" />
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="contents-frame">
	<div class="contents">
	
	<jsp:include page="/views/common/adminSide.jsp" />
	<div class="admin-contents">
	<div id="main-container" class="main-container nav-effect-1">
		<h1 style="font-size: 30px;">도서신청목록</h1>
		<hr>
		<div class="list-contents">
		<input type="button" class= "selectBook" onclick="selected(0);" value="전체보기">
		<input type="button" class= "selectBook" onclick="selected(1);" value="신청한 책">
		<input type="button" class= "selectBook" onclick="selected(2);" value="승인된 책">
		<input type="button" class= "selectBook" onclick="selected(3);" value="반려된 책">
			<table>
				<tr>
					<th><input type="checkbox" id="allChk"></th>
					<th>이미지</th>
					<th>제목</th>
					<th>카테고리</th>
					<th>출판사</th>
					<th>신청자</th>
				</tr>
				<c:forEach items="${list }" var="b">
					<c:choose>
					
						<c:when test = "${b.isproposal eq null}">
							<tr>
								<td><input type="checkbox" class="chk"></td>
								<td><img alt="${b.bookName }Image" src="${b.imageurl }" >
								<input type="hidden" value="${b.imageurl }">
								</td>
								<td>
									<p>${b.bookName }</p>
									<p>${b.bookWriter }</p>
									<p>${b.ISBN }</p>
									<button class="reason">사유 <i class="fas fa-angle-down"></i></button>
							<div class = "reason1">${b.reason }</div>
								</td>
								<td>${b.bookKind }</td>

								<td>${b.bookPublisher }</td>
								<input type="hidden" value="${b.bookIntroduce }">
								<input type="hidden" value="${b.reason }">
								<td>${b.userName}</td>
							</tr>
						</c:when>
						
						<c:when test="${b.isproposal eq 'y' }">
						<tr>
						<td>승인</td>
						<td><img alt="${b.bookName }Image"
							src="${b.imageurl }"></td>
						<td>
							<p>${b.bookName }</p>
							<p>${b.bookWriter }</p>
							<p>${b.ISBN }</p>
							<button class="reason">사유 <i class="fas fa-angle-down"></i></button>
							<div class = "reason1">${b.reason }</div>
						</td>
						<td>${b.bookKind }</td>

						<td>${b.bookPublisher }</td>
						<input type="hidden" value="${b.bookIntroduce }">
						<input type="hidden" value="${b.reason }">
						<td>${b.userName}
						</td>
					</tr>
						</c:when>
						
						<c:when test="${b.isproposal eq 'n' }">
						<tr>
						<td>반려</td>
						<td><img alt="${b.bookName }Image"
							src="${b.imageurl }"></td>
						<td>
							<p>${b.bookName }</p>
							<p>${b.bookWriter }</p>
							<p>${b.ISBN }</p>
							<button class="reason">사유 <i class="fas fa-angle-down"></i></button>
							<div class = "reason1">${b.reason }</div>
						</td>
						<td>${b.bookKind }</td>

						<td>${b.bookPublisher }</td>
						<input type="hidden" value="${b.bookIntroduce }">
						<input type="hidden" value="${b.reason }">
						<td>${b.userName}
						</td>
					</tr>
						</c:when>
						
					</c:choose>
				
					
				</c:forEach>
			</table>



			<div class="container" id="con">
				<!-----------승인/반려 버튼 ------------->
				<div class="botton">
					<button type="button" class="pbtn success" data-toggle="modal"
						data-target="#myModal">승인</button>
					<button type="button" class="pbtn deleteB" data-toggle="modal"
						data-target="#myModal">반려</button>
				</div>
				<!-- 승인/반려 누르면 나오는 모달 ------------->
				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title"></h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body result"></div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<div class="button">
									<input type="button" id="hideB" class="btn insertBtn hideB sb"
										value="승인"> <input type="button" id="hideB"
										class="btn deleteProposal hideB db" value="반려">
								</div>
								<button type="button" class="btn" id="hideB"
									data-dismiss="modal">취소</button>
							</div>

						</div>
					</div>
				</div>
			</div>
</div>

			<div class="pagination justify-content-center" id="pageNavi">${pageNavi }</div>
</div>


		</div>
</div>
</div>
		<script>
		$(".reason").click(function(){
			$(this).next().slideToggle();
			
		})
		function selected(selectType){
			
			location.href="/proposal/proposalList.do?reqPage=1&selectType="+selectType;
			
			
		};
		
			$(function() {
				var selectType = '${selectType}';
				$(".selectBook").eq(selectType).addClass("selectOn");
		
				
					
				$(".success").click(
						function() {
							var list = new Array();
							$(".sb").show();
							$(".db").hide();

							var str = '';
							$(".chk:checked").each(
									function(idx, item) {
										str += "<span class='bn'>"
												+ $(item).parent().parent()
														.find("td").eq(2).find(
																"p").eq(0)
														.html() + "&nbsp"
												+ "</span>";
										str += $(item).parent().parent().find(
												"td").eq(2).find("p").eq(1)
												.html()
												+ "<br>";

									});
							$(".modal-title").html("승인하시겠습니까?");
							$(".result").html(str);
						});
				$(".deleteB").click(
						function() {
							$(".db").show();
							$(".sb").hide();
							var str = '';
							$(".chk:checked").each(
									function(idx, item) {
										str += "<span class='bn'>"
												+ $(item).parent().parent()
														.find("td").eq(2).find(
																"p").eq(0)
														.html() + "&nbsp"
												+ "</span>";
										str += $(item).parent().parent().find(
												"td").eq(2).find("p").eq(1)
												.html()
												+ "<br>";

									});
							$(".modal-title").html("반려하시겠습니까?");
							$(".result").html(str);
						});
			});

			$(".insertBtn")
					.click(
							function() {
								var inputs = $(".chk:checked");
								var allList = new Array();
								//idx는 순서 내가 체크한 순서
								$(".chk:checked")
										.each(
												function(idx, item) {
													var book = new Object();
													var imageurl = $(item)
															.parent().next()
															.children().next().val();
													var bookName = $(item)
															.parent().parent()
															.find("td").eq(2)
															.find("p").eq(0)
															.html();
													var bookWriter = $(item)
															.parent().parent()
															.find("td").eq(2)
															.find("p").eq(1)
															.html();
													var ISBN = $(item).parent()
															.parent()
															.find("td").eq(2)
															.find("p").eq(2)
															.html();
													var bookKind = $(item)
															.parent().next()
															.next().next()
															.html();
													var bookPublisher = $(item)
															.parent().parent()
															.find("td").eq(4)
															.html();
													var bookIntroduce = $(item)
															.parent().next()
															.next().next()
															.next().next()
															.val();

													book.bookName = bookName;
													book.bookKind = bookKind;
													book.bookPublisher = bookPublisher;
													book.bookIntroduce = bookIntroduce;
													book.imageurl = imageurl;
													book.ISBN = ISBN;
													book.bookWriter = bookWriter;

													allList.push(book);

												})

								$
										.ajax({
											contentType : "application/json; charset=utf-8",
											type : "post",
											url : "/proposal/proposalSuccess.do",
											data : JSON.stringify(allList),
											success : function(result) {
												location.href = "/proposal/proposalList.do?reqPage=1&selectType="+1;
											},
											error : function() {
												alert("승인 실패");
											}
										});

							});
			$(".deleteProposal")
					.click(
							function() {
								var list = new Array();
								$(".chk:checked").each(
										function(idx, item) {
											var book = new Object();
											var ISBN = $(item).parent()
													.parent().find("td").eq(2)
													.find("p").eq(2).html();

											book.ISBN = ISBN;
											list.push(book);
										});
								$.ajax({
											contentType : "application/json; charset=utf-8",
											type : "post",
											url : "/proposal/proposalDelete.do",
											data : JSON.stringify(list),
											success : function(result) {
												location.href = "/proposal/proposalList.do?reqPage=1&selectType="+1;
											},
											error : function() {
												alert("반려 실패");
											}
										});
							});
			$(document).ready(function() {

				$(".chk").click(function() {
					var chk = $(".chk").length;
					var chkCount = $(".chk:checked").length;
					if (chk == chkCount) {
						$("#allChk").prop("checked", true);
					} else {
						$("#allChk").prop("checked", false);
					}
				});
				$("#allChk").click(function() {
					//만약 전체 선택 체크박스가 체크된상태일경우
					if ($("#allChk").prop("checked")) {
						$("input[type=checkbox]").prop("checked", true);
						//input type이 체크박스인것은 모두 체크함
					} else {
						$("input[type=checkbox]").prop("checked", false);
						//input type이 체크박스인것은 모두 체크 해제함
					}
					;
				});
			});
		</script>
</body>
</html>