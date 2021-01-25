<!-- @author 진수경 -->
<%@page import="com.dongnebook.calendar.model.vo.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ArrayList<Calendar> list = (ArrayList<Calendar>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<title>이달의 도서관</title>
<jsp:include page="/views/common/linkHead.jsp" />
<link type="text/css" rel="stylesheet" href="/css/calendar/calendar.css?v=<%=System.currentTimeMillis()%>">

<meta charset='utf-8' />
<link href='/lib/calendar/main.css' rel='stylesheet' />
<script src='/lib/calendar/main.js'></script>
<script src='/lib/calendar/locales/ko.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
        	left: 'prevYear,prev,next,nextYear today',
    	    center: 'title',
			right: 'dayGridMonth,dayGridWeek,listYear'
    	},
	    locale : "ko",
	    // initialDate: '2020-09-12',
	    navLinks: false, // can click day/week names to navigate views
	    editable: false,
	    dayMaxEvents: true, // allow "more" link when too many events
		events: [
	    	  //일정 불러오기
	        <%for (int i = 0; i < list.size(); i++) {
				Calendar c = list.get(i);
				if (i == list.size()-1) {%>
					{
						id : <%=c.getCalendarNo()%>,
				    	title : '<%=c.getCalendarTitle()%>',
				    	start : '<%=c.getCalendarStartDate()%>',
				    	end : '<%=c.getCalendarEndDate()%>'
				    	
				    	/* background가 null이 아니라면 출력(background가 null이면 나머지도 null이므로 나머지는 검사하지 않음) */
				    	<%if(c.getBackgroundColor()!=null) {%>
					    	,backgroundColor : '<%=c.getBackgroundColor()%>',
					    	textColor : '<%=c.getTextColor()%>',
					    	borderColor : '<%=c.getBorderColor()%>'
				    	<%}%>
				    }	
	        	<%} else {%>
		        	{
		        		id : <%=c.getCalendarNo()%>,
				    	title : '<%=c.getCalendarTitle()%>',
				    	start : '<%=c.getCalendarStartDate()%>',
				    	end : '<%=c.getCalendarEndDate()%>'
				    	
				    	/* background가 null이 아니라면 출력(background가 null이면 나머지도 null이므로 나머지는 검사하지 않음) */
				    	<%if(c.getBackgroundColor()!=null) {%>
					    	,backgroundColor : '<%=c.getBackgroundColor()%>',
					    	textColor : '<%=c.getTextColor()%>',
					    	borderColor : '<%=c.getBorderColor()%>'
				    	<%}%>
				    },	
	        	<%}%>
	        <%}%>
	      ],
			//캘린더 날짜 클릭
			dateClick: function(info) {
				 if('${sessionScope.loginAdmin}'!=""){
					//dateStr : 클릭한 td의 날짜를 받아옴
						var date = info.dateStr;
						$('#myModal').modal(); 
						
						$('#insertCalendar').show();
						$('#updateCalendar').hide();
						
						$("#calendarTitle").val('');
						$("#calendarStartDate").val(date);
						$("#calendarEndDate").val(date);
						//체크되어있던 색깔 초기화
						$("input[name='backgroundColor']").prop("checked", false)
						//색깔 체크 표시 초기화
						$('.fa-check').remove();
						
						$(".modal-title").html('새로운 일정');
				 }
			},
 	      //일정 수정
 	      eventClick: function (info) {
 	    	//info.event.start -> Mon Jan 11 2021 00:00:00 GMT+0900 형태
 	    	//info.event.startStr -> 2021-01-11 형태
 	       	 if('${sessionScope.loginAdmin}'!=""){
 	        	console.log("title : "+info.event.title);
 				console.log("id : "+info.event.id);
 				console.log("start : "+info.event.startStr);
 				console.log("backgroundColor : "+info.event.backgroundColor)
 				console.log("textColor : "+info.event.textColor)
 				
 				var title = info.event.title;
 				var start = info.event.startStr;
 				var end = info.event.endStr;
 				var backgroundColor = info.event.backgroundColor;
 				
 				//info.event.end : 만약 end가 null -> 하루짜리 일정이라면 끝나는 날짜와 시작 날짜를 같게 함
 				//info.event.endStr : 만약 길이가 10 미만이라면(형태가 yyyy-mm-dd 형태가 아니라면)
 				if(end.length < 10){	
 					end = start;
 				}
 				
 				console.log("end : "+info.event.endStr);
 				$('#myModal').modal(); 
 				$(".modal-title").html('일정 수정');
 				$('#updateCalendar').show();
 				$('#insertCalendar').hide();
 				
 				$("#calendarTitle").val(title);
 				
 				//yyyy-MM-dd hh:mm:ss 형태에서 yyyy-mm-dd만 추출
 				var startDate = start.substr(0, 10);
 				var endDate = end.substr(0, 10);
 				
 				//input type date에 시작, 끝 날짜 넣어주기
 				$("#calendarStartDate").val(startDate);
 				$("#calendarEndDate").val(endDate);
 				
 				
 				var bc = $("input[name='backgroundColor']");
 				$('.fa-check').detach();
 				//.check가 포함된 요소를 전부 지운다.(i요소를 지움);
 				//$(".check").detach();
 				
 				bc.each(function(index, item){
 					//색상 radio의 value와 현재 이벤트에 적용된 배경색이 같을 경우
 					if($(item).val()==backgroundColor){
 						//라디오버튼 체크
 						$(item).prop('checked',true);
 						//라벨에 체크 기호 삽입
 						$("input[name='backgroundColor']+label").eq(index).append("<i class='fas fa-check check'></i>");
 					}
 				})
 				
 				//updateBtn과 deleteBtn에 해당 event의 id값을 넣어둔다.
 				//두개 같은 id가 들어가는데 외우기 쉽게 각각의 버튼에 넣어둠
 				$("#deleteBtn").val(info.event.id);
 				$("#updateBtn").val(info.event.id);
 	        }
 	        
	      }
	    });
	    calendar.render();
  });
