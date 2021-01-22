<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.fa-clipboard, .fa-bell {
	cursor: pointer;
}
</style>
<header>

	<div class="header">
		<div class="menu-frame">
			<div>
				<div class="main-img">
					<a href="/"> <img src="../image/header/logo.png">
					</a>
				</div>
				<div class="main-menu">
					<ul class="menu-list">
						<li><a href="/book/searchBookFrm.do">도서대출</a></li>
						<li><a href="/rank/rankList.do?reqPage=1">사용자 서비스</a></li>
						<li><a href="/notice/noticeList.do?reqPage=1">공지사항</a></li>
						<li><a href="/calendar/calendarView.do">일정</a></li>
					</ul>
				</div>



				<div class="mem-sel">
					<ul>
						<c:choose>
							<c:when test="${loginUser == null }">
								<c:choose>
									<c:when test="${loginAdmin == null }">
										<li><a href="/user/loginFrm.do">로그인</a></li>
										<li><a href="/user/signupFrm.do">회원가입</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/aladin/searchInAladin.do">관리자</a></li>
										<li><a href="/admin/logout.do">로그아웃</a></li>
									</c:otherwise>
								</c:choose>
								</c:when>
							<c:otherwise>
								<li><a href="/user/mypageFrm.do">마이페이지</a></li>
								<li>
									<!-- <i class="fas fa-clipboard"></i> --> <a href="#">도서 추천</a>
								</li>
								<li><a href="/user/logout.do">로그아웃</a></li>
								<li><a class="chat-bell" onclick="openWindow()"> <!-- <i class="fas fa-bell"></i> -->
										<i class="fas fa-lg fa-bell"></i>
										<div class="cmCount-frame">
											<p class="cmCount"></p>
										</div>
								</a></li>
								<%-- <li>
			                        	<a href="/user/delete.do?userNo=${loginUser.userNo }">Withdrawal</a>
			                        </li> --%>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="search-frame"></div>
            <script>
    	
		var ws;
		var memberId = '${sessionScope.loginUser.userId}';
		var adminId='${sessionScope.loginAdmin.adminId}';
		function connect(){
			ws = new WebSocket("ws://localhost/chat.do");
			ws.onopen = onOpen;
			ws.onmessage = onMessage;
			ws.onclose = onClose;
		}
		function onOpen(){
			console.log("접속 성공");
			if(memberId!=""){
				console.log("유저");
				var msg = {
						type : "register",
						data : memberId
				}
				sendMsg(memberId);
			}
			else{
				console.log("관리자");
				var msg = {
						type : "register",
						data : adminId
				}
				sendMsg(adminId);
			}
			ws.send(JSON.stringify(msg));
			//위의 onOpen을  DmCount의 handleTextMessage 로 보냄
			//sendMsg(memberId);//로그인한 아이디 보냄
		}
		function onMessage(e) {
			//리시버를 데이터에 넣는다
			var receiver=e.data;
			console.log("e데이터"+e.data);
			
			if(receiver=="${sessionScope.loginUser.userId}"){ //로그인 유저랑 리시버랑 비교
				$.ajax({
					url : "/chat/chatReload.do",
					data : {loginUser:"${sessionScope.loginUser.userId}"},
					type : "post",
					success : function(data){
						console.log(data);
						//채팅 css 추가하는것  (리시버일때만)
						$(".chat-messages").append("<div class='message-box-holder'><div class='message-sender'>"+data.cmSender+"</div><div class='message-box message-partner'>"+data.message+"</div></div>");
						$("#chat-messages").scrollTop($("#chat-messages")[0].scrollHeight);
						//$(".cmCount").html(0);
					}
				});
			}else if(receiver=="admin"){
				$.ajax({
					url : "/chat/chatReload.do",
					data : {loginUser:"admin"},
					type : "post",
					success : function(data){
						console.log(data);
						//채팅 css 추가하는것  (리시버일때만)
						$(".chat-messages").append("<div class='message-box-holder'><div class='message-sender'>"+data.cmSender+"</div><div class='message-box message-partner'>"+data.message+"</div></div>");
						$("#chat-messages").scrollTop($("#chat-messages")[0].scrollHeight);
					}
				});
			}
			else{				
				var count = e.data;
				$(".cmCount-frame").css("display","block");
				$(".cmCount").html(count);
			}
		}
		function onClose() {
			console.log("접속 종료");
		}
		function sendMsg(receiver) {
			var msg = {
					type : "count",
					data : receiver
			}
			ws.send(JSON.stringify(msg));
			//receiver=memberId
			// DmCount의 handleTextMessage 로 보냄
		}
		function saveReceiver(receiver){
			//이거는 리시버를 save타입으로 보내서 로그인 유저와 리시버를 체크하는 용도
			var msg = {
					type : "save",
					data : receiver
			}
			ws.send(JSON.stringify(msg));
		}
		$(function() {
			connect();
		});
			
		
		var ret;
		function openWindow(){
			
			if(${loginUser!=null}){
				ret = window.open("/chat/chatRoom.do?chatUser=admin", "PopupWin", "width=420,height=600,top=-100,left=12000,status=0,toolbar=0,scrollbars=0,titlebar=0");	
				
			}else{
				alert("사용자만 접근이 가능합니다!");
			}
			

		}
	</script>
							
</header>
