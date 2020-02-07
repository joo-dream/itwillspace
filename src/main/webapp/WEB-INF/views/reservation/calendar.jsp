<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<c:url value="/resources/js/fullCalendar.js" />"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/fullCalendar.css" >

<script>
var dataset = [
   <c:forEach items="${reservedListBySpace}" var="reservedListBySpace" varStatus="status">
        <c:if test="${reservedListBySpace.res_date != ''}">
            {"id":"<c:out value='${reservedListBySpace.reservationId}' />"
            ,"title":"<c:out value='${reservedListBySpace.res_time}' />"
            ,"start":"<c:out value='${reservedListBySpace.res_date}' />"
                  
            } <c:if test="${!status.last}">,</c:if>
        </c:if>
    </c:forEach>
];
$(document).ready(function() {
   console.log(dataset);
   var date = new Date();
   var d = date.getDate();
   var m = date.getMonth();
   var y = date.getFullYear();


   
   $('#calendar').fullCalendar({
      header: {
           left: 'title',
           center: 'agendaDay,agendaWeek,month',
           right: 'prev,next today'
        },

        events : dataset,

        eventClick: function(day, event) {

         if(event.id != '' || event.id != null){
             alert('Event: ' + event.title);
         } else {
            alert('예약된 이벤트가 없습니다.');
         }
           

            //$(this).css('border-color', 'red');

          },
      
        
   });

});

</script>
<style>

   body {
       margin-bottom: 40px;
      margin-top: 40px;
      text-align: center;
      font-size: 14px;
      font-family: 'Roboto', sans-serif;
      background:url(http://www.digiphotohub.com/wp-content/uploads/2015/09/bigstock-Abstract-Blurred-Background-Of-92820527.jpg);
      }
      
   #wrap {
      max-width: 600px;
      margin: 0 auto;
      }
      
   #external-events {
      float: left;
      width: 150px;
      padding: 0 10px;
      text-align: left;
      }
      
   #external-events h4 {
      font-size: 16px;
      margin-top: 0;
      padding-top: 1em;
      }
      
   .external-event { /* try to mimick the look of a real event */
      margin: 10px 0;
      padding: 2px 4px;
      background: #3366CC;
      color: #fff;
      font-size: .85em;
      cursor: pointer;
      }
      
   #external-events p {
      margin: 1.5em 0;
      font-size: 11px;
      color: #666;
      }
      
   #external-events p input {
      margin: 0;
      vertical-align: middle;
      }

   #calendar {
/*       float: right; */
        margin: 20px auto;
      width: 500px;
      background-color: #FFFFFF;
        border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
      -webkit-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.05);
-moz-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.05);
box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.05);
      }

</style>
</head>
<body>
<div id='wrap'>

<div id='calendar'></div>

<div style='clear:both'></div>
</div>
</body>
</html>