</script>
<style>
	/* bootstrap이 modal-open에 padding-right를 줘서 !important로 style을 줌 */
.modal-open{
	padding-right: 0px !important;
}
.main-wrap{
	width:1200px;
	margin:0 auto;
}
.adminSideMenu li:nth-child(8) a{
   	background:#a8dba8;
	color:white;
}
#calendar{
	margin:0 auto;
}
.SideMenu li:nth-child(6) a{
background:#a8dba8;
	color:white;
}
.radio-label {
    position: relative;
    width: 30px;
    height: 30px;
    outline: none;
    line-height: 30px;
    border-radius: 50px;
    text-align: center;
    color: white;
    /* border: 2px solid white; */
    box-shadow: 1px 1px 1px rgba(0, 0, 0, .3);
    margin-right: 10px;
    margin-bottom: 0px;
}
svg:not(:root).svg-inline--fa {
    position: absolute;
    top: 7px;
    left: 6px;
    overflow: visible;
    text-align: center;
}
.fa-w-16{
	position:relative !important;
}
.fa-w-14{
	position:relative !important;
	top:0px !important;
}
.notice{
color:gray;
margin-bottom:-5px;
font-weight:100;
}
</style>
</head>


<body>
	<jsp:include page="/views/common/header.jsp" />
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<!-- 모달 Title. -->
					<h4 class="modal-title"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
				 <div class="container">
					<div class="row">
						<div class="col-12">
							<label class="col-4" for="calendarTitle">일정명</label>
							<input class="inputModal col-8" type="text" name="calendarTitle" id="calendarTitle" required="required" />
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<label class="col-4" for="calendarStartDate">일정 시작일</label>
							<input class="inputModal col-8" type="date" name="calendarStartDate" id="calendarStartDate" />
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<label class="col-4" for="calendarEndDate">일정 종료일</label>
							<input class="inputModal col-8" type="date" name="calendarEndDate" id="calendarEndDate" />
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<label class="col-4">일정 색상</label> 
							<!-- 기본색 : #3788d8 -->
							<input type="radio" name="backgroundColor" value="#FF5151" id="red"><label for="red" class="radio-label"></label>
							<input type="radio" name="backgroundColor" value="#F6CD01" id="yellow"><label for="yellow" class="radio-label"></label>
							<input type="radio" name="backgroundColor" value="#8ACB19" id="yellowgreen"><label for="yellowgreen" class="radio-label"></label>
							<input type="radio" name="backgroundColor" value="#79bd9a" id="green"><label for="green" class="radio-label"></label>
							<input type="radio" name="backgroundColor" value=#32C0FD id="blue"><label for="blue" class="radio-label"></label>
							<input type="radio" name="backgroundColor" value="#2A2A93" id="navy"><label for="navy" class="radio-label"></label>
							<input type="radio" name="backgroundColor" value="#CA85F6" id="purple"><label for="purple" class="radio-label"></label>
							<input type="radio" name="backgroundColor" value="#FA5E95" id="pink"><label for="pink" class="radio-label"></label>
						</div>
					</div>
				</div>
 
				<!-- Modal footer -->
				<div class="modal-footer" id="insertCalendar">
					<button type="button" class="btn btn-default" data-dismiss="modal" style="border: 1px solid #cecece">취소</button>
					<button type="button" class="btn btn-primary" onclick="insertCalendar();">저장</button>
				</div>
				<div class="modal-footer" id="updateCalendar">
					<button type="button" class="btn btn-default" data-dismiss="modal" style="border: 1px solid #cecece">취소</button>
					<button type="button" class="btn btn-danger" id="deleteBtn" onclick="deleteCalendar();">삭제</button>
					<button type="button" class="btn btn-primary" id="updateBtn" onclick="updateCalendar();">수정</button>
				</div>
			</div>
			</div>
		</div>
	</div>
	<div class="contents-frame">
	<div class="contents">
	<c:choose>
	<c:when test="${sessionScope.loginAdmin !=null}">
	<jsp:include page="/views/common/adminSide.jsp" />
	</c:when>
	<c:otherwise>
		<jsp:include page="/views/common/userSide.jsp" />
	</c:otherwise>
	</c:choose>
	<div class="admin-contents">
	
	<div id="main-container" class="main-container nav-effect-1">
	<h1 style="font-size:30px;">이달의 도서관</h1>
	<p class="notice">* 일정을 추가하려면 달력 날짜를 클릭하세요.</p>
	<p class="notice">* 일정을 수정하려면 등록되어있는 일정을 클릭하세요.</p>
	<hr>
	<br>
	<div id='calendar'></div>
	<br><br><br>
	</div>
	</div>
	</div>
	</div>
	<script>
		var radio = document.getElementsByName("backgroundColor");
		var label = $("input[name='backgroundColor']+label");
		$(function(){
			label.each(function(idx, item){
				label.eq(idx).css('background-color', radio[idx].value);
			});
		});		
		
		label.click(function(){
			var idx = label.index(this);
			var chk = "<i class='fas fa-check'></i>";
			
			label.each(function(index, item){
				if(index==idx){
					label.eq(idx).append(chk);
				} else {
					$('.fa-check').eq(index).remove();
				}
			})
		});			
		$("#calendarStartDate").change(function(){
			var start = $("#calendarStartDate").val();
			$("#calendarEndDate").val(start);
		});
				
		function insertCalendar(){
			var title = $("#calendarTitle").val();
			var bc = $('input[name="backgroundColor"]:checked').val();
			if(title==""){
				alert("일정명은 필수 항목입니다.");
			} else if((typeof bc == "undefined")){
				alert("일정 색상을 선택하세요.");
			}
			else {
				var start = $("#calendarStartDate").val();
				var end = $("#calendarEndDate").val();

				//날짜를 - 기준으로 나눠서 배열에 넣기
				var startArr = start.split('-');
			    var endArr = end.split('-');
			    
			    //배열로 date 객체 만들기
			    var start_date = new Date(startArr[0], startArr[1], startArr[2]);
		        var end_date = new Date(endArr[0], endArr[1], endArr[2]);
		        
		        //date 객체로 시간 비교
				if(start_date.getTime() > end_date.getTime()){
					alert("종료 날짜는 시작 날짜와 동일하거나 그 이후여야 합니다.");
				}
				else {
					$.ajax({
						url : "/calendar/insertCalendar.do",
						type : "get",
						data : {title:title,
								start:start,
								end:end,
								backgroundColor:bc,
								textColor:'white',
								borderColor:bc},
						success:function(data){
							if(data!=null){
								location.reload();
								alert("일정 등록 성공");
							} else {
								alert("일정 등록 실패");
							}				
						},
						error:function(){
							alert("ajax error");
						}
					});
				$('#myModal').modal('hide'); 	
				}
			}
		}
		
		function deleteCalendar(){
			var result = confirm("해당 일정을 삭제하시겠습니까?");
			if(result){
				var calendarNo = $("#deleteBtn").val();
				
				$.ajax({
					url : "/calendar/deleteCalendar.do",
					type : "get",
					data : {calendarNo : calendarNo},
					success: function(data){
						if(data>0){
							location.reload();	
						} else {
							alert("일정 삭제 실패");
						}
					}, 
					error:function(){
						alert("ajax error");
					}
				});
			}
			$('#myModal').modal('hide'); 
		}
		
		function updateCalendar(){
			var calendarNo = $("#updateBtn").val();
			var title = $("#calendarTitle").val();
			var start = $("#calendarStartDate").val();
			var end = $("#calendarEndDate").val();
			var bc = $('input[name="backgroundColor"]:checked').val();
			//날짜를 - 기준으로 나눠서 배열에 넣기
			var startArr = start.split('-');
		    var endArr = end.split('-');
		    
		    //배열로 date 객체 만들기
		    var start_date = new Date(startArr[0], startArr[1], startArr[2]);
	        var end_date = new Date(endArr[0], endArr[1], endArr[2]);
	        
	        //date 객체로 시간 비교
			if(start_date.getTime() > end_date.getTime()){
				alert("종료 날짜는 시작 날짜와 동일하거나 그 이후여야 합니다.");
			} else{
				$.ajax({
					url : "/calendar/updateCalendar.do",
					type : "get",
					data : {calendarNo:calendarNo,
							title:title,
							start:start,
							end:end,
							backgroundColor:bc,
							textColor:'white',
							borderColor:bc},
					success:function(data){
						if(data>0){
							alert("일정 수정 성공");
							location.reload();	
						} else {
							alert("일정 삭제 실패");
						}
					}, 
					error:function(){
						alert("ajax error");
					}
				});
			$('#myModal').modal('hide'); 
			}
		}
	</script>
</body>
</html>
