<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 북</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<link href="../css/index/index.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/js/index/index.js"></script>
<style>
	.bookImg>a>img{
		width:140px;
		height : 190px;
	}
	.bookImg{
	border:none;
	text-align:center;
	}
	.info{
	border:none;
	text-align:center;
	
	}
	.info>p>a{
	color: #333333;
	}
</style>

</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	
	 <div class="content">
        <div class="imgMain"><img class="mainImg" src="../image/index/main2.jpg">
            <div>
                <input type="text" placeholder="검색어를 입력하세요.">
                <input type="image" src="../image/index/search.webp" alt="submit" name="Submit" value="Submit"  align="absmiddle">
            </div>
        </div>
        <div class="content2">
            <div>달력</div>
            <div>공지</div>
        </div>
        <br>
        <div class="book">
            <ul class="navi">
                <li class="tab" onclick="selectTab(0);">새로운 책</li>
                <li class="tab" onclick="selectTab(1);">대출 순위</li>
            </ul>
            <div class="contents">
               <div class="bookContent">
                <ul>
                <c:forEach items="${newBook }" var="n">
				   <li>
                   <div>
                   		<div class="bookImg"><a href = "#"><img alt="${n.bookName }Image" src="${n.imageurl }"></a></div>
                		<div class="info">
                		<p><a href=#>${n.bookWriter }</a></p>
                		</div>
                   </div>
                   
                   </li>
                   </c:forEach>
                  
                </div>
                <div class="bookContent">
               <ul>
               <c:forEach items="${rankList }" var="b">
                   <li>
                   <div>
                   		<div class="bookImg"><a href = "#"><img alt="${b.bookName }Image" src="${b.imageurl }"></a></div>
                		<div class="info">
                		<p><a href=#>${b.bookWriter }</a></p>
                		</div>
                   </div>
                   
                   </li>
                  </c:forEach>
               </ul>
               </div>
            </div>
         </div>
    </div>
    <br>
    <jsp:include page="/views/common/footer.jsp" />
    
	
</body>
</html>