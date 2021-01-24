<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.pagination{
	margin : 0 auto;
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
	table{
		border-top : 3px solid lightgray;
		border-bottom : 3px solid lightgray;
		width : 1100px;
		margin-top:30px;
	}
	table>tbody>tr>td:first-child{
		width:20px;
	}
	table>tbody>tr>td:nth-child(2){
	padding-top: 10px;
    padding-bottom: 10px;
		width:100px;
	}
	table>tbody>tr>td:nth-child(2) img{
		width:150px;
	}
	table>tbody>tr>td:nth-child(3){
		width:500px;
	}
	table>tbody>tr>td{
		font-size : 15px;
		border-top : 1px solid lightgray;
		height : 150px;
		text-align:center;
	}
	table>tbody>tr>td:nth-child(3)>p{
	text-align:left;
	}
	table>tbody>tr>td:nth-child(3)>p:first-child{
	font-weight: bold;
	}
	table>tbody>tr>td:nth-child(3)>p:first-child>a{
	color:#333333;
	font-size:18px;
	}
	table>tbody>tr>td:nth-child(3)>p:nth-child(2){
		color:gray;
		font-weight: 500;
		font-size:15px;
	}
	table>tbody>tr>td:nth-child(3)>p:nth-child(3){
		font-size:15px;
		font-weight: 100;
		color:#262626;
	}
	.con{
	margin : 0 auto;
	width : 1100px;
	margin-top:30px;
	}
	.con>h1{
		color:#404040;
		font-size : 33px;
	}
	.SideMenu li:nth-child(3) a {
    background: #a8dba8;
    color: white;
}
</style>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
		<jsp:include page="/views/common/header.jsp" />
  <div class="contents-frame">
		
		<div class="contents">
				<jsp:include page="/views/common/userSide.jsp" />
			<div class="admin-contents">
				<div id="main-container" class="main-container nav-effect-1">
	<h1 style="font-size:30px;"> 대출 순위</h1>
	<hr>
	<table>
		<c:forEach items="${list }" var ="b">
			<tr>
				<td>${b.rankNum }</td>
				<td><a href="/book/selectOneBook.do?bookNo=${b.bookNo }"><img alt="${b.bookName }Image" src="${b.imageurl }"></a></td>
				<td class="td3"><p><a href = "/book/selectOneBook.do?bookNo=${b.bookNo }">${b.bookName }</a></p>
				<p>${b.bookWriter }</p>
				<p>${b.bookIntroduce }</p>
				</td>
				</tr>
		</c:forEach>
	</table>
		<div class = "pagination justify-content-center" id="pageNavi">${pageNavi }</div>
	</div>
		</div>
		</div>
			</div>
</body>
</html>