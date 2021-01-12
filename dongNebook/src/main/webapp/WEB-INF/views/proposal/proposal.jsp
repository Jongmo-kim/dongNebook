<%@page import="com.dongnebook.proposal.model.vo.ProposalVO"%>
<%@page import="com.dongnebook.book.model.vo.Book"%>
<%@page import="java.util.ArrayList"%>
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
         width : 1000px;
            margin: 0 auto;
            margin-top:100px;
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
            border-right: 1px dashed lightgray;
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
            width: 100px;
        }
        table>tbody>tr>td {
            font-size: 15px;
            border-top: 1px solid lightgray;
            height: 150px;
            border-right: 1px dashed lightgray;
        }
        table>tbody>tr>td:last-child{
             border-right: none;
        }
        table>tbody>tr>td:nth-child(3){
            text-align: left;
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
         	width: 100px;
         	height : 50px;
         	margin-top:50px;
         	border: 1px solid #3b8686;
         	background-color:white;
         	font-size : 18px;
         	color : #404040;
         	border-radius: 5px;
         }
         .pbtn:hover{
        background-color: #3b8686;
        color: white;
         }
 </style>
 <jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
<jsp:include page="/views/common/header.jsp" />
    <table>
    <tr>
        <th><input type="checkbox" id="allChk"></th>
        <th>이미지</th>
        <th>제목</th>
        <th>카테고리</th>
        <th>출판사</th>
        <th>신청자</th>
    </tr>
    <c:forEach items="${list }" var="b" varStatus="status">
    <tr>
        <td><input type="checkbox" class="chk"></td>
        <td>${b.imageurl}</td>
               <td>
                   <p>${b.bookName }</p>
                   <p>${b.bookWriter }</p>
                   <p>${b.ISBN13 }</p>
               </td>
               <td>${b.bookKind }</td>

               <td>${b.bookPublisher }</td>
               <input type="hidden" value="${b.bookIntroduce }">
        <td>${userList.get(status.index).userName }</td>
    </tr>
    </c:forEach>
        </table>
        <div class="button">
        <input type="button" class="insertBtn pbtn" value="승인">
        <input type="button" class="deleteProposal pbtn" value="반려">
   		</div>
   		<div class = "pagination justify-content-center" id="pageNavi">${pageNavi }</div>
    <script>
    $(".insertBtn").click(function() {
        var inputs = $(".chk:checked");
        var allList = new Array();
        //idx는 순서 내가 체크한 순서
        $(".chk:checked").each(function(idx, item){
        	var book = new Object();
            var imageurl = $(item).parent().next().html();
            var bookName = $(item).parent().parent().find("td").eq(2).find("p").eq(0).html();
            var bookWriter = $(item).parent().parent().find("td").eq(2).find("p").eq(1).html();
            var ISBN13 = $(item).parent().parent().find("td").eq(2).find("p").eq(2).html();
            var bookKind = $(item).parent().next().next().next().html();
            var bookPublisher = $(item).parent().parent().find("td").eq(4).html();
            var bookIntroduce = $(item).parent().next().next().next().next().next().val();

        	book.bookName = bookName;
        	book.bookKind = bookKind;
        	book.bookPublisher = bookPublisher;
        	book.bookIntroduce = bookIntroduce;
        	book.imageurl = imageurl;
        	book.ISBN13 = ISBN13;
        	book.bookWriter = bookWriter;
        	
        	allList.push(book);
        	
        })
        
        $.ajax({
        	contentType : "application/json; charset=utf-8",
        	type : "post",
        	url : "/proposal/proposalSuccess.do",
        	data : JSON.stringify(allList),
        	success : function(result){
        		location.href = "/proposal/proposalList.do?reqPage=1";
        	},
        	error : function(){
        		alert("승인 실패");
        	}
        });
        	
                
    });
    $(".deleteProposal").click(function(){
    	var list = new Array();
    	$(".chk:checked").each(function(idx,item){
    		var book = new Object();
    		var imageurl = $(item).parent().next().html();
            var bookName = $(item).parent().parent().find("td").eq(2).find("p").eq(0).html();
            var bookWriter = $(item).parent().parent().find("td").eq(2).find("p").eq(1).html();
            var ISBN13 = $(item).parent().parent().find("td").eq(2).find("p").eq(2).html();
            var bookKind = $(item).parent().next().next().next().html();
            var bookPublisher = $(item).parent().parent().find("td").eq(4).html();
            var bookIntroduce = $(item).parent().next().next().next().next().next().val();

        	book.bookName = bookName;
        	book.bookKind = bookKind;
        	book.bookPublisher = bookPublisher;
        	book.bookIntroduce = bookIntroduce;
        	book.imageurl = imageurl;
        	book.ISBN13 = ISBN13;
        	book.bookWriter = bookWriter;
        	list.push(book);
    	});
    	$.ajax({
        	contentType : "application/json; charset=utf-8",
        	type : "post",
        	url : "/proposal/proposalDelete.do",
        	data : JSON.stringify(list),
        	success : function(result){
        		location.href = "/proposal/proposalList.do?reqPage=1";
        	},
        	error : function(){
        		alert("반려 실패");
        	}
        });
    });
    $(document).ready(function() {
        
        $(".chk").click(function(){
             var chk = $(".chk").length;
        var chkCount = $(".chk:checked").length;
            if(chk == chkCount){
               $("#allChk").prop("checked",true);
            }else{
            $("#allChk").prop("checked",false); 
            }
        });
       $("#allChk").click(function(){
        //만약 전체 선택 체크박스가 체크된상태일경우
        if($("#allChk").prop("checked")) {
            $("input[type=checkbox]").prop("checked",true);
            //input type이 체크박스인것은 모두 체크함
        } else {
            $("input[type=checkbox]").prop("checked",false);
            //input type이 체크박스인것은 모두 체크 해제함
        };
        });
    });
    </script>
</body>
</html>