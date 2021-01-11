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
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,dayGridWeek,dayGridDay,listYear'
      },
      locale : "ko",
      // initialDate: '2020-09-12',
      navLinks: true, // can click day/week names to navigate views
      editable: false,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        <%for (int i = 0; i < list.size(); i++) {
			Calendar c = list.get(i);
			if (i == list.size()) {%>
				{
			    	title : '<%=c.getCalendarTitle()%>',
			    	start : '<%=c.getCalendarStartDate()%>',
			    	end : '<%=c.getCalendarEndDate()%>'
			    }	
        	<%} else {%>
	        	{
			    	title : '<%=c.getCalendarTitle()%>',
			    	start : '<%=c.getCalendarStartDate()%>',
			    	end : '<%=c.getCalendarEndDate()%>'
			    },	
        	<%}%>
        <%}%>
      ],
      eventClick: function (event, jsEvent, view) {
          editEvent(event);
      }
    });
    calendar.render();
  });
	function editEvent(event, element, view) {
		var data = event.event._def;
		//console.log(event);
		console.log(data.title)
	}
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
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#myModal">Open modal</button>
	<p class="test">test</p>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">일정 추가</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="calendarTitle">일정명</label>
                                <input class="inputModal" type="text" name="calendarTitle" id="calendarTitle" required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="calendarStartDate">시작</label>
                                <input class="inputModal" type="date" name="calendarStartDate" id="calendarStartDate" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="calendarEndDate">끝</label>
                                <input class="inputModal" type="date" name="calendarEndDate" id="calendarEndDate" />
                            </div>
                        </div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="border: 1px solid #cecece">취소</button>
					<button type="button" class="btn btn-primary" onclick="saveCalendar();">저장</button>
				</div>

			</div>
		</div>
	</div>






	<div id='calendar'></div>
	<br>
	<br>
	<br>
	<script>
		function saveCalendar(){
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
						event.push({
							title : data.title,
							start : data.start , 
							end : data.end
						});
					}				
				},
				error:function(){
					alert("일정 등록 실패");
				}
			});
			$('#myModal').modal('hide'); 
		}
	
		$(".test").click(function(){
			$('#myModal').modal(); 
		});
		$(".fc-daygrid-day-frame").click(function(){
			$('#myModal').modal(); 
		});
	</script>
</body>
</html>
