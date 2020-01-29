<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="../includes/header.jsp"%>  
</head>  

<body>

<!-- Begin Page Content -->
<div class="container">

	<!-- Page Heading -->
	<h1 class="h2 mb-2 text-gray-800">ITWILLSPACE</h1>
	<p class="mb-4"></p>

	<!-- DataTales Example -->
	<form role="form" action="/member/register" method="post">
		<div class="card shadow mb-4 border border-primary" >
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">회원 정보 입력</h6>
			</div>
			<div class="card-body">
		          <div class="form-group row">
		          	<div class="col-sm-12">
		            	<label>아이디</label>
		            </div>
		            <div class=" row col-sm-12">
			            <div class="col-sm-8">
			            	<input type ="text" class="form-control" name='userId'>
			            </div>
			            <div class="col-sm-4">
			            	<button type="button" id ="duplicateId" class="btn btn-danger ">아이디 중복 확인</button>
						</div>
					</div>
		          </div>
		          
		          <div class="form-group row">
		          	<div class="col-sm-6">
		            	<label>비밀번호</label> 
		            	<input type ="password" class="form-control" id ="pw1" name='userPw'>
		            </div>
		            <div class="col-sm-6">
		            	<label>비밀번호 재확인</label> 
		            	<input type ="password" class="form-control" id ="pw2" name='userPwCheck'>
		            </div>
					<div class="ml-3 mr-3 mt-2 mb-0 mbalert alert-success form-control" id="alert-success">비밀번호가 일치합니다.</div> 
					<div class="ml-3 mr-3 mt-2 mb-0 alert alert-danger form-control" id="alert-danger">비밀번호가 일치하지 않습니다.</div>	            
		          </div>
		          	          
		          <div class="form-group row">
		          	<div class="col-sm-12">
		            	<label>이름</label> 
		            	<input type ="text" class="form-control" name='userName'>
		            </div>
		          </div>	

		          <div class="form-group row">
		          	<div class="col-sm-12">
		            	<label>전화번호</label> 
		            	<input type ="text" class="form-control" name='phone'>
		            </div>
		          </div>
		          
		          <div class="form-group row">
		          	<div class="col-sm-12">
		            	<label>이메일</label> 
		            	<input type ="text" class="form-control" name='email'>
		            </div>
		          </div>
		          		          		          
	              <div class="form-group row">
	              	<div class="mt-3 col-sm-12">
	                  	<label class ="mr-5">회원 구분</label>
	                  	<div class="ml-5 custom-control custom-radio custom-control-inline">
  							<input type="radio" id="customRadioInline1" name="auth" class="custom-control-input" value="ROLE_MEMBER" checked>
  							<label class="custom-control-label" for="customRadioInline1">개인 회원</label>
						</div>
						<div class="ml-5 custom-control custom-radio custom-control-inline">
  							<input type="radio" id="customRadioInline2" name="auth" class="custom-control-input" value="ROLE_HOST">
  							<label class="custom-control-label" for="customRadioInline2">사업자 회원</label>
						</div>
	                </div>
	              </div>
		          <hr>	                    
			</div>
		</div>

		<div class="card shadow mb-4 border border-primary">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">프로파일 설정</h6>
			</div>
		    <div class="card-body">
	          <div class="card">
	          	<div class="row no-gutters">
	              <div class="col-4">
	                <img src="/resources/image/default.png" alt="" class="card-img"/>
	                <div class="card-img-overlay d-flex align-items-end flex-column justify-content-end">
		              <div class='uploadResult'> 
	          				<ul >         
	          				</ul>
	        		  </div>	                
	                </div>
	              </div>
	              <div class="col-8">
	                <div class="card-body">
	                  <p class="card-text">
	                   	  <input type="file" name='uploadFile' accept="image/*">	                   	  
	                  </p>
	                </div>
	              </div>
				</div>	
	          </div>	        
		     </div>		      		
		</div>
			
		<div class="form-group" align="center">
		      <div class="col-lg-4 ">				
	          <button type="submit" class="btn btn-primary btn-user btn-block btn-lg">가입 신청하기</button>
	          </div>
	     </div> 
        
	</form>	
</div>

<script>

