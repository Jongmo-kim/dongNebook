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

.green {
  
}
.button {
    display: block;
    position: relative;
    padding: 0 20px;
    text-align: center;
    text-decoration: none;
    font: bold 12px/25px Arial, sans-serif;
 	width: 114px;
    text-shadow: 1px 1px 1px rgba(255,255,255, .22);
 
    -webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 30px;
 
    -webkit-box-shadow: 1px 1px 1px rgba(0,0,0, .29), inset 1px 1px 1px rgba(255,255,255, .44);
    -moz-box-shadow: 1px 1px 1px rgba(0,0,0, .29), inset 1px 1px 1px rgba(255,255,255, .44);
    box-shadow: 1px 1px 1px rgba(0,0,0, .29), inset 1px 1px 1px rgba(255,255,255, .44);
 
    -webkit-transition: all 0.15s ease;
    -moz-transition: all 0.15s ease;
    -o-transition: all 0.15s ease;
    -ms-transition: all 0.15s ease;
    transition: all 0.15s ease;
}
.chat-room-name{
	padding-left:12px;
	
}
.chat-room-frame{
position:relative;
}
.cmCount-frame{
    position: absolute;
    top: 11px;
    right: 9px;
    border-radius: 50%;
    border: 8px solid red;
    display: none;
}
    }
    .cmCount-frame p{
    position: absolute;
    top: -23px;
    left: -6px;
    width: 12px;
    text-align: center;
    
    font-size: 2px;
    z-index:999;
    color: white;
    }
</style>
<body>

	<jsp:include page="/views/common/header.jsp" />
	<div class="contents-frame">
	<div class="contents">
   <jsp:include page="/views/common/adminSide.jsp" />
   <div class="admin-contents">
	
       
	<div id="main-container" class="main-container nav-effect-1">
   
	<h1 style="font-size:30px;">1:1상담</h1>
         <hr>
        <table class="table">
    <thead>
        <tr>
            <th>방번호</th>
            <th>유저아이디</th>
            <th>입장</th>
        </tr>
    </thead>
     <tbody>
        <!-- <tr>
            <td>Default</td>
            <td>Defaultson</td>
            <td>def@somemail.com</td>
        </tr>     
        <tr class="success">
            <td>Success</td>
            <td>Doe</td>
            <td>john@example.com</td>
        </tr>
        <tr class="danger">
            <td>Danger</td>
            <td>Moe</td>
            <td>mary@example.com</td>
        </tr>
        <tr class="info">
            <td>Info</td>
            <td>Dooley</td>
            <td>july@example.com</td>
        </tr>
        <tr class="warning">
            <td>Warning</td>
            <td>Refs</td>
            <td>bo@example.com</td>
        </tr>
        <tr class="active">
            <td>Active</td>
            <td>Activeson</td>
            <td>act@example.com</td>
        </tr> -->
   	
     <c:forEach items="${list}" var="room" varStatus="status">
		<!--  <form action="/chat/chatRoom.do?chatUser=${room.getCmSender()}" method="post">-->
		<c:if test="${room.getCmSender()!=null}">
		<tr>
            <td>${status.count}</td>
            <td>${room.getCmSender()}님</td>
            <td><button class="button chatAdminRoom" value="${room.getCmSender() }">채팅방 입장</button></td>
        </tr> 
		<%-- <div class="chat-room-frame">
			<p class="chat-room-name">${room.getCmSender()}님의 채팅방</p>
				<div class="cmCount-frame">
											<p class="cmCount" id="${room.getCmSender()}"></p>
				</div>
			</div>
			<button class="button big green" onclick="openAdminWindow('${room.getCmSender()}')" type="submit">채팅방 입장</button>
			<hr> --%>
			
			</c:if>
		<!-- </form> -->
	</c:forEach>
	 </tbody>
</table>
	<%--  <%!i=1; %> --%>
   </div>
   </div>
   </div>
   </div>
   
 
   <script >
   		function openAdminWindow(data){
   			console.log(data);
   			var parameter=data;
			   var	ret = window.open("/chat/chatRoom.do?chatUser="+parameter+"", "PopupWin", "width=420,height=600,top=-100,left=12000,status=0,toolbar=0,scrollbars=0,titlebar=0");	
			   
   		}
   		
   </script>
</body>
</html>