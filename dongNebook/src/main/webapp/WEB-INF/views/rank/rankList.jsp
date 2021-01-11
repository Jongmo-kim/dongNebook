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
		
		margin : 0 auto;
		border-top : 3px solid lightgray;
		border-bottom : 3px solid lightgray;
		width : 1000px;
		margin-top:100px;
	}
	table>tbody>tr>td:first-child{
		width:20px;
	}
	table>tbody>tr>td:nth-child(2){
		width:100px;
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
	font-size:19px;
	}
	table>tbody>tr>td:nth-child(3)>p:first-child>a{
	color:#333333;
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
</style>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
		<jsp:include page="/views/common/header.jsp" />
	
	<table>
		<c:forEach items="${list }" var ="b">
			<tr>
				<td>${b.rankNum }</td>
				<td><img alt="${b.bookName }Image" src="${b.imageurl }"></td>
				<td class="td3"><p><a href = '#'>${b.bookName }</a></p>
				<p>${b.bookWriter }</p>
				<p>${b.bookIntroduce }</p>
				</td>
				</tr>
		</c:forEach>
	</table>
		<div class = "pagination justify-content-center" id="pageNavi">${pageNavi }</div>
		
			
</body>
</html>