<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<style>
	#pageNavi{
         text-align:center;
     }
     .pagination{
	margin-top : 50px;
	margin-bottom : 50px;
	}
	.pagination>li>a{
        color: #79bd9a;
        border:none;
    }
	.pagination>li>.selectPage{
	color: black; 
	border:none;
	}
	.pagination>li>a:hover{
	color : #79bd9a;
	}
         table {
         width : 100%;
            margin: 0 auto;
            border-top: 3px solid lightgray;
            border-bottom: 3px solid lightgray;
            text-align: center;
        }

        table>tbody>tr:first-child>th{
            border-bottom: 2px solid lightgray;
            border-right: 1px dashed lightgray;
        }
        table>tbody>tr:first-child>th:last-child{
            border-right: none;
        }
        table>tbody>tr:first-child>th{
            height: 50px;
            border-right: 1px solid #f8f9fa;
        }
        table>tbody>tr:first-child>th:first-child{
            width: 50px;
        }
        table>tbody>tr:first-child>th:nth-child(2){
            width: 100px;
        }
         table>tbody>tr:first-child>th:nth-child(3){
            width: 500px;
        }
         table>tbody>tr:first-child>th:nth-child(4){
            width: 150px;
        }
        table>tbody>tr:first-child>th:nth-child(5){
            width: 150px;
        }
        table>tbody>tr:first-child>th:nth-child(6){
            width: 60px;
        }
        table>tbody>tr>td {
            font-size: 15px;
            border-top: 1px solid lightgray;
            height: 150px;
            border-right: 1px dashed lightgray;
        }
        table>tbody>tr>td:last-child{
             border-right: none;
             padding-left: 5px;
        }
        table>tbody>tr>td:nth-child(3){
            text-align: left;
            padding-left: 10px;
        }

        table>tbody>tr>td:nth-child(3)>p:first-child {
            font-size: 20px;
        }

        table>tbody>tr>td:nth-child(3)>p:nth-child(2) {
            font-size: 15px;
            color:gray;
        }

        table>tbody>tr>td:nth-child(3)>p:last-child {
            font-size: 15px;
            color: gray;
        }
         .button{
         	text-align:center;
         }
         .pbtn{
         	
         	border: 2px solid #3b8686;
         	background-color:white;
         	font-size : 18px;
         	border-radius: 5px;
         	width: 50px;
         	    margin-bottom: 10px;
    margin-top: 10px;
         }
         .pbtn:hover{
         background-color: #3b8686;
         color:white;
         }
         .adminSideMenu li:nth-child(2) a{
         	background:#a8dba8;
		color:white;
         }
         .bookListTable{
         	border-left:none;
         	border-right:none;
         }
         .main-frame{
         	margin:0 auto;
         }
         .table-header{
         	    background: #a8dba8;
    color: #024e13;
         }
     </style>
</head>
<body>
<jsp:include page="/views/common/header.jsp" />
   <div class="main-frame">
   <jsp:include page="/views/common/adminSide.jsp" />
      <div class="contents">
         <h1 style="font-size:30px;">책 리스트</h1>
         <hr>
         <div class="list-contents">
         <table class="bookListTable" border=1>
            <tr class="table-header">
                 <th>책번호</th>
                 <th>이미지</th>
                 <th>제목</th>
                 <th>카테고리</th>
                 <th>출판사</th>
                 <th>수정</th>
                 
             </tr>
            <c:forEach items="${list }" var ="b">
               <tr>
                  <td>${b.bookNo }</td><td><img src=${b.imageurl}></td><td><p>${b.bookName }</p><p>${b.bookWriter }</p><p>${b.ISBNdkt }</p></td><td>${b.bookKind }</td><td>${b.bookPublisher }</td><td><button type="button" class="pbtn success" data-toggle="modal" data-target="#myModal" onclick="updateInform(${b.bookNo },'${b.bookName}','${b.bookKind}','${b.bookWriter}','${b.bookPublisher}','${b.bookIntroduce}')">수정</button><button class="pbtn success" onclick="location.href='/book/bookDelete.do?bookNo=${b.bookNo}'">삭제</button></td>         
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
      </div>
         <p style="text-align:center">${pageNavi }</p>
   </div>
</div>
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