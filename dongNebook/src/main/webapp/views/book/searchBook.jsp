<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 검색</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link rel="stylesheet" href="/css/book/searchBook.css?v=<%=System.currentTimeMillis()%>">
<script type="text/javascript" src="/js/book/searchBook.js?v=<%=System.currentTimeMillis()%>"></script>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	
	<div class="searchBox">
		<div class="searchFrm">
			<input type="text"><button>검색하기</button>
		</div>
		<div class="guessedBox">
			<ul>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
				<li>제안</li>
	
			</ul>
		</div>
	</div>
	<div class="searchedBookBox">
		<input type="text" value="책이름">
		<input type="text" value="책이름">
		<input type="text" value="책이름">
		<input type="text" value="책이름">
		<input type="text" value="책이름">
	</div>
</body>
</html>