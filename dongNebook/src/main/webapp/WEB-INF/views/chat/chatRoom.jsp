<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         
   </div>
</body>
</html>