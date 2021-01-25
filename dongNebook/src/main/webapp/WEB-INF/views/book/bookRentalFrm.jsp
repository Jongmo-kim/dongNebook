<%@page import="com.dongnebook.book.model.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/css/rental/rentalLoc.css?v=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="/css/rental/bookRentalFrm.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<div class="contents-frame">
		<div class="contents">
			<jsp:include page="/views/common/userSide.jsp" />
			<div class="admin-contents">
				<div id="main-container" class="main-container nav-effect-1">
					<h1 style="font-size:30px;">도서대출</h1>
					<hr>
					<div class="content">
						<form action="/insertBookRental.do" method="POST">
							<div class="content-top">
								<table style="table-layout:fixed;" bordercolor="#feebe1" cellpadding="5" border="1" cellspacing="0" align="center" style="border-collapse:collapse; border:1px lightgray solid;">
									<tr>
										<th>도서번호</th>
										<th>이미지</th>
										<th>제목</th>
										<th>저자</th>
										<th>대출일자</th>
										<th>반납일자</th>
									</tr>
									<c:forEach items="${rentalList }" var ="b">
									<tr>
										<input type="hidden" value="${b.bookNo}" name="bookNo">
										<td name="bookNo">${b.bookNo}</td>
										<td style="width: 100px; height: 150px;"><img src="${b.imageurl }" width="100%" height="100%"></td>
										<td>${b.bookName}</td>
										<td>${b.bookWriter}</td>
										<td><%= sf.format(nowTime) %></td>
										<td><%= sf.format(cal.getTime())%></td>
									</tr>
									</c:forEach>
								</table>
								<h3 style="display: inline-block;">상호대차 지정</h3>
								<div class="content-middle">
									<input type="hidden" id="loc-inform" name="placeName" value="${rentalLoc.placeName }" readonly><input type="button" class="goRentalLoc" value="검색">
									<input type="hidden" id="loc-addr" name="addr" value="${rentalLoc.addr }">
									<input type="hidden" id="loc-phone" name="phone" value="${rentalLoc.phone }">
								</div>
							</div>
							<div class="content-bottom">
								<input type="submit" id="rentalBtn" value="대출하기"><input type="button" id="pageBack" value="이전으로">
							</div>
						</form>
						<!-- <form action="/rentalLoc.do"  method="post"> -->
							<input type="submit" id="goRentalLoc" data-toggle="modal" data-target="#myModal" value="검색" style="display:none">
						<!-- </form> -->

						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- The Modal -->
               <div class="modal" id="myModal">
                 <div class="modal-dialog">
                   <div class="modal-content">
               
                     
                     <!-- Modal body -->
                     
                        <div class="modal-body">
                          <div class="loc-contents-frame">
       
					        <div class="loc-contents">
					        	
					            <div class="loc-map">
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
            <div class="admin-explain">
            <form action="/mergeLoc.do">
            
	            <input type="text" class="loc-inform" name="placeName" id="loc-inform" readonly>
            	<input type="hidden" value="${rentalList }">
				<input type="hidden" id="loc-addr" name="addr">
				<input type="hidden" id="loc-phone" name="phone">
	            <button class="loc-inform-submit">확인</button>
            </form>
            </div>
        </div>
    </div>
                        </div>
                     <!-- Modal footer -->
                     <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">확인</button>
                       <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                     </div>
                      </div>
                 </div>
               </div>

	<form action="/rentalLoc.do"  method="post">
		<input type="submit" id="goRentalLoc" value="검색" style="display:none">
	</form>
</div>
</div>

</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d94e3fab43df95c64983cf272918d89e&libraries=services"></script>

<script type="text/javascript" src="/js/rental/rentalLoc.js?v=<%=System.currentTimeMillis()%>"></script>
<script>
	$('.goRentalLoc').on('click', function() {
		$('#goRentalLoc').trigger('click');
	});
	$('#pageBack').on('click', function () {
		history.back();
	});
	
$("#myModal").on('shown.bs.modal', function() {
	map.relayout(); 
	});
$(document).ready(function(){
    $(".info").click(function(){
        console.log("12");
        $(".modal").modal("hide");
    });
});
$("#rentalBtn").click(function(){ 
    // id 'testInput'의 value의 null 체크
    if($("#loc-inform").val()==""){
        alert("상호대차 위치를 입력하세요");
        return false;
    } else {
        return true;
    }
});
// null 체크 함수(custom)
function vali(val){
    if (value === null) return true; 
    if (typeof value === 'string' && value === '') return true;
    if (typeof value === 'undefined') return true;
    return false;
}
</script>
</html>