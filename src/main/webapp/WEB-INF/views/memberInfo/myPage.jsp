<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html lang="en">

<head>
   <link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/card.css">   
   <script src="<c:url value="/resources/js/card.js" />"></script>
   <script src="https://kit.fontawesome.com/aeb2899479.js" crossorigin="anonymous"></script>   
   <%@include file="../nav.jsp"%>  
</head> 

<body style="margin:50px auto;">

<div class="container-fluid" style="width:75%; margin-bottom:5%;">
   <h1 class="h2 mb-2 text-gray-800">My Page</h1>
   <br>
	
	 <!-- Member Login 정보 -->	
	<div class="media border p-3">
  		<img src="/resources/image/default.png" id = "profileImg" class="m-3 rounded-circle" style="width:250px;height:250px ">
  		<div class="media-body ml-5">
  			<br>
    		<h3 class = " ml-4 media-title"> ${member.userId}</h3>
    		<table class="mt-3">
    			<tr>
    				<td align="center">이름</td>
    				<td>&nbsp;:&nbsp;&nbsp;</td>
    				<td>${member.userName}</td>
    			</tr>
     			<tr>     			
    				<td align="center">전화번호</td>
    				<td>&nbsp;:&nbsp;&nbsp;</td>    				
    				<td id="td-Phone"></td>
    			</tr>
    			<c:set var="email" value="${member.email}"/>
    			<c:if test="${email != '' }">			
	    			<tr>
	    				<td align="center">이메일</td>
	    				<td>&nbsp;:&nbsp;&nbsp;</td>
					    <td>${member.email}</td>
	    			</tr>
    			</c:if>  
     			<tr>
    				<td align="center">회원구분</td>
    				<td>&nbsp;:&nbsp;&nbsp;</td>
    				<c:set var="role" value="${member.auth}"/> 
    				<c:choose>
    				<c:when test="${role =='ROLE_MEMBER'}">
    					<td>개인 회원</td>
    				</c:when>
    				<c:when test="${role =='ROLE_HOST'}">
    					<td>사업자 회원</td>
    				</c:when>
    				</c:choose>
    			</tr>
     			<tr>
    				<td align="center">가입일</td>
    				<td>&nbsp;:&nbsp;&nbsp;</td>
    				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}" /></td>
    			</tr> 	   			     						    			   			
    		</table>
    		<div><a href="/member/modify?userId=${member.userId}" class="mb-3 btn btn-primary offset-md-9">회원 정보 수정</a></div>
    		<div><a href="/member/changePw?userId=${member.userId}" class="btn btn-danger offset-md-9">비밀 번호 변경</a></div>
  		</div>
	</div>			        		
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body" style="text-align: center;"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>
			</div>
		</div>
	</div>
</div>
<!-- End of memberInfo -->

