<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
	<style>
		
	
	
	</style>

</head>
<jsp:include page="/views/common/linkHead.jsp"/>
<body>
	<jsp:include page="/views/common/header.jsp" />
	
	<h1 style="font-size:30px;">북마크</h1>
	
	<hr>
	<form action="#" method="get">
	<table border=1>
		<tr>
			<th>선택</th>
			<th>이미지</th>
			<th>책이름</th>
			<th>저자</th>
		</tr>
				<c:forEach items="${bookList }" var ="b">
			<tr>
				<td><input type="checkbox" class="chk"  onClick="count_chk(this);">
				<input type=hidden value="${b.bookNo }">
				</td>
				<td><img alt="${b.bookName }Image" src="${b.imageurl }"></td>
				<td>${b.bookName }</td>
				<td>${b.bookWriter }</td>
			</tr>
		</c:forEach>
	</table>
	<input type="hidden" class="userNo" value="${loginUser.userNo}">
	<input type="button" onclick="rental();" value="대여">
	</form>
	<script>
    var maxChecked=3;
    var totalChecked = 0;
    function count_chk(obj){
    	
    	
    	
    }
    function rental(){
    	var userNo = $(".userNo").val();
		$.ajax({
    		url : "rentalCount.do",
    		type : "post",
    		data : {userNo : userNo},
    		seccess : function(data){
    			alert(data);
    		},
    		error : function(data){
    			alert("실패");
    		}
    			
    	});
	}
    $(function(){
       $("#submit").click(function(){
       var chkArr = new Array();
       var chk = $("input[name=box]:checked");
       $(".chk:checked").each(function() { 
            chkArr.push($(this).next().val());
           
           });
            alert(chkArr);
   		})
    })
    
	</script>
</body>
</html>