$(document).ready(function(e){
	var formObj = $("form[role='form']");
	var duplicateIdCheck = false;
	var equalPwCheck = false;
	
	//아이디 중복 체크버튼 클릭
	$("#duplicateId").on("click", function(e){
		var inputId = $("input[name='userId']");
		var userId = inputId.val();
		if(userId != null && userId != ''){
			  $.ajax({
				    url: '/member/duplicateId',
				    data: {userId: userId},
				    type: 'POST',
				    dataType:'text',
				    success: function(result){
				        console.log(result); 
				        if(result == "no") {
					        alert("동일한 아이디가 존재합니다.");
					        //inputId.focus();
					        return;
					    }
				        else if(result == "yes"){
				        	alert("사용 가능한 아이디입니다.");
				        	duplicateIdCheck = true;
					    }
				    }
				}); //$.ajax  
		}else{
			alert("아이디가 입력되지 않았습니다.");
		}		
	});	

	//submit(가입신청)
	$("button[type='submit']").on("click", function(e){
	   
		e.preventDefault();				
//	    if(checkFormData()==false) //form input이 입력되었는지, 올바른지 확인
//	        return;
        
		//전화번호 데이터를 넘길때 다시 -를 삭제하고 보낸다.
	    var phone = $("input[name='phone']").val().replace(/\-/g,'');
		$("input[name='phone']").val(phone);
		    	    
		var str = "";	
		$(".uploadResult ul li").each(function(i, obj){
		     
			var jobj = $(obj);     
			console.dir(jobj);
			console.log(jobj.data("filename"));
			          
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";     
		});   
		console.log(str);
	    formObj.append(str).submit();
	});
	  	
	var regex = new RegExp("\\.(bmp|gif|jpg|jpeg|png)$","i");
	var maxSize = 5242880; //5MB
	//업로드 가능한 파일인지 확인
	function checkExtension(fileName, fileSize){
	  if(regex.test(fileName)==false){
	    alert("해당 종류의 파일은 업로드할 수 없습니다.");
	    return false;
	  }	
	  if(fileSize >= maxSize){
	    alert("파일 사이즈 초과");
	    return false;
	  }	
	  return true;
	}

	//업로드 된 사진 화면에 보여주기
	function showUploadResult(uploadResultArr){		   
	   if(!uploadResultArr || uploadResultArr.length == 0)
		   { return; }

	   var uploadImg = $(".card-img");
	   var uploadUL = $(".uploadResult ul");
	   var str ="";

	   $(".uploadResult ul li").each(function(i, obj){
		   var jobj = $(obj);
		   jobj.remove();
	   });
	   $(uploadResultArr).each(function(i, obj){			    		   		
		    var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
		    console.log(fileCallPath);
		    uploadImg.attr('src', "/display?fileName=" + fileCallPath);
		    
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-secondary btn-circle btn-sm'><i class='fas fa-times'></i></button><br>";
			str += "</div>";
			str +"</li>";			    	
	   });
	   uploadUL.append(str);
	 }

	//파일 선택후 이미지 파일 저장 	
	$("input[type='file']").change(function(e){
		
		  var formData = new FormData();
		  
		  var inputFile = $("input[name='uploadFile']");
		  
		  var files = inputFile[0].files;
		  for(var i = 0; i < files.length; i++){
		
		    if(!checkExtension(files[i].name, files[i].size) ){	
		      console.log(files);  
		      return false;
		    }
		    formData.append("uploadFile", files[i]);
		   
		  }
		  console.log(files);
		  $.ajax({
		    url: '/uploadAjaxAction',
		    processData: false, 
		    contentType: false,
		    data: formData,
		    type: 'POST',
		    dataType:'json',
		    success: function(result){
		        console.log(result); 
				showUploadResult(result); //업로드 결과 처리 함수 	
		    }
		  }); //$.ajax  
		});

	//첨부된 이미지 파일 삭제
	$(".uploadResult").on("click", "button", function(e){
		   
		   console.log("delete file");

		   var uploadImg = $(".card-img");  
		   var targetFile = $(this).data("file");
		   var type = $(this).data("type");
		   
		   var targetLi = $(this).closest("li");
		   
		   $.ajax({
		     url: '/deleteFile',
		     data: {fileName: targetFile, type:type},
		     dataType:'text',
		     type: 'POST',  
		       success: function(result){
		          alert("프로파일 설정이 삭제되었습니다.");
		          
		          targetLi.remove();
		          uploadImg.attr('src', "/resources/image/default.png");
		        }
		   }); //$.ajax
		  });
	  
	$(function(){ 
		//비밀번호가 같은지 확인
		$("#alert-success").hide(); 
		$("#alert-danger").hide(); 
		$("input[type='password']").keyup(function(){ 
			var pw1=$("#pw1").val(); 
			var pw2=$("#pw2").val(); 
			if(pw1 != "" || pw2 != ""){ 
				if(pw1 == pw2){ 
					equalPwCheck = true;
					$("#alert-success").show(); 
					$("#alert-danger").hide(); 
				}else{
					equalPwCheck = false; 
					$("#alert-success").hide(); 
					$("#alert-danger").show(); 
				} 
			} 
		});

		//전화번호에 "-" 자동 추가	
		$("input[name='phone']").keyup(function(){ 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") );
		});	
		
		$("input[name='phone']").change(function(){ 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") );
		});					
	});	 
	
   function checkFormData() {
		var userId = $("input[name='userId']").val();
		var userName = $("input[name='userName']").val();
		var phone = $("input[name='phone']").val();
		var password = $('#pw1').val();
		
		if(userId == null || userId == ''){
		   alert("아이디를 입력해야 합니다.");
		   return false;
		}
		
	    if(duplicateIdCheck == false){
	  		alert("아이디 중복확인을 해야 합니다.");
	   		return false;
		}
		
		if(equalPwCheck == false){
			alert("비밀번호 확인이 일치하지 않습니다.");
			return false;
		}	
					
		//if(!/^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){  
		if(!/^(?=.*[a-zA-Z0-9])(?=.*[0-9]).{8,25}$/.test(password)){                   
		    alert('숫자+영문자 조합으로 8자리 이상 사용해야 합니다.');
		    //$('#pw1').val('').focus();
		    $('#pw1').focus();
		    return false;
		}    
		 var checkNumber = password.search(/[0-9]/g);
		 var checkEnglish = password.search(/[a-z]/ig);
		 if(checkNumber <0 || checkEnglish <0){
		     alert("숫자와 영문자를 혼용하여야 합니다.");
		     //$('#pw1').val('').focus();
		     $('#pw1').focus();
		     return false;
		 }
/*		 
		 if(/(\w)\1\1\1/.test(password)){
		     //$('#pw1').val('').focus();
		     $('#pw1').focus();
		     return false;
		 }
		     
		 if(password.search(id) > -1){
		     //$('#pw1').val('').focus();
		     $('#pw1').focus();
		     return false;
		 }
*/		       
		if(userName == null || userName == ''){
		   alert("이름을 입력해야 합니다.");
		   return false;
		}
		if(phone == null || phone == ''){
		   alert("전화번호를 입력해야 합니다.");
		   return false;
		} 				           
	}        

});	 
</script>

</body>    
</html>
 
