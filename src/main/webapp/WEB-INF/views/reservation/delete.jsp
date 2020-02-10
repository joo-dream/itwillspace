<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 취소페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/aeb2899479.js" crossorigin="anonymous"></script>
<script src="<c:url value="/resources/js/moment.js" />"></script>
</head>
<style>
    body {
        margin:50px auto;
        overflow-x: hidden;
        
    }
    .res_alert {
        margin:0 auto;
       
        
    }
    .res_alert i {
        font-size: 200px;
        color:rgba(27, 57, 99, 0.95);
        position:relative;
        left:45%;
    }
    .res_alert h1 {
        left:40%;
        position:relative;
    }
    .res_warn {
        width:80%;
        height: inherit;
        position: relative;
        margin: 0 auto;
    
        border-radius: 10px;
    }
    .res_warn p {
        margin: 20px;
    }
    .res_warn p:nth-child(1) {
        padding-top: 50px;
    }
    .res_warn > div{
        width:90%;
        height: inherit;
        position: relative;
        margin: 0 auto;
        background-color: aliceblue;
        border-radius: 10px;
    }
    
    .res_warn > div:nth-child(n){
        padding-left: 50px;
    }
    
    .btnBox{
        width:90%;
        height: inherit;
        position: relative;
        margin-left: 40%;
    }
    .btnBox:nth-child(2){
        margin-left: 40%;
    }
    
</style>

<header>
 <%@include file="../nav.jsp"%>
</header>

<body style="margin:10% auto;">

   <div class="res_alert" style="margin-bottom:50px; margin-left:-3%;">
	    <i class="fas fa-check-circle"></i><br><br>
	    <h1 style="margin-left:-2%;">예약이 취소되었습니다!</h1>
	</div>
	
	<hr style="width:80%; margin-bottom: 50px;">
	
	<div class="res_warn">
		<p style="margin-top:10px;"><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;예약 페이지에 입력하신 이름과 번호로 현장에서 본인 확인이 진행됩니다. </p>
	    <p><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;변경하실 에약 사항이 있으시다면 개인 페이지에서 수정해주시기 바랍니다.</p>
	    <p><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;공간에 대한 추가 문의사항은 호스트와 직접 연락해주세요</p>
	    <p><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;기한 내에 호스트의 계좌로 입금을 완료해주세요</p>
	    <br><br>
    </div>
    
	<div class="btnBox" style="margin: 5px auto; width:12%; margin-botton:10%;">
	    <a href="../memberInfo/myPage?num=1">
	        <input type='button' class="btn btn-primary btn-user btn-block" value="My Page로 이동" style="display:inline; float:left;">
	    </a>
	</div>
  

</body>
</html>