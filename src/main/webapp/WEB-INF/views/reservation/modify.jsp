<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="../includes/header.jsp"%>  
</head>  

<body>
<form action="/reservation/modify" method="post">
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">예약 정보 수정</h1>
	  <!-- pUserId -->
  <sec:authentication property="principal.username" var="pUserId"/>
  <input type ="hidden" name='userId' value="${pUserId}" >
  
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">예약자</span>
      </div>
      <input type="text" class="form-control col-sm-3" name="res_name" value="${view.res_name}" >
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">연락처</span>
      </div>
      <input type="text" class="form-control col-sm-3" placeholder="ex) 010-1234-5678" name="res_phone"
       value="${view.res_phone}">
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">예약날짜</span>
      </div>
      <input type="text" class="form-control col-sm-3" placeholder="2020-00-00" name="res_date"
      	value="${view.res_date}">
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">이용시간</span>
      </div>      
       <input type="text" class="form-control col-sm-3" name="res_time"
      	value="${view.res_time}">           
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">이용인원</span>
      </div>
      <input type="text" class="form-control col-sm-3" name="res_people"
      	value="${view.res_people}">      
    </div>
		
	<input type ="hidden" name='reservationId' value="${view.reservationId}" >	
		
	<div class="form-group" align="left">
  		<div class="col-sm-8 ">				
	          <button type="submit" data-oper='modify' class="btn btn-primary btn-user btn-sm">정보 수정</button>
	    	  <button data-oper='delete' class="btn btn-danger btn-user btn-sm">예약 취소하기</button>
	  			<a href="/reservation/delete?reservationId=${view.reservationId}">예약 취소</a>
	    </div>
	</div> 
</div>	       
</form>	

<script>

$(document).ready(function(e){
	$(function(){
		//전화번호에 "-" 자동 추가	
		$("input[name='phone']").keyup(function(){ 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") );
		});	
		
		$("input[name='phone']").change(function(){ 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") );
		});					
	});	 
	

</script>	
<script type="text/javascript">
   function removeMember()
   {
	   $('#myModal').modal('hide');
	   var formObj = $("form[role='form']");
	   formObj.attr("action", "/member/remove");
	   formObj.submit();
   }	 
</script>

</body>    
</html>
 
