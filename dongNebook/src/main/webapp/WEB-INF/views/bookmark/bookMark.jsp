<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
	<style>
		table{
		margin : 0 auto;
		margin-top : 50px;
		border-top : 3px solid lightgray; 
        border-bottom : 3px solid lightgray; 
		text-align : center;
		}
        table>tbody>tr>td{
            border-bottom: 1px solid lightgray;
        }
        table>tbody>tr:last-child>td{
            border-bottom: none;
        }
		table>tbody>tr>td:first-child{
			width:50px;
		}
	table>tbody>tr>td:nth-child(2){
            height: 150px;
			width:150px;
		}
		table>tbody>tr>td:nth-child(3){
		text-align:left;
			width:700px;
		}
        table>tbody>tr>td:nth-child(3)>p>a{
			font-size: 18px;
			color:#333333;
			font-weight:bold;
		}
	table>tbody>tr>td:nth-child(3)>p:last-child{
			font-size: 15px;
			color : gray;
		}
		.button{
         	text-align:center;
         }
         .rBtn{
         	margin-top:50px;
         	margin-bottom : 50px;
         	margin-right : 15px;
         	width : 110px;
         	height: 50px;
         	border: 2px solid #3b8686;
         	background-color:white;
         	color : #404040;
         	font-size : 18px;
         	border-radius: 5px;
         }
         .rBtn:hover{
         background-color: #3b8686;
         color : white;
         }
         .noBook{
         	margin-top : 100px;
         	text-align : center;
         }
         .bookmark-table{
         	width:100%;
         }
         .SideMenu li:nth-child(4) a{
background:#a8dba8;
	color:white;
}
	</style>

</head>
<jsp:include page="/views/common/linkHead.jsp"/>
<body>
  <jsp:include page="/views/common/header.jsp" />
	<div class="contents-frame">
		<div class="contents">
				<jsp:include page="/views/common/userSide.jsp" />
			<div class="admin-contents">
				<div id="main-container" class="main-container nav-effect-1">
	<h1 style="font-size:30px;">희망도서</h1>
         <hr>
	<%-- <c:choose>
	<c:when test="${loginUser!=null }"> --%>
	<table class="bookmark-table">
				<c:if test="${fn:length(bookList) == 0 }">
				<div class = "noBook"><h2>북마크한 책이 없습니다</h2></div>
					
				</c:if>
	
				<c:forEach items="${bookList }" var ="b">
				
			<tr>
				<td><input type="checkbox" name="${b.bookNo }" class="chk" >
				<input type=hidden class="bookNo" value="${b.bookNo }">
				<input type="hidden" class="isbn" value="${b.ISBN }">
				</td>
				<td><a href="/book/selectOneBook.do?bookNo=${b.bookNo }"><img alt="${b.bookName }Image" src="${b.imageurl }"></a></td>
				<td><p><a href = "/book/selectOneBook.do?bookNo=${b.bookNo }">${b.bookName }</a></p>
					<p>${b.bookWriter }</p>
				</td>
				
			</tr>
		</c:forEach>
	</table>
	<c:if test="${fn:length(bookList) > 0 }">
	<input type="hidden" class="userNo" value="${loginUser.userNo}">
	<div class="button">
	<input type="button" class = "rBtn" onclick="rental();" value="대여하기">
	<input type="button" class="rBtn bmDelete" value="북마크 삭제">
	</c:if>
	</div>
	</div>
	</div>
	</div>
	<%-- </c:when>
	<c:otherwise>
		<div class = "noBook"><h2>로그인이 필요한 서비스입니다.</h2></div>
	</c:otherwise>
	</c:choose> --%>
	<script>
    var maxChecked=3;
    var totalChecked = 0;
    
	$(function() {
        $(".bmDelete").click(function(){
             $(".chk:checked").each(function(idx,item){
        	var isbn = $(item).next().next().val();
                  
    	
          $.ajax({
   			url : "/book/deleteBookmark.do",
   			type: "post",
   			data : {isbn:isbn},
   			success : function(data){
   				location.href="/book/bookMarkList.do?reqPage=1";
   			}
   		});
        });
        });
     });
    
    function rental(){
    	var chkCount = $(".chk:checked").length;
    	var userNo = $(".userNo").val();
		$.ajax({
    		url : "/book/rentalCount.do",
    		type : "post",
    		data : {userNo : userNo},
    		success : function(data){
				if(data == "0"){
					if(chkCount == 0){
						alert("책 선택");
					}else if(chkCount > 3){
						alert("최대 3권 대여 가능");
					}else{
						rent();
					}
				}else if(data == "1"){
					if(chkCount > 2){
						alert("최대 2권 대여 가능");
					}else if(chkCount == 0){
						alert("책 선택");
					}else{
						rent();
					}
				}else if(data == "2"){
					if(chkCount > 1){
						alert("최대 1권 대여 가능");
					}else if(chkCount == 0){
						alert("책 선택");
					}else{
						rent();
					}
				}else if(data == "3"){
					alert("이미 3권 대여 중");
				}
    		},
    		error : function(data){
    			alert("실패");
    		}	
    	});
	}
    
    function rent(){
        var arr = new Array();
       $(".chk:checked").each(function(idx,item){
           var bookNo = $(item).next().val();
           arr.push(bookNo);
           location.href="/bookRental.do?bookNo="+arr;
       });
       /*
       
       $.ajax({
            type : "get",
            url : "/bookRental.do",
            traditional:true,
            data : {bookNo:arr},
            success : function(result) {
               location.href="/bookRental.do?bookNo="+arr;
            },
            error : function() {
            	console.log("ajax오류");
            }
         });
       */
     };
     var sessionEmail='';
     $(document).ready(function(){
    	 sessionCheck();
     });
     
	function sessionCheck(){
		$.ajax({
			type:'POST',
			datatype:'json',
			url:"/main/memberSessionCheck.do",
			async:false,
			success:function(result){
				sessionEmail=result;
			}
		});
		if(sessionEmail ==''){
			var reLogin = confirm('로그인이 필요한 서비스 입니다. 확인 시 로그인 창으로 이동됩니다.');
			if(reLogin){
				location.href='/user/loginFrm.do';
				return;
			}else{
				location.href='/';
				return;
			}
		}else{
			return;
		}
	}
	</script>
</body>
</html>