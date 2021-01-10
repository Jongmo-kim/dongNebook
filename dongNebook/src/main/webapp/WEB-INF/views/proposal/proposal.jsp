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
         body{
             width: 100%;
         }
         table{
             margin: 0 auto;
             margin-top: 50px;
             border-top: 3px solid lightgray;
             border-bottom: 3px solid lightgray;
         }
         table>tbody>tr{
             text-align: center;
         }
         table>tbody>tr>td{
            border-bottom: 1px solid lightgray; 
         }
         table>tbody>tr:last-child>td{
            border-bottom: none;
         }
 	table>tbody>tr:first-child>td:nth-child(2){
        
 		width : 500px;
        height: 50px;
        font-size: 18px;
        font-weight: bold;
 	}
         table>tbody>tr:first-child>td:nth-child(3){
 		width : 100px;
        height: 50px;
        font-size: 18px;
        font-weight: bold;
 	}
          table>tbody>tr:first-child>td:nth-child(4){
 		width : 100px;
        height: 50px;
        font-size: 18px;
        font-weight: bold;
 	}
         table>tbody>tr>td:first-child{
             width: 50px;
         }
         table>tbody>tr>td{
             height: 35px;
         }
         [type=button]{
         margin-top:30px;
             width: 90px;
             height: 40px;
             font-size: 20px;
         }
         .button{
         	text-align:center;
         }
         #pageNavi{
         margin-top:50px;
         text-align:center;
         }
 </style>
 
</head>
<body>
<h1>도서 승인/반려</h1>
    <table>
    <tr>
        <td><input type="checkbox" id="allChk"></td>
        <td>제목</td>
        <td>저자</td>
        <td>신청자</td>
    </tr>
    <c:forEach items="${list }" var="b" varStatus="status">
    <tr>
        <td><input type="checkbox" class="chk"></td>
        <td>${b.bookName }</td>
        
        <input type="hidden" value="${b.bookKind }">
        <input type="hidden" value="${b.bookPublisher }">
        <input type="hidden" value="${b.bookIntroduce }">
        <input type="hidden" value="${b.imageurl }">
        <input type="hidden" value="${b.ISBN13 }">
        <td>${b.bookWriter }</td>
        <td>${userList.get(status.index).userName }</td>
    </tr>
    </c:forEach>
        </table>
        <div class="button">
        <input type="button" class="insertBtn" value="승인">
        <input type="button" class="deleteProposal" value="반려">
   		</div>
   		<div id="pageNavi">${pageNavi }</div>
    <script>
    $(".insertBtn").click(function() {
        var inputs = $(".chk:checked");
        var allList = new Array();
        //idx는 순서 내가 체크한 순서
        $(".chk:checked").each(function(idx, item){
        	var book = new Object();
        	var bookName = $(item).parent().next().html();
        	var bookKind = $(item).parent().next().next().val();
        	var bookPublisher = $(item).parent().next().next().next().val();
        	var bookIntroduce = $(item).parent().next().next().next().next().val();
        	var imageurl = $(item).parent().next().next().next().next().next().val();
        	var ISBN13 = $(item).parent().next().next().next().next().next().next().val();
        	var bookWriter = $(item).parent().parent().find("td").eq(2).html();
        	
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
        	var bookName = $(item).parent().next().html();
        	var bookKind = $(item).parent().next().next().val();
        	var bookPublisher = $(item).parent().next().next().next().val();
        	var bookIntroduce = $(item).parent().next().next().next().next().val();
        	var imageurl = $(item).parent().next().next().next().next().next().val();
        	var ISBN13 = $(item).parent().next().next().next().next().next().next().val();
        	var bookWriter = $(item).parent().parent().find("td").eq(2).html();
        	
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