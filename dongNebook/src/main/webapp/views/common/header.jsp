<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.fa-clipboard, .fa-bell {
	cursor: pointer;
}
.svg-inline--fa {
    display: inline-block;
    font-size: inherit;
    height: 1em;
    margin-right: 14px;
    /* padding-right: 10px; */
    overflow: visible;
    float: right;
    }
    .chat-partner-name{
    	padding:0px !important;
    }
    .plane{
    	width: 100% !important;
    margin: 0px !important;
    color: #30649c !important;
    }
    .planeBtn{
    	border: 0px;
    width: 41px;
    }
    .hideChat{
    	width:12px;
    	float:right;
    }
</style>
<header>

	<div class="header">
		<div class="menu-frame">
			<div>
				<div class="main-img">
					<a href="/"> <img src="../image/header/finalLogo.png">
					</a>
				</div>
				<div class="main-menu">
					<ul class="menu-list">
						<li><a href="/book/searchBookFrm.do">도서대출</a></li>
						<li><a href="/rank/rankList.do?reqPage=1">대출 순위</a></li>
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
												<li>
									 <a data-target="#reviewModal" data-toggle="modal" href="#" >도서 추천</a>
								</li>
									</c:when>
									<c:otherwise>
										<li><a href="/aladin/searchInAladin.do">관리자</a></li>
										<li><a href="/admin/logout.do">로그아웃</a></li>
									</c:otherwise>
								</c:choose>
								</c:when>
							<c:otherwise>
								<li style="padding: 0px"><a href="/user/mypageFrm.do">마이페이지</a></li>
								<li>
									 <a data-target="#reviewModal" data-toggle="modal" href="#" >도서 추천</a>
								</li>
								<li><a href="/user/logout.do">로그아웃</a></li>
								<li><a class="chat-bell"> <!-- <i class="fas fa-bell"></i> -->
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
		<div class="chatbox" id="chatBox">
  
    <div class="chatbox-top">
      <div class="chat-partner-name">
        <span class="statusChat online"></span>
        <a target="_blank" href="https://www.facebook.com/mfreak" id="receiver"></a>
        
        <div class="hideChat"><i class="fas fa-times"></i></div>
      </div>     
    </div>
    
     <div class="chat-messages" id="chat-messages">
    </div>
	    <div class="chat-input-holder">
	    <c:if test="${sessionScope.loginUser!=null }">
	   			 <input type="hidden" id="cmSender" name="cmSender" value="${sessionScope.loginUser.userId}">
		    	<input type="hidden" id="cmReceiver" name="cmReceiver" value="admin">
		      <input type="text" class="chat-input" id="chat-input" name="message" onkeypress="insertCm('${sessionScope.loginUser.userId}')">
		      <button class="planeBtn" onclick="insertCm('${sessionScope.loginUser.userId}')"><i class="fas fa-paper-plane plane"></i></button>
		   
	      </c:if>
	      <c:if test="${sessionScope.loginAdmin!=null }">
	      		<input type="hidden" id="cmSender" name="cmSender" value="admin">
	      		<input type="hidden" id="cmReceiver" name="cmReceiver" >
		      <input type="text" class="chat-input" id="chat-input" name="message" onkeypress="insertCm('${sessionScope.loginAdmin.adminId}')">
		      <button class="planeBtn" onclick="insertCm('${sessionScope.loginAdmin.adminId}')"><i class="fas fa-paper-plane plane"></i></button>
	      </c:if>
	    </div>
	    
	    
	    
  </div>
	</div>
	<div class="search-frame"></div>
	
    <script>
            
            function reloadChat(){
            	var chatRoom=$("#cmReceiver").val();
            	$(".chat-messages").html("");
            	$(".chat-input").html("");
            	$("#receiver").html(chatRoom);
            	document.getElementById("chat-input").value="";
            	
        		$.ajax({
        			url : "/chat/chatRoom.do",
        			data : {chatUser:chatRoom},
        			type : "post",
        			success : function(data){
        				var tag="";
        				var id=data.login;
        				var receiver;
        				
        				for(var i=0 ; i<data.list.length;i++){
        					if(data.list[i].cmSender==id){
        						
        						tag+="<div class='message-box-holder'><div class='message-box'>"+data.list[i].message+"</div></div>";
        						receiver=data.list[i].cmReceiver;
        					}else{
        						tag+="<div class='message-box-holder'><div class='message-sender'>"+data.list[i].cmSender+"</div><div class='message-box message-partner'>"+data.list[i].message+"</div></div>";
        					}
        				}
        				$(".chat-messages").append(tag);
        				//$("#cmReceiver").val(receiver);
        				
		        		$("#chat-messages").scrollTop($("#chat-messages")[0].scrollHeight);
        			}
        		}); 
        	};
           $(document).ready(function(){
        	   $(".chat-messages").html("");
        	   
            	//reloadChat();
        		//$(".chatbox").hide();
        		//스크롤 맨 아래로
        		//window.opener.location.reload();
        		//세션 조건 체크 하나 만들고
        		//관리자 有 -> chatRoom.do else 수정
        		//여기서 뿌려주고 onclick에 내부값 수정
        		//혹시 어렵다면 인풋값 세션에 따라서 따로 보여주게
        		//함수 다 열어서 되면 ㅇㅋ
        	});
           $(function(){
 	  		  $('.chat-bell').click(function(){    
 	  			  
 	  			reloadChat();
 	  			  $(".chatbox").show();
 	  			$(".chatbox").css("display","flex");
 	  			$("#chat-messages").scrollTop($("#chat-messages")[0].scrollHeight);
 	  			$(".cmCount-frame").css("display","none");
 	  		  });
 	  		$('.hideChat').click(function(){
 	  			$(".cmCount-frame").css("display","none");
 				  $(".chatbox").hide();
 	  			$.ajax({
        			url : "/chat/readCm.do",
        			data : {cmSender:$("#cmReceiver").val(),cmReceiver:$("#cmSender").val()},
        			type : "post",
        			success : function(data){
        				
        			}
        		});
 			  });
 	  		$('.chatAdminRoom').click(function(){

 	  				$("#cmReceiver").val($(this).val());
 	  				reloadChat();
 	  				$(".chatbox").show();
 	  				$(".chatbox").css("display","flex");
 		  			$("#chat-messages").scrollTop($("#chat-messages")[0].scrollHeight);
 	  		});
   		});
        	
        	function insertCm(cmSender){
        	if ( window.event.keyCode == 13||window.event.type=="click" ) {
        		var cmReceiver = $("[name=cmReceiver]").val();
        		
        		var message = $("[name = message]").val();
        		
        		$.ajax({
        			url : "/chat/cmAdminInsert.do",
        			data : {cmReceiver:cmReceiver, cmSender:cmSender, message:message},
        			type : "post",
        			success : function(data){
        				if(data == 1){
        					
        					//alert("쪽지보내기 성공");
        					//onOpen();
        					sendMsg(cmSender);
        					saveReceiver(cmReceiver);
        					//cntAdmin(cmSender)
        					//샌드메세지에 받은 사람아이디를 줘서 주회함
        					reloadChat();
        				}else{
        					alert("쪽지보내기 실패");
        				}
        			}
        		});
        	}
        	}
        	
	
	var ws;
	var memberId = '${sessionScope.loginUser.userId}';
	var adminId='${sessionScope.loginAdmin.adminId}';
	function connect(){
		ws = new WebSocket("ws://khdsa1.iptime.org:18080/chat.do");
		ws.onopen = onOpen;
		ws.onmessage = onMessage;
		ws.onclose = onClose;
	}
	function onOpen(){
		
		if(memberId!=""){
						var msg = {
					type : "register",
					data : memberId
			}
			sendMsg(memberId);
		}
		else{
			
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
		
		
		if(receiver=="${sessionScope.loginUser.userId}"){ //로그인 유저랑 리시버랑 비교
			$.ajax({
				url : "/chat/chatReload.do",
				data : {loginUser:"${sessionScope.loginUser.userId}"},
				type : "post",
				success : function(data){
					
					//채팅 css 추가하는것  (리시버일때만)
					//$(".cmCount-frame").css("display","none");
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
										//채팅 css 추가하는것  (리시버일때만)
					//$(".cmCount-frame").css("display","none");
					
					$(".chat-messages").append("<div class='message-box-holder'><div class='message-sender'>"+data.cmSender+"</div><div class='message-box message-partner'>"+data.message+"</div></div>");
					$("#chat-messages").scrollTop($("#chat-messages")[0].scrollHeight);
					if($('#chatBox').is(":visible")){
						$(".cmCount-frame").css("display","none");
					}
				}
			});
		}
		else{				
			var count = e.data;
			$(".cmCount").html(count);
			if($('#chatBox').is(":visible")){
				$(".cmCount-frame").css("display","none");
			}else{
				
				$(".cmCount-frame").css("display","block");
			}
				
			
		}
	}
	function onClose() {
		console.log("접속 종료");
	}
	function sendMsg(receiver) {
		//console.log("응??"+${loginAdmin})
		console.log("리시버"+receiver);
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
	//관리자용 카운트
	
	$(function() {
		connect();
	});
		
	
	/*var ret;
	function openWindow(){
		
		if(${loginUser!=null}){
			ret = window.open("/chat/chatRoom.do?chatUser=admin", "PopupWin", "width=420,height=600,top=-100,left=12000,status=0,toolbar=0,scrollbars=0,titlebar=0");	
			
		}else{
			alert("사용자만 접근이 가능합니다!");
		}
		

	}*/
	</script>
							
</header>