<!-- 예약리스트 -->
<div class="resListBox">
   <h1 class="text-gray-800">내 예약 현황</h1>
   
   <!-- 페이지번호가 보이는 부분 -->	
	<div>
		<ul class='pagination justify-content-center'>
				<c:if test="${prev }">
			<li class='page-item'>
					<span><a class='page-link' href="/memberInfo/myPage?num=${startPageNum-1}">이전</a></span>
			</li>
				</c:if>

			<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
				<li class='page-item ${select == num ? "active":""}'>
					<a class='page-link' href="/memberInfo/myPage?num=${num}">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${next }">
				<li class='page-item'>
				<span><a class='page-link' href="/memberInfo/myPage?num=${endPageNum+1}">다음</a></span>
				</li>
			</c:if>
		</ul>
	</div>

   <c:forEach items="${reservedList}" var="reservedList">
   <div class="card card--big">
     <div class="card__image" >
        <img class="card__image" src="/resources/image/img_4.jpg" >
     </div>
     <h2 class="card__title">${reservedList.res_title}</h2><span class="card__subtitle">${reservedList.res_time}</span>
     <p class="card__text">
          &nbsp;&nbsp;&nbsp;<i class="fas fa-calendar-check"></i>&nbsp;&nbsp;&nbsp;&nbsp;예약 날짜  &nbsp;|&nbsp; ${reservedList.res_date} <br>
          &nbsp;&nbsp;&nbsp;<i class="fas fa-clock"></i>&nbsp;&nbsp;&nbsp;&nbsp;예약 시간&nbsp;|&nbsp; ${reservedList.res_time}<br>
          &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-male"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약 인원  &nbsp;|&nbsp; ${reservedList.res_people}<br>
          &nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-dollar-sign"></i>&nbsp;&nbsp;&nbsp;&nbsp;이용 금액  &nbsp;|&nbsp; ${reservedList.res_price}<br>
     </p>
     <div class="card__action-bar">
       <button class="card__button"  onclick="location.href='/reservation/modify?reservationId=${reservedList.reservationId}' ">예약 수정</button>
       <button class="card__button deleteBtn" onclick="location.href='/reservation/delete?reservationId=${reservedList.reservationId}' ">예약 취소</button>
     </div>
   </div>
   </c:forEach>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		if(result == null || result =='')
			return;
		$("#myModal").modal();
		if(result == "modified")
			$(".modal-body").text("정보가 수정되었습니다.")
		else if(result == "changed")
			$(".modal-body").text("비밀번호가 변경되었습니다.")
	});	
</script>

