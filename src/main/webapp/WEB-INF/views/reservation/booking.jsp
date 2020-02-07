<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<title>예약하기</title>
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

<body style="margin: 50px auto; width: 80%;">
   <form action="/reservation/booking" method="post" accept-charset="utf-8">
   		<!-- pUserId -->
        <sec:authentication property="principal.username" var="pUserId"/>
        <input type ="hidden" name='userId' value="${pUserId}" >
        
        <!-- space에서 받아온 정보 -->
  		<input type ="hidden" name='space_id' value="${spaceVO.space_id}" >
  		<input type ="hidden" name='space_address' value="${spaceVO.space_address}" >
  		<input type ="hidden" name='res_account' value="${spaceVO .space_account}" >
  		<input type ="hidden" name='res_title' value="${spaceVO .space_title}" >
        
        <c:forEach items="${reservedListBySpace}" var="reservedListBySpace">
           <input type ="hidden" name='resdbResdate' id="resdbResdate" list="depList" >
           <datalist id="depList">
              <option value="${reservedListBySpace.res_date}"></option>
          </datalist>
      </c:forEach>
      
      <div class="form-group" style="float:left; width:40%; display:inline-block;">
         <h2 class="heading">예약자 개인 정보</h2>
         <div class="controls">
            <input type="text" title="예약자 이름" id="name" class="floatLabel" name="res_name" placeholder="방문하시는 분의 성함을 적어주세요">
            <label for="name">예약자 이름</label>
         </div>
         
         <div class="controls">
            <input type="text" title="예약자 번호" id="phone" class="floatLabel" name="res_phone" placeholder="ex) 010-1234-5678">
            <label for="phone">예약자 번호</label>
         </div>
         
         <!-- res_date -->
            <div class="controls">
               <input type="text" title="예약 날짜" id="date" class="floatLabel" name="res_date" placeholder="ex) YYYY-mm-DD" >
               <label for="date">예약 날짜</label>
            </div>
         
         <div class="grid">
            <div class="controls">
               <i class="fa fa-sort"></i> 
                <select class="floatLabel" name="res_people" id="res_people" title="이용 인원">
                  <option value="" selected></option>
                  <option value="2 ~ 4 명">2 ~ 4 명</option>
                  <option value="5 ~ 7 명">5 ~ 7 명</option>
                  <option value="8명 이상">8명 이상</option>
               </select> 
               <label for="fruit"><i class="fa fa-male"></i>&nbsp;&nbsp;이용 인원</label>
            </div>
         </div>
         
         <div class="grid">
            <div class="controls">
               <i class="fa fa-sort"></i> 
               <select class="floatLabel" name="res_time" id="res_time" title="이용 시간">
                  <option value="" selected></option>
                  <option value="09:00-15:00">09:00-15:00</option>
                  <option value="15:00-21:00">15:00-21:00</option>
                  <option value="21:00-03:00">21:00-03:00</option>
                  <option value="종일">종일</option>
               </select> 
               <label for="fruit"><i class="fas fa-clock"></i>&nbsp;&nbsp;이용 시간</label>
            </div>
         </div>
         
         <div class="controls">
            <p class="info-text" style="overflow:scroll; height:280px; text-size:8px;" >
            예약란에 입력하신 이름으로 현장에서 체크인 가능합니다.<br> 입력한 사항을 다시한번 확인해주세요. <br>
            <strong>개인정보 제3자 제공 동의 </strong><br>
            1. 개인정보를 제공받는 자: 해당 공간의 호스트<br>
2. 제공하는 개인정보 항목<br>
- 필수항목: 네이버 아이디, 이름, 연락처, 결제정보(결제방식 및 결제금액)<br>
- 선택항목: 이메일 주소<br>
3. 개인정보의 제공목적: 공간예약 및 이용 서비스 제공, 환불처리<br>
4. 개인정보의 제공기간: 서비스 제공기간(단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 및 사전 동의를 득한 경우에는 해당 기간 동안 보관합니다.)<br>
5. 개인정보의 제공을 거부할 권리: 개인정보 주체는 개인정보의 제공을 거부할 권리가 있으나, 공간 예약을 위해 반드시 필요한 개인정보의 제공으로서 이를 거부할 시 공간 예약이 어려울 수 있습니다.<br>
            <strong>개인정보 수집 및 이용 동의 </strong><br>
            1. 수집하는 개인정보의 항목
- 예약정보(성명, 이메일주소, 휴대전화번호), 결제정보(신용카드 번호 및 은행계좌정보 일부 등)<br>

2. 개인정보의 이용목적<br>
- 공간 예약 및 이용<br>

3. 개인정보의 보관기간<br>
- 예약 완료 후 관련 법령에 따라 5년간 개인정보를 보관합니다.<br>

4. 개인정보의 수집 및 이용을 거부할 권리<br>
- 개인정보 주체는 개인정보의 수집 및 이용을 거부할 권리가 있으나, 공간 예약을 위한 최소한의 개인정보 수집으로서 이를 거부할 시 공간 예약이 어려울 수 있습니다.<br>
            </p>
         </div>
      
      </div>
      
      <!--  res_date -->
      <div class="form-group" style="float:right; width:50%; display:inline-block; position:relative;">
         <h2 class="heading">예약할 날짜 </h2>
         
         <%@include file="calendar.jsp"%>
         
         <hr style="margin:50px 0 20px 0;" >
         <div style="position:absolute; left:0; text-align:left; width:100%;">
            
            <small>
            <i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;
             ${spaceVO.space_title}의  예약 현황입니다!</small><br>
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
      
      <div class="button_here" style="float:center; width:100%; display:inline-block; margin-top:30px;">   
         <br>
         <button type="button"  class="col-1-4 res_form_btn modBtn" data-component="button" onclick="d(event)">
         예약하기&nbsp;&nbsp;<i class="far fa-check-circle"></i>
         </button>
         
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
                  $('.modBtn').attr('type','submit');
               }
               
            }
         </script>
         
         <button type="reset" class="col-1-4 res_form_btn" data-component="button" onclick="history.go(-1);">
         취소하기&nbsp;&nbsp;<i class="far fa-times-circle"></i>
         </button>
      </div>
      
   </form>
   
<script>
(function($){

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
