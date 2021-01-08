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
</head>
<body>
<form action="/proposalSuccess.do" method="post">
<h1>도서 승인/반려</h1>
    <table border=1>
    <tr>
        <td><input type="checkbox" id="allChk"></td>
        <td>제목</td>
        <td>저자</td>
        <td>신청자</td>
    </tr>
    <c:forEach items="${list }" var="b" varStatus="status">
    <tr>
        <td><input type="checkbox" class="chk"></td>
        <td>${b.bookName }
        <input type="hidden" name="${b.bookKind }">
        <input type="hidden" name="${b.bookPublisher }">
        <input type="hidden" name="${b.bookIntroduce }">
        <input type="hidden" name="${b.imageurl }">
        <input type="hidden" name="${b.bookCount }">
        <input type="hidden" name="${b.rCount }">
        </td>
        <td>${b.bookWriter }</td>
        <td>${userList.get(status.index).userName }</td>
    </tr>
    </c:forEach>
        </table>
        <input type="submit" class="insertBtn" value="승인">
   		</form>
   		<div id="pageNavi">${pageNavi }</div>
    <script>
    $(".insertBtn").click(function() {
        var inputs = $(".chk:checked");
    });
       $(document).ready(function(){
           $('#allChk').click(function(){ $("input[type=checkbox]").prop('checked',this.checked);
                });
       })
    </script>
</body>
</html>