<script>
$(document).ready(function(){
  
  (function(){
  
    var userId = '<c:out value="${member.userId}"/>';
    var phone = '<c:out value="${member.phone}"/>'; 
    $("#td-Phone").text( phone.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") );
    $.getJSON("/member/getAttachList", {userId: userId}, function(arr){        
       console.log(arr);
       var uploadImg = $("#profileImg");
       
       $(arr).each(function(i, attach){       
		    var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
		    console.log(fileCallPath);
		    uploadImg.attr('src', "/display?fileName=" + fileCallPath);
       });              
     });//end getjson
    
  })();//end function
});
</script>  

<!-- 예약리스트 function -->
<script>

(function() {
     $(".controller").click(function() {
       id = $(this).attr("id");

       $(".controller-container")
         .find(".is_current")
         .removeClass("is_current");
       $(this).addClass("is_current");
       $(".card").attr("class", "card card--" + id);
       $("html").attr("class", "bg--" + id);
     });
   })();

   // Ripple function
   (function() {
     "use strict";

     var colour = "#FF1744";
     var opacity = 0.1;
     var ripple_within_elements = ["input", "button", "a"];
     var ripple_without_diameter = 0;

     var overlays = {
       items: [],
       get: function() {
         var $element;
         for (var i = 0; i < overlays.items.length; i++) {
           $element = overlays.items[i];
           if ($element.transition_phase === false) {
             $element.transition_phase = 0;
             return $element;
           }
         }
         $element = document.createElement("div");
         $element.style.position = "absolute";
         $element.style.opacity = opacity;
         //$element.style.outline = "10px solid red";
         $element.style.pointerEvents = "none";
         $element.style.background =
           "-webkit-radial-gradient(" +
           colour +
           " 64%, rgba(0,0,0,0) 65%) no-repeat";
         $element.style.background =
           "radial-gradient(" + colour + " 64%, rgba(0,0,0,0) 65%) no-repeat";
         $element.style.transform = "translateZ(0)";
         $element.transition_phase = 0;
         $element.rid = overlays.items.length;
         $element.next_transition = overlays.next_transition_generator($element);
         document.body.appendChild($element);
         overlays.items.push($element);
         return $element;
       },
       next_transition_generator: function($element) {
         return function() {
           $element.transition_phase++;
           switch ($element.transition_phase) {
             case 1:
               $element.style[transition] =
                 "all 500ms cubic-bezier(0.165, 0.840, 0.440, 1.000)";
               $element.style.backgroundSize = $element.ripple_backgroundSize;
               $element.style.backgroundPosition =
                 $element.ripple_backgroundPosition;
               setTimeout($element.next_transition, 0.2 * 1000); //now I know transitionend is better but it fires multiple times when multiple properties are animated, so this is simpler code and (imo) worth tiny delays
               break;
             case 2:
               $element.style[transition] = "opacity 0.15s ease-in-out";
               $element.style.opacity = 0;
               setTimeout($element.next_transition, 0.15 * 1000);
               break;
             case 3:
               overlays.recycle($element);
               break;
           }
         };
       },
       recycle: function($element) {
         $element.style.display = "none";
         $element.style[transition] = "none";
         if ($element.timer) clearTimeout($element.timer);
         $element.transition_phase = false;
       }
     };

     var transition = (function() {
       var i,
         el = document.createElement("div"),
         transitions = {
           WebkitTransition: "webkitTransition",
           transition: "transition",
           OTransition: "otransition",
           MozTransition: "transition"
         };
       for (i in transitions) {
         if (transitions.hasOwnProperty(i) && el.style[i] !== undefined) {
           return transitions[i];
         }
       }
     })();

     var click = function(event) {
       var $element = overlays.get(),
         touch,
         x,
         y;

       touch = event.touches ? event.touches[0] : event;

       $element.style[transition] = "none";
       $element.style.backgroundSize = "3px 3px";
       $element.style.opacity = opacity;
       if (
         ripple_within_elements.indexOf(touch.target.nodeName.toLowerCase()) > -1
       ) {
         x = touch.offsetX;
         y = touch.offsetY;

         var dimensions = touch.target.getBoundingClientRect();
         if (!x || !y) {
           x = (touch.clientX || touch.x) - dimensions.left;
           y = (touch.clientY || touch.y) - dimensions.top;
         }
         $element.style.backgroundPosition = x + "px " + y + "px";
         $element.style.width = dimensions.width + "px";
         $element.style.height = dimensions.height + "px";
         $element.style.left = dimensions.left + "px";
         $element.style.top =
           dimensions.top +
           document.body.scrollTop +
           document.documentElement.scrollTop +
           "px";
         var computed_style = window.getComputedStyle(event.target);
         for (var key in computed_style) {
           if (key.toString().indexOf("adius") > -1) {
             if (computed_style[key]) {
               $element.style[key] = computed_style[key];
             }
           } else if (
             parseInt(key, 10).toString() === key &&
             computed_style[key].indexOf("adius") > -1
           ) {
             $element.style[computed_style[key]] =
               computed_style[computed_style[key]];
           }
         }
         $element.style.backgroundPosition = x + "px " + y + "px";
         $element.ripple_backgroundPosition =
           x - dimensions.width + "px " + (y - dimensions.width) + "px";
         $element.ripple_backgroundSize =
           dimensions.width * 2 + "px " + dimensions.width * 2 + "px";
       } else {
         //click was outside of ripple element
         x = touch.clientX || touch.x || touch.pageX;
         y = touch.clientY || touch.y || touch.pageY;

         $element.style.borderRadius = "0px";
         $element.style.left = x - ripple_without_diameter / 2 + "px";
         $element.style.top =
           document.body.scrollTop +
           document.documentElement.scrollTop +
           y -
           ripple_without_diameter / 2 +
           "px";
         $element.ripple_backgroundSize =
           ripple_without_diameter + "px " + ripple_without_diameter + "px";
         $element.style.width = ripple_without_diameter + "px";
         $element.style.height = ripple_without_diameter + "px";
         $element.style.backgroundPosition = "center center";
         $element.ripple_backgroundPosition = "center center";
         $element.ripple_backgroundSize =
           ripple_without_diameter + "px " + ripple_without_diameter + "px";
       }
       $element.ripple_x = x;
       $element.ripple_y = y;
       $element.style.display = "block";
       setTimeout($element.next_transition, 20);
     };

     if ("ontouchstart" in window || "onmsgesturechange" in window) {
       document.addEventListener("touchstart", click, false);
     } else {
       document.addEventListener("click", click, false);
     }
   })();
</script>
			
</body>
</html>