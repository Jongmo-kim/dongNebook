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
</style>
<body>
<jsp:include page="/views/common/header.jsp" />
   
   <jsp:include page="/views/common/adminSide.jsp" />
	<div class="contents">
	<h1 style="font-size:30px;">회원관리</h1>
         <hr>
	  <ul class="user-list">
	    
	    <c:forEach items="${list }" var ="u">
	    	<li class="user-item">
		      <h5>${u.userId }</h5>
		      <h6>${u.userName }</h6>
		      
		      <button class="btn-fllw" onclick="grow(${u.userNo})" data-toggle="modal" data-target="#myModal" >대출 관리</button>
	   		</li>
	   		
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
                        <div class="modal-body" id="modal-body">
                           <input type ="text" name="bookName" id="bookName0" style="display:none">
                           <input type ="text" name="bookName" id="bookName1"style="display:none">
                           <input type ="text" name="bookName" id="bookName2" style="display:none">
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
	  </ul>
		  <div class = "pagination justify-content-center" id="pageNavi">${pageNavi }</div>
  </div>
  <script>
  	function grow(userNo){
  		console.log("유저넘버"+userNo);
  		$.ajax({
  			method:"get",
  			url:"/rentalBookName.do",
  			data:{userNo:userNo},
  			complete: function(data){
  				console.log(data);
  			},
  			success:function(data){
  				for(var i=0;i<data.length;i++){
  					var modal=document.getElementById('bookName'+i);
  					console.log(data);
  					console.log(data[i].bookName);
  					modal.value=data[i].bookName;
  					modal.style.display='block';  					
  				}
  				
  			}
  		});
  		/*$.ajax({
  			method: "get",
  			url:"/rentalInfo.do",
  			data: {userNo:userNo},
  			complete: function(data){
  				console.log(data);
  			},
  			success: function(data){
  				console.log(data);
  				
  				 document.getElementById("bookNo").value=bookNo;
  		         document.getElementById("bookName").value=bookName;
  		         document.getElementById("bookKind").value=bookKind;
  		         document.getElementById("bookWriter").value=bookWriter;
  		         document.getElementById("bookPublisher").value=bookPublisher;
  		         document.getElementById("bookIntroduce").value=bookIntroduce;
				 
  			}
  		});*/
  	}
  </script>
</body>
</html>