<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<title>Reservation Form</title>
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
        
        <input type ="text" name='space_id' value="${myList.space_id}" >
        <input type ="text" name='space_price' value="${myList.space_price}" >
      
      <div class="form-group" style="float:left; width:40%; display:inline-block;">
         <h2 class="heading">예약자 개인 정보</h2>
         <div class="controls">
            <input type="text" id="name" class="floatLabel" name="res_name" placeholder="방문하시는 분의 성함을 적어주세요">
            <label for="name">예약자 이름</label>
         </div>
         
         <div class="controls">
            <input type="text" id="email" class="floatLabel" name="res_phone" placeholder="ex) 010-1234-5678">
            <label for="email">예약자 번호</label>
         </div>
         
         <!-- res_date : hidden 값만 넘겨주는 용 -->
         <div class="controls">
            <input type="hidden" id="res_date" name="res_date">
         </div>
         
         <div class="grid">
            <div class="controls">
               <i class="fa fa-sort"></i> 
                <select class="floatLabel" name="res_people">
                  <option value="2 ~ 4 명" selected>2 ~ 4 명</option>
                  <option value="5 ~ 7 명">5 ~ 7 명</option>
                  <option value="8명 이상">8명 이상</option>
               </select> 
               <label for="fruit"><i class="fa fa-male"></i>&nbsp;&nbsp;이용 인원</label>
            </div>
         </div>
         
         <div class="grid">
            <div class="controls">
               <i class="fa fa-sort"></i> 
               <select class="floatLabel" name="res_time">
                  <option value="09:00-15:00" selected>09:00-15:00</option>
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
      <div class="form-group" style="float:right; width:50%; display:inline-block;">
         <h2 class="heading">예약할 날짜 </h2>
         
         
         <%@include file="calendar.jsp"%>
         
      </div>
      
      <div class="button_here" style="float:center; width:100%; display:inline-block; margin-top:30px;">   
         <br>
         <button type="submit"  class="col-1-4 res_form_btn" data-component="button">
         예약하기&nbsp;&nbsp;<i class="far fa-check-circle"></i>
         </button>
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

