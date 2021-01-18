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
	.adminSideMenu li:nth-child(5) a{
         	background:#a8dba8;
		color:white;
}
</style>
<body>
	<jsp:include page="/views/common/header.jsp" />
   <jsp:include page="/views/common/adminSide.jsp" />
   <div class="contents">
	<h1 style="font-size:30px;">1:1상담</h1>
         <hr>
        
     <c:forEach items="${list}" var="room">
		<form action="/chatRoom.kh?chatUser=${room }" method="post">
			<button class="chatRoom" type="submit">${room.getCmSender()}의 방</button>
		</form>
	</c:forEach>
   </div>
</body>
</html>