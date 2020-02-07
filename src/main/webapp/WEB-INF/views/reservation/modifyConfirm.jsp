<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 수정 확인</title>
	<script src="https://kit.fontawesome.com/aeb2899479.js" crossorigin="anonymous"></script>
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
<body>

<div class="res_alert" style="margin-bottom: 50px;">
    <i class="fas fa-check-circle"></i><br>
    <h1>예약이 수정되었습니다!</h1>
</div>

<hr style="width:80%; margin-bottom: 50px;">

<div class="res_warn">
    
    <p style="margin-top:10px;"><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;예약 페이지에 입력하신 이름과 번호로 현장에서 본인 확인이 진행됩니다. </p>
    <p><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;변경하실 예약 사항이 있으시다면 개인 페이지에서 수정해주시기 바랍니다.</p>
    <p><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;공간에 대한 추가 문의사항은 호스트와 직접 연락해주세요</p>
    <p><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;기한 내에 호스트의 계좌로 입금을 완료해주세요</p>
    <br><br>
    
    <div>
       <br>
        <strong><i class="fas fa-user-secret"></i>&nbsp;호스트 정보</strong>
        <p>입금 금액 : ${spaceVO.space_price}</p>
        <p>호스트 계좌번호 : ${spaceVO.space_account}</p>
        <br>
    </div>    
    
</div>

<div class="btnBox">   
         
         <button type="button"  class="col-1-4 res_form_btn" onclick="location.href='../memberInfo/myPage?num=1'">
         MY PAGE
         </button>      
         
         <button type="button" class="col-1-4 res_form_btn" onclick="location.href='../space/list'">
         SPACE LIST
         </button>
</div>

</body>
</html>