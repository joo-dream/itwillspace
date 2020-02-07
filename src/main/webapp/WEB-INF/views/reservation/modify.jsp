<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 정보 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/book_form.css" >
   
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400" rel="stylesheet">   

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   
<script src="https://kit.fontawesome.com/aeb2899479.js" crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/moment.js" />"></script>
</head>

<%--
<header>
 <%@include file="../nav.jsp"%>
</header>
--%>

<body style="width: 100%;">

   <form class="modifyForm" action="/reservation/modify" method="POST">      
         <h2 align="left" style="color:grey">예약 정보 수정</h2> 
      <!-- pUserId -->
        <sec:authentication property="principal.username" var="pUserId"/>
        <input type ="hidden" name='userId' value="${pUserId}" >
        
        <input type ="hidden" name='space_id' value="${view.space_id}" >
        <input type ="hidden" name='reservationId' value="${view.reservationId}" >
      
      <div class="form-group" style="float:left; width:40%; display:inline-block;">
         <h2 class="heading">예약 정보</h2>
         <div class="controls">
            <input type="text" title="예약자 이름" id="name" class="floatLabel" name="res_name" 
            value="${view.res_name}" >
            <label for="name" class="modify">예약자 이름</label>
         </div>
         
         <div class="controls">
            <input type="text" title="예약자 번호" id="phone" class="floatLabel" name="res_phone" 
            value="${view.res_phone}" >
            <label for="phone" class="modify">예약자 번호</label>
         </div>
         
         <!-- res_date -->
            <div class="controls">
               <input type="text" title="예약 날짜" id="date" class="floatLabel" name="res_date" 
               value="${view.res_date}" >
               <label for="date" class="modify">예약 날짜</label>
            </div>
         
         <div class="grid">
            <div class="controls">
               <i class="fa fa-sort"></i> 
                <select class="floatLabel" name="res_people" id="res_people" title="이용 인원">                  
                  <option value="2 ~ 4 명">2 ~ 4 명</option>
                  <option value="5 ~ 7 명">5 ~ 7 명</option>
                  <option value="8명 이상">8명 이상</option>
               </select> 
               <label for="fruit" class="modify"><i class="fa fa-male"></i>&nbsp;&nbsp;이용 인원</label>
            </div>
         </div>
         
         <div class="grid">
            <div class="controls">
               <i class="fa fa-sort"></i> 
               <select class="floatLabel" name="res_time" id="res_time" title="이용 시간">                   
                  <option value="09:00-15:00">09:00-15:00</option>
                  <option value="15:00-21:00">15:00-21:00</option>
                  <option value="21:00-03:00">21:00-03:00</option>
                  <option value="종일">종일</option>
               </select> 
               <label for="fruit" class="modify"><i class="fas fa-clock"></i>&nbsp;&nbsp;이용 시간</label>
            </div>
         </div> 
         
         <hr style="margin:20px 0;" >
         <div style="position:absolute; text-align:left;">
            <small>
            <i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;
                예약하신 정보 입니다! &nbsp; 신중하게 예약 정보를 수정해주세요!</small><br>
            <small>
            <i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;
                달력을 보고 날짜를 직접 기입해주세요! </small><br>
            <small>
            <i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;
                입력하실때, 반드시 형식을 맞춰주시기 바랍니다! </small><br>
            <small>
            <i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;
                기입하지 않은 사항이 있을 시, 예약이 불가합니다! </small>
         </div>         
      </div>
              
      
      <!--  res_date -->      
      <div class="form-group" style="float:right; width:50%; display:inline-block; position:relative;">
         <h2 class="heading">예약할 날짜 </h2>
         
        <%@include file="calendar.jsp"%>
        
    
      
      <div class="button_here" style="float:left; width:100%; display:inline-block; margin-top:12%; margin-left:-58%;">   
         
         <button type="button"  class="col-1-4 res_form_btn subBtn" data-component="button" onclick="d(event)">
         수정하기&nbsp;&nbsp;<i class="far fa-check-circle"></i>
         </button>      
         
         <button type="reset" class="col-1-4 res_form_btn" data-component="button" onclick="history.go(-1);">
         취소하기&nbsp;&nbsp;<i class="far fa-times-circle"></i>
         </button>
      </div>
     </div> 
