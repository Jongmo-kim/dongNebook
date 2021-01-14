<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh");
	
	Calendar cal = Calendar.getInstance();
	
	Date date = new Date();
	cal.setTime(date);
	cal.add(Calendar.DATE, +3);
	   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 대출</title>
<jsp:include page="/views/common/linkHead.jsp"/>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	
	<h1 style="font-size:30px;">책 대출</h1>
	<hr>
	<form action="/insertBookRental.do">
		<table border=1>
			<tr>
				<th>책 번호</th><th>이미지</th><th>책이름</th><th>저자</th><th>수량</th><th>대출일자</th><th>반납일자</th>
			</tr>
			<c:forEach items="${list }" var ="b"> 
			<tr>
				<td>${b.bookNo}</td><td><img src=${b.imageurl}></td><td>${b.bookName }</td><td>${b.bookWriter }</td><td>${b.bookCount}</td><td><%= sf.format(nowTime) %>시</td><td><%= sf.format(cal.getTime())%></td>	
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6">상호대차 장소 검색</td><td><input type="button" value="검색"></td>
			</tr>
			<tr>
				<td colspan="7"><input type="submit" value="대출하기"><input type="reset" value="취소하기"></td> 
			</tr>
		</table>
	</form>
</body>
</html>