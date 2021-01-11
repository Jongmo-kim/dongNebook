<%@page import="com.dongnebook.calendar.model.vo.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    	ArrayList<Calendar> list = (ArrayList<Calendar>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset='utf-8' />
<jsp:include page="/views/common/linkHead.jsp" />
<link href='/lib/calendar/main.css' rel='stylesheet' />
<script src='/lib/calendar/main.js'></script>
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
        <%for(int i=0; i<list.size(); i++){
        	Calendar c = list.get(i);
        	if(i==list.size()){%>
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
</style>
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	<h3>일정 조회</h3>
	<hr>
	<div id='calendar'></div>
	<button class="btn btn-primary" onclick="addCalendar();" style="float:right">일정 추가</button>
	<br><br><br>
	<script>
		function addCalendar(){
			//모달창으로 일정을 추가시키기
			
		}
	</script>
</body>
</html>
