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
<style>

*, *:after, *:before {
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}


.user-list-wrapper {
  position: relative;
  margin: 0 auto;
  width: 600px;
  height: 298px;
  height: 328px;
}
.user-list-wrapper:before {
  content: "";
  display: block;
  position: absolute;
  top: 2px;
  left: 0;
  width: 100%;
  height: 2px;
  background: rgba(0, 0, 0, 0.03);
  border-left: 2px solid #ededed;
  border-right: 2px solid #ededed;
}
.user-list-wrapper:after {
  content: "";
  display: block;
  position: absolute;
  z-index: 4;
  bottom: 2px;
  left: 0;
  width: 100%;
  height: 2px;
  background: rgba(0, 0, 0, 0.03);
  border-left: 2px solid #ededed;
  border-right: 2px solid #ededed;
}

.user-list {
  position: relative;
  list-style: none;
  width: 100%;
  margin: 40px auto;
  border: 2px solid #ededed;
}
.user-list:before {
  content: "";
  display: block;
  position: absolute;
  z-index: 3;
  top: 0;
  left: 0;
  width: 100%;
  height: 2px;
  background: #fff;
}
.user-list:after {
  content: "";
  display: block;
  position: absolute;
  z-index: 3;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 2px;
  background: #ff;
}

.user-item {
  position: relative;
  overflow: hidden;
  padding: 10px 10px 12px;
  border-bottom: 2px solid #fafafa;
}
.user-item:last-child {
  border-bottom: 0;
}
.user-item:last-child:after {
  content: "";
  display: block;
  position: absolute;
  z-index: 30;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 2px;
  background: #fff;
}



.user-item h5 {
  font-size: 1.5em;
  color: #555;
}
.user-item h6 {
  font-size: 1em;
  color: #888;
}
.user-item .btn-fllw {
  position: absolute;
  top: 14px;
  right: 14px;
  line-height: 40px;
  font-size: 0.875em;
  font-weight: bold;
  padding: 0 1em;
  color: black;
  background-color: white;
  border: 2px solid #3b8686;
  border-radius: 5px;
  transition: all .1s linear;
}
.user-item .btn-fllw:hover {
  color: #fff;
  background-color: #3b8686;
  border: 2px solid #3b8686;
  text-decoration: none;
}
	.page-link{
	margin-left:0px;
	color:none !important;
	border:0px !important;
}
.pagination>li>.selectPage{
	color:black;
}
.adminSideMenu li:nth-child(4) a{
         	background:#a8dba8;
		color:white;
         }
.modal-dialog{
	max-width:800px !important; 
}
.bookName input{
	width:80%;
}
.bookInput{
	border:0px;
}
.bookName{
	border:1px solid black;
	    height: 70px;
}
.book-sub{
	margin:0px;
	width:50px;
	float:left;
}
.user_chk{
	width: 10%;
    float: left;
    line-height:70px;
    height: 100%;
    
}
.user_input{
	float: left;
    width: 90%;
}
.pbtn{
	height:30px;
	width:70px;
    font-size: 0.875em;
    font-weight: bold;
    padding: 0 1em;
    color: black;
    background-color: white;
    border: 2px solid #3b8686;
    border-radius: 5px;
    transition: all .1s linear;
}
.pbtn:hover{
	color: #fff;
    background-color: #3b8686;
    border: 2px solid #3b8686;
    text-decoration: none;
}
body {margin: 10px;}
.where {
  display: block;
  margin: 25px 15px;
  font-size: 11px;
  color: #000;
  text-decoration: none;
  font-family: verdana;
  font-style: italic;
}

.checks {position: relative;
	text-align: center;
}

