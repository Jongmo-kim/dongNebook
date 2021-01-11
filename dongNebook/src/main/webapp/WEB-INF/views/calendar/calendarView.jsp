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
<meta charset='utf-8' />
<jsp:include page="/views/common/linkHead.jsp" />
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
      ]
    });
    calendar.render();
  });

</script>
<style>
#calendar {
	max-width: 1100px;
	margin: 0 auto;
}
.modal-body{
	height: 500px;
}
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />

	<!-- Button to Open the Modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
	  Open modal
	</button>

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
	        
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal" style="border:1px solid #cecece">취소</button>
	        <button type="button" class="btn btn-primary" id="saveEvent">저장</button>
	      </div>
	
	    </div>
	  </div>
	</div>






	<div id='calendar'></div>
	<br>
	<br>
	<br>

</body>
</html>
