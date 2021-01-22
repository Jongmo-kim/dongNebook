<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/css/rental/rentalLoc.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<div class="admin-contents-frame">
        
        <div class="admin-contents">
            <p class="admin-contents-maintext">수령 위치 검색</p>
            <div class="admin-line"></div>
            <div class="admin-map">
            	<div class="map_wrap">
				    <div id="map" style="width:100%;height:555px;position:relative;overflow:hidden;"></div>
				
				    <div id="menu_wrap" class="bg_white">
				        <div class="option">
				            <div>
                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text"id="keyword" size="15"> 
			                    <button type="submit" class="search">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
            </div>
            <div class="admin-explain"></div>
            <form action="/insertLoc.do">
            
	            <input type="text" class="loc-inform" name="placeName" id="loc-inform" readonly>
				<input type="hidden" id="loc-addr" name="addr">
				<input type="hidden" id="loc-phone" name="phone">
	            <button class="loc-inform-submit">확인</button>
            </form>
        </div>
    </div>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d94e3fab43df95c64983cf272918d89e&libraries=services"></script>

<script type="text/javascript" src="/js/rental/rentalLoc.js?v=<%=System.currentTimeMillis()%>"></script>
</body>
</html>