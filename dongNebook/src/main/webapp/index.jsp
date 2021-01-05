<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네 북</title>

<jsp:include page="/views/common/linkHead.jsp"/>
<link href="../css/index/index.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/js/index/index.js"></script>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<jsp:include page="/views/common/testModal.jsp" />
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
                   <li><a href="#">책1
                   
                   </a></li>
                   
                   <li><a href="#">책1</a></li>
                   <li><a href="#">책1</a></li>
                   <li><a href="#">책1</a></li>
                   <li><a href="#">책1</a></li>
               </ul>
                </div>
                <div class="bookContent">
               <ul>
                   <li><a href="#">책2</a></li>
                   <li><a href="#">책2</a></li>
                   <li><a href="#">책2</a></li>
                   <li><a href="#">책2</a></li>
                   <li><a href="#">책2</a></li>
               </ul>
               </div>
            </div>
         </div>
    </div>
    <br>
    <footer>footer
    </footer> 
	
</body>
</html>