</form>     
      
      <script>         
         
            // 유효성 _ date 확인('YYYY-MM-DD', 유효한 날짜, 이미 예약된 날짜)
            function d(e){
               
               var list = new Array(); 
               <c:forEach items="${reservedListBySpace}" var="reservedListBySpace">
                  list.push("${reservedListBySpace.res_date}");
               </c:forEach>
               console.log(list);

               var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 

               var today = new Date();
               var dd = today.getDate();
               var mm = today.getMonth()+1; // 0월부터 시작함
               var yyyy = today.getFullYear();

               var outyyyy = $('#date').val().substring(0,4);
               var outmm = $('#date').val().substring(5,7);
               var outdd = $('#date').val().substring(8,10);
               console.log(outyyyy+"/"+outmm+"/"+outdd);

               var dbdate = $('#resdbResdate#depList').attr('value');
               
               if(!date_pattern .test($('#date').val())){
                  alert('예약 날짜를 알맞은 형식으로 입력해주세요!!');
                  $('#date').focus();
                  $('#date').val('');
               } else if(list.includes($('#date').val()) == true){
                  alert("이미 예약된 날입니다! 다른 날을 입력해주세요");
                  $('#date').focus();
                  $('#date').val('');
               } else if((outyyyy < yyyy) || (outyyyy>= yyyy && outmm<mm) || (outyyyy>=yyyy && outmm>= mm && outdd<dd)){
                  alert("유효하지 않은 날짜를 입력하셨습니다! 다시 입력해주세요");
                  $('#date').focus();
                  $('#date').val('');
               } else if((outmm==4&&outdd>30)||(outmm==6&&outdd>30)||(outmm==9&&outdd>30)||(outmm==11&&outdd>30)){
                  alert("유효하지 않은 날짜를 입력하셨습니다! 다시 입력해주세요");
                  $('#date').focus();
                  $('#date').val('');
               }else if($('#name').val()=="" || $('#name').val()==null){
                  alert($('#name').attr("title") + "을 입력해주세요");
               }else if($('#phone').val()=="" || $('#phone').val()==null){
                  alert($('#phone').attr("title") + "를 입력해주세요");
               }else if($('#date').val()=="" || $('#date').val()==null){
                  alert($('#date').attr("title") + "를 입력해주세요");
               }else if($('#res_people').val()=="" || $('#res_people').val()==null){
                  alert($('#res_people').attr("title") + "를 입력해주세요");
               }else if($('#res_time').val()=="" || $('#res_time').val()==null){
                  alert($('#res_time').attr("title") + "를 입력해주세요");
               }else {
                  alert("submit"); 
                 $('.subBtn').attr("type", "submit");                               
                 //$('.modifyForm').attr("action", "/reservation/modify");
                // $('.modifyForm').attr("method","post");  
                // $('.modifyForm').submit();                  
               }
               
            } 
            
         </script>

   
<script>
(function($){
   //res_people selected option 
    $('select[id="res_people"]').find('option:contains("${view.res_people}")').attr("selected",true);
   //res_time selected option 
    $('select[id="res_time"]').find('option:contains("${view.res_time}")').attr("selected",true); 
    
   function floatLabel(inputType){
      $(inputType).each(function(){
         var $this = $(this);
         // on focus add cladd active to label
         $this.focus(function(){
            $this.next().addClass("active");
         });
         //on blur check field and remove class if needed
         $this.blur(function(){
            if($this.val() === '' || $this.val() === 'blank'){
               $this.next().removeClass();
            }
         });
      });
   }
   // just add a class of "floatLabel to the input field!"
   floatLabel(".floatLabel");
   
})(jQuery);
</script>   
</body>
</html>