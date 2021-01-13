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
<title>Insert title here</title>
<jsp:include page="/views/common/linkHead.jsp" />
<meta charset='utf-8' />
<link href='/lib/calendar/main.css' rel='stylesheet' />
<script src='/lib/calendar/main.js'></script>
<script src='/lib/calendar/locales/ko.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
		//커스텀 버튼
		customButtons: {
		    myCustomButton: {
		      text: 'eventObj',
		      click: function() {
		        window.open("https://fullcalendar.io/docs/event-object");
				}
			}
		},
		headerToolbar: {
        	left: 'prevYear,prev,next,nextYear today myCustomButton',
    	    center: 'title',
			right: 'dayGridMonth,dayGridWeek,dayGridDay,listYear'
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
				if (i == list.size()) {%>
					{
						id : <%=c.getCalendarNo()%>,
				    	title : '<%=c.getCalendarTitle()%>',
				    	start : '<%=c.getCalendarStartDate()%>',
				    	end : '<%=c.getCalendarEndDate()%>'
				    }	
	        	<%} else {%>
		        	{
		        		id : <%=c.getCalendarNo()%>,
				    	title : '<%=c.getCalendarTitle()%>',
				    	start : '<%=c.getCalendarStartDate()%>',
				    	end : '<%=c.getCalendarEndDate()%>'
				    },	
	        	<%}%>
	        <%}%>
	      ],
			//캘린더 날짜 클릭
			dateClick: function(info) {
				//dateStr : 클릭한 td의 날짜를 받아옴
				var date = info.dateStr;
				$('#myModal').modal(); 
				
				$('#insertCalendar').show();
				$('#updateCalendar').hide();
				
				$("#calendarStartDate").val(date);
				$("#calendarEndDate").val(date);				

				$(".modal-title").html('새로운 일정');
			},
 	      //일정 수정
 	      eventClick: function (info) {
 	    	//start -> Mon Jan 11 2021 00:00:00 GMT+0900 형태
 	    	//startStr -> 2021-01-11 형태
 	        
 	        
 	        console.log("title : "+info.event.title);
			console.log("id : "+info.event.id);
			console.log("start : "+info.event.startStr);
			console.log("end : "+info.event.endStr);
			
			
			var title = info.event.title;
			var start = info.event.startStr;
			var end = info.event.endStr;
			
			//info.event.end : 만약 end가 null -> 하루짜리 일정이라면 끝나는 날짜와 시작 날짜를 같게 함
			//info.event.endStr : 만약 길이가 10 미만이라면(형태가 yyyy-mm-dd 형태가 아니라면)
			if(end.length < 10){	
				end = start;
			}
			console.log("end : "+end);
			
			$('#myModal').modal(); 
			$(".modal-title").html('일정 수정');
			$('#updateCalendar').show();
			$('#insertCalendar').hide();
			
			$("#calendarTitle").val(title);
			$("#calendarStartDate").val(start);
			$("#calendarEndDate").val(end);
			
			//updateBtn과 deleteBtn에 해당 event의 id값을 넣어둔다.
			//두개 같은 id가 들어가는데 외우기 쉽게 각각의 버튼에 넣어둠
			$("#deleteBtn").val(info.event.id);
			$("#updateBtn").val(info.event.id);
	      }
	    });
	    calendar.render();
  });
</script>
<style>
#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.fc-day:hover {
	background: #EEF7FF;
	cursor: pointer;
	-webkit-transition: all 0.2s linear;
	-o-transition: all 0.2s linear;
	transition: all 0.2s linear;
}
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />

	<!-- Button to Open the Modal -->
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
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-4" for="calendarTitle">일정명</label> <input
								class="inputModal" type="text" name="calendarTitle"
								id="calendarTitle" required="required" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-4" for="calendarStartDate">시작</label> <input
								class="inputModal" type="date" name="calendarStartDate"
								id="calendarStartDate" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<label class="col-xs-4" for="calendarEndDate">끝</label> <input
								class="inputModal" type="date" name="calendarEndDate"
								id="calendarEndDate" />
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

	<div id='calendar'></div>
	<br>
	<br>
	<br>
	<script>
		function insertCalendar(){
			var title = $("#calendarTitle").val();
			var start = $("#calendarStartDate").val();
			var end = $("#calendarEndDate").val();

			$.ajax({
				url : "/calendar/insertCalendar.do",
				type : "get",
				data : {title:title,
						start:start,
						end:end},
				success:function(data){
					if(data!=null){
						location.reload();
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
		
		function editEvent(info) {
			//console.log(info.event); //x
			
			//console.log(info.event.title);
			//console.log(info.event.id);
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
							alert("일정 삭제 성공");
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
			console.log("############updateCalendar############");
			console.log(calendarNo);
			console.log(title);
			console.log(start);
			console.log(end);
			$.ajax({
				url : "/calendar/updateCalendar.do",
				type : "get",
				data : {calendarNo:calendarNo,
						title:title,
						start:start,
						end:end},
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
	</script>
</body>
</html>
