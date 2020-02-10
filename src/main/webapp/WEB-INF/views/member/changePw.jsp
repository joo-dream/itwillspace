<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="../includes/header.jsp"%>  
</head>  

<body style="background-image: url('/resources/image/hero_bg_2.jpg'); 
  		background-repeat: no-repeat; background-position: center center; background-size:cover;">

  <div class="container-fluid">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-6 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">비밀번호 변경</h1>
                  </div>
                  
                  <form role="form" action="/member/changePw" method="post">                
                    <div class="form-group">
                      <input type="password" id ='userPw' name='userPw' class="form-control form-control-user" placeholder="현재 비밀번호">	
                    </div>
                    <div class="form-group">
                      <input type="password" id ='userNewPw' name='userNewPw' class="form-control form-control-user"  placeholder="새로운 비밀번호">
                    </div>
                    <div class="form-group">
                      <input type="password" id ='userNewPwCheck' name='userNewPwCheck' class="form-control form-control-user"  placeholder="새로운 비밀번호 확인">
                    </div>                    

                    <div>
    					<button type='submit' class="btn btn-primary btn-user btn-block">비밀번호 변경하기</button>
  					</div> 		
                  </form>
                  <hr>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>


	</div>
  </div>

<script>
$(document).ready(function(){
	
	$('button').on("click", function(e){
		e.preventDefault();
		
		var formObj = $("form[role='form']"); 
		var userPw = $("input[name='userPw']").val();
		var userId = '<sec:authentication property="principal.username"/>';
		console.log(userPw, userId);
		
	    if(checkFormData()==false) //form input이 입력되었는지, 올바른지 확인
	        return;
 				
		if(userPw != null && userPw != ''){
			  $.ajax({
				    url: '/member/verifyPw',
				    data: {userId: userId, userPw : userPw},
				    type: 'POST',
				    dataType:'text',
				    success: function(result){
				        console.log(result); 
				        if(result == "nomatch") {
					        alert("현재 비밀번호를 다시 확인해 주세요");
					        $('#userPw').focus();
					        return;
					    }
				        else{
				    		formObj.append("<input type='hidden' name='userId' value =" + userId + ">");
				    		formObj.submit();
					    }
				    }
				}); //$.ajax  
		}
	});	

   function checkFormData() {
		var userPw = $("#userPw").val();
		var userNewPw = $("#userNewPw").val();
		var userNewPwCheck = $("#userNewPwCheck").val();
		
		if(userPw == null || userPw == ''){
		   alert("현재 아이디를 입력해야 합니다.");
		   return false;
		}
		
		if(userNewPw == null || userNewPw == ''){
		   alert("새로운 비밀번호를 입력해야 합니다.");
		   return false;
		}

		if(userNewPwCheck == null || userNewPwCheck == ''){
		   alert("비밀번호 확인을 입력해야 합니다.");
		   return false;
		}
		
		if(userNewPw != userNewPwCheck){
			alert("비밀번호 확인이 일치하지 않습니다.");
			//$('#userNewPwCheck').val('');
			$('#userNewPwCheck').focus();
			return false;
 		}		
					
		//if(!/^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){  
		if(!/^(?=.*[a-zA-Z0-9])(?=.*[0-9]).{8,25}$/.test(userNewPw)){                   
		    alert('숫자+영문자 조합으로 8자리 이상 사용해야 합니다.');
		    //$('#userNewPw').val('').focus();
		    $('#userNewPw').focus();
		    return false;
		}   
		 
		 var checkNumber = userNewPw.search(/[0-9]/g);
		 var checkEnglish = userNewPw.search(/[a-z]/ig);
		 if(checkNumber <0 || checkEnglish <0){
		     alert("숫자와 영문자를 혼용하여야 합니다.");
		     //$('#userNewPw').val('').focus();
		     $('#userNewPw').focus();
		     return false;
		 }
/*		 
		 if(/(\w)\1\1\1/.test(password)){
		     //$('#userNewPw').val('').focus();
		     $('#userNewPw').focus();
		     return false;
		 }
		     
		 if(password.search(id) > -1){
		     //$('#userNewPw').val('').focus();
		     $('#userNewPw').focus();
		     return false;
		 }
*/		       
 				           
	} 		
});
</script> 	
</body>

</html>