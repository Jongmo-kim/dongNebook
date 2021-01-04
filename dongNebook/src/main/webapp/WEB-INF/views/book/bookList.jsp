<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
		<jsp:include page="/views/common/header.jsp" />
	
	<h1 style="font-size:30px;">책 리스트</h1>
	<hr>
	<table border=1>
		<tr>
			<th>책이름</th><th>카테고리</th><th>저자</th><th>출판사</th><th>소개</th><th>수정</th><th>삭제</th>
		</tr>
		<c:forEach items="${list }" var ="b">
			<tr>
				<td>${b.bookName }</td><td>${b.bookKind }</td><td>${b.bookWriter }</td><td>${b.bookPublisher}</td><td>${b.bookIntroduce }</td><td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="updateInform(${b.bookNo },'${b.bookName}','${b.bookKind}','${b.bookWriter}','${b.bookPublisher}','${b.bookIntroduce}')">
    수정
 				</button></td><td><a href="/book/bookDelete.do?bookNo=${b.bookNo}">삭제</td>			
			</tr>
			
			<!-- The Modal -->
			<div class="modal" id="myModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">Modal Heading</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <form action="/book/updateBook.do">
				      <div class="modal-body">
				      	<input type ="text" name="bookNo" id="bookNo">
				      	<input type ="text" name="bookName" id="bookName">
				      	<input type ="text" name="bookKind" id="bookKind">
				      	<input type ="text" name="bookWriter" id="bookWriter">
				      	<input type ="text" name="bookPublisher" id="bookPublisher">
				      	<input type ="text" name="bookIntroduce" id="bookIntroduce">
				      </div>
			      <!-- Modal footer -->
			      <div class="modal-footer">
			      	<button type="submit" class="btn btn-primary">Submit</button>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>
				</form>
			
			    </div>
			  </div>
			</div>
		</c:forEach>
	</table>

	<p style="text-align:center">${pageNavi }</p>

	<script>
		function updateInform(bookNo,bookName,bookKind,bookWriter,bookPublisher,bookIntroduce){
			console.log(bookPublisher);
			document.getElementById("bookNo").value=bookNo;
			document.getElementById("bookName").value=bookName;
			document.getElementById("bookKind").value=bookKind;
			document.getElementById("bookWriter").value=bookWriter;
			document.getElementById("bookPublisher").value=bookPublisher;
			document.getElementById("bookIntroduce").value=bookIntroduce;
		}
	</script>
</body>
</html>