.checks input[type="checkbox"] { 
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0
}
.checks input[type="checkbox"] + label {
  display: inline-block;
  position: relative;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
.checks input[type="checkbox"] + label:before { 
  content: ' ';
  display: inline-block;
  width: 21px; 
  height: 21px;
  line-height: 21px; 
  margin: -2px 8px 0 0;
  text-align: center; 
  vertical-align: middle;
  background: #fafafa;
  border: 1px solid #cacece;
  border-radius : 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.checks input[type="checkbox"] + label:active:before,
.checks input[type="checkbox"]:checked + label:active:before {
  box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}

.checks input[type="checkbox"]:checked + label:before {  
  content: '\2714';  
  color: #99a1a7;
  text-shadow: 1px 1px #fff;
  background: #e9ecee;
  border-color: #adb8c0;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
}

.checks.small input[type="checkbox"] + label {
  font-size: 12px;
}

.checks.small input[type="checkbox"] + label:before {
  width: 17px;
  height: 17px;
  line-height: 17px;
  font-size: 11px;
}

.checks.etrans input[type="checkbox"] + label {
  padding-left: 30px;
  height:10px;
}
.checks.etrans input[type="checkbox"] + label:before {
  position: absolute;
  left: 0;
  top: 0;
  margin-top: 0;
  opacity: .6;
  box-shadow: none;
  border-color: #3b8686;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}

.checks.etrans input[type="checkbox"]:checked + label:before {
  position: absolute;
  content: "";
  width: 10px;
  top: -5px;
  left: 5px;
  border-radius: 0;
  opacity:1; 
  background: transparent;
  border-color:transparent #3b8686 #3b8686 transparent;
  border-top-color:transparent;
  border-left-color:transparent;
  -ms-transform:rotate(45deg);
  -webkit-transform:rotate(45deg);
  transform:rotate(45deg);
}

.no-csstransforms .checks.etrans input[type="checkbox"]:checked + label:before {
 
  content: "\2714";
  top: 0;
  left: 0;
  width: 21px;
  line-height: 21px;
  color: #3b8686;
  text-align: center;
  border: 1px solid #3b8686;
}
.btn-user{
	line-height: 24px;
    font-size: 0.875em;
    font-weight: bold;
    padding: 0 1em;
    color: white;
    background-color: #3b8686;
    border: 2px solid #3b8686;
    border-radius: 5px;
    transition: all .1s linear;
}
#inputStr{
	border: 2px solid #3b8686;
}
#keyword{
	border: 2px solid #3b8686;
    margin-top: 2px;
}
}
</style>
<body>
<jsp:include page="/views/common/header.jsp" />
   <div class="contents-frame">
	<div class="contents">
   <jsp:include page="/views/common/adminSide.jsp" />
   <div class="admin-contents">
	
	<div id="main-container" class="main-container nav-effect-1">
	<h1 style="font-size:30px;">대출관리</h1>
         <hr>
         <form action="/admin/manageUser.do" method="get">
         		<input type="hidden" name="reqPage" value="1">
			   <input type="text" id="inputStr" style="height: 27px" name="inputStr" placeholder="회원아이디를 입력하세요">
			   <select id="keyword" name="searchKeyword">
			   		<option value="전체">전체</option>
			   		<option value="아이디">아이디</option>
			   		<option value="이름">이름</option>
			   </select>
			   <button class="btn-user">검색하기</button>
         </form>
	  <ul class="user-list">
	    
	    <c:forEach items="${list }" var ="u">
	    	<li class="user-item">
		      <h5>${u.userId }</h5>
		      <h6>${u.userName }</h6>
		      
		      <button class="btn-fllw" onclick="grow(${u.userNo})" data-toggle="modal" data-target="#myModal" >대출 관리</button>
	   		</li>
	   		
	   		<!-- The Modal -->
               <div class="modal" id="myModal">
                 <div class="modal-dialog" style="width:800px">
                   <div class="modal-content">
               
                     <!-- Modal Header -->
                     <div class="modal-header">
                       <h4 class="modal-title">대출 관리</h4>
                       <button type="button" class="close" data-dismiss="modal">&times;</button>
                     </div>
               
                     <!-- Modal body -->
                     <form action="/book/deleteBooks.do">
                        <div class="modal-body" id="modal-body">
	                        <div class="bookName" style="display:none">
	                        <input type="hidden" name="userNo" id="no">
	                        	<div class="user_chk">
	                        		<div class="checks etrans">
									  <input type="checkbox" id="book0"> 
									  <label for="book0"></label> 
								</div>
	                           	</div>
	                           	<div class="user_input">
		                           	<p class="book-sub">책이름:</p><input type="text" class="bookInput" name="book0" id="bookName0" >
		                           	<p class="book-sub">대출일:</p><input type="text" class="bookInput" id="bookEnroll0"><br>
		                          	 <p class="book-sub">반납일:</p><input type="text" class="bookInput" id="bookReturn0">
		                          	 <input type="hidden" class="books">
	                        	</div>
	                        </div>
	                        <div class="bookName" style="display:none">
		                        <div class="user_chk">
	                        		<div class="checks etrans">
									  <input type="checkbox" id="book1"> 
									  <label for="book1"></label> 
								</div>
	                           	</div>
		                        	<div class="user_input">
			                           	<p class="book-sub">책이름:</p><input type ="text" class="bookInput" name="book1" id="bookName1" >
			                           	<p class="book-sub">대출일:</p><input type="text" class="bookInput" id="bookEnroll1"><br>
										<p class="book-sub">반납일:</p><input type="text" class="bookInput" id="bookReturn1">
		                        		<input type="hidden" class="books">
		                        	</div>
	                        </div>
	                        <div class="bookName" style="display:none">
	                       	 	<div class="user_chk">
	                        		<div class="checks etrans">
									  <input type="checkbox" id="book2"> 
									  <label for="book2"></label> 
								</div>
	                           	</div>
	                        	<div class="user_input">
		                           	<p class="book-sub">책이름:</p><input type ="text" class="bookInput" name="book2" id="bookName2" >
		                           	<p class="book-sub">대출일:</p><input type="text" class="bookInput" id="bookEnroll2"><br>
		                            <p class="book-sub">반납일:</p><input type="text" class="bookInput" id="bookReturn2">
	                        		<input type="hidden" class="books">
	                        	</div>
	                        </div>
                        </div>
                     <!-- Modal footer -->
                     <div class="modal-footer">
                        <input type="submit" class="pbtn success" id="deleteBooks" onclick="deleteOut()" value="삭제">
                     </div>
                  </form>
               
                   </div>
                 </div>
               </div>
	    </c:forEach>
	  </ul>
		  <div class = "pagination justify-content-center" id="pageNavi">${pageNavi }</div>
	  </div>
	  </div>
  </div>
  </div>
  <script>
 var arr =new Array();
 var cnt = 0;
  	window.onload = function(){
  		console.log("시작 배열 길이"+arr.length)
  		var chk0 = document.getElementById("book0");
  		var chk1 = document.getElementById("book1");
  		var chk2 = document.getElementById("book2");
  		var name0=document.getElementById("bookName0");
  		var name1=document.getElementById("bookName1");
  		var name2=document.getElementById("bookName2");
  		var deleteBooks=document.getElementById("deleteBooks");
  		var books = document.getElementsByClassName("books");
  		chk0.onclick=function(){
  			if(chk0.checked){
  				books[0].value=name0.value;
  				books[0].setAttribute("name","books");
  				cnt++;
  				console.log(cnt);
  			}else{
  				books[0].removeAttribute("name");
  				cnt--;
  			}
  			
  		};
  		chk1.onclick=function(){
  			if(chk1.checked){  		
  				books[1].value=name1.value;
  				books[1].setAttribute("name","books");
  				cnt++;
  			}else{
  				books[1].removeAttribute("name");
  				cnt--;
  			}
  		};
  		chk2.onclick=function(){
  			if(chk2.checked){  		
  				books[2].value=name2.value;
  				books[2].setAttribute("name","books");
  				cnt++;
  			}else{
  				books[2].removeAttribute("name");
  				cnt--;
  			}
  		};
  		
  	};
	function deleteOut(){
		if(cnt>0){
			document.getElementById("deleteBooks").setAttribute("type","submit");
		}
		else{
			alert("선택한 책이 없습니다.");
			document.getElementById("deleteBooks").setAttribute("type","button");			
		}
	}
  	function grow(userNo){
  		cnt = 0;
  		unCheck();
  		unName();
	  	var book=document.getElementsByClassName('bookName');
	  	var books = document.getElementsByName("books");
  		for(var i=0;i<3;i++){
			book[i].style.display="none"; 
			//books[i].removeAttribute("name");
  		}
  		$.ajax({
  			method:"get",
  			url:"/rentalBookName.do",
  			data:{userNo:userNo},
  			complete: function(data){
  				console.log(data);
  			},
  			success:function(data){
  				document.getElementById("no").value=userNo;
  				for(var i=0;i<data.length;i++){
  					var modal=document.getElementById('bookName'+i);
  					console.log(data);
  					console.log(data[i].bookName);
  					modal.value=data[i].bookName;
  					modal.style.display='block';  	
  					book[i].style.display="block";
  				}
  				
  			}
  		});
  		$.ajax({
  			method: "get",
  			url:"/rentalInfo.do",
  			data: {userNo:userNo},
  			complete: function(data){
  				console.log(data);
  			},
  			success: function(data){
  				console.log(data);
  				for(var i=0;i<data.length;i++){
  					var enroll = document.getElementById("bookEnroll"+i);
  					var rDate = document.getElementById("bookReturn"+i);
  					enroll.value=data[i].enrollDate;
  					rDate.value=data[i].returnDate;
  				}
  			}
  		});
  	}
  	function unCheck(){
  		$("input:checkbox").each(function(){this.checked=false});
  	}
  	function unName(){
  		var books = document.getElementsByClassName("books");
  		for(var i=0;i<books.length;i++){
	  		books[i].removeAttribute("name");
  			
  		}
  	}
  </script>
</body>
</html>