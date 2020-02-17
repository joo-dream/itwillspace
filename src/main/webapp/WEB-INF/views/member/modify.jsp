<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<!DOCTYPE html>
<html lang="en">

<head>
	<%@include file="../nav.jsp"%> 
	<%@include file="../includes/header.jsp"%>   
</head>  

<body style="margin:10% auto;">

<!-- Begin Page Content -->
<div class="container-fluid">

	<form role="form" action="/member/modify" method="post">
		<div class="card shadow mb-4 border border-primary" >
			<div class="card-header py-3">
				<h6 class="h2 mb-2 text-gray-800">회원 정보 수정</h6>
			</div>
			<div class="card-body">
		          <div class="form-group row">
		          	<div class="col-sm-12">
		            	<label>userID</label> 			            		            	
		            	<input type ="text" class="form-control" name='userId' 
		            		value='<c:out value="${member.userId}"/>' readonly="readonly"> 
		            </div>
		          </div>
		          	          
		          <div class="form-group row">
		          	<div class="col-sm-12">
		            	<label>userName</label> 
		            	<input type ="text" class="form-control" name='userName'
		            		value='<c:out value="${member.userName}"/>'>
		            </div>
		          </div>
		          	
		          <div class="form-group row">
		          	<div class="col-sm-12">
		            	<label>전화번호</label> 
		            	<input type ="text" class="form-control" name='phone' value=""/>
		            </div>
		          </div>
		          
		          <div class="form-group row">
		          	<div class="col-sm-12">
		            	<label>이메일</label> 
		            	<input type ="text" class="form-control" name='email'
		            		value='<c:out value="${member.email}"/>'>
		            </div>
		          </div>		          
	              <div class="form-group row">
	              	<div class="mt-3 col-sm-12">
	                  	<label class ="mr-5">회원 구분</label>
	                  	<div class="ml-5 custom-control custom-radio custom-control-inline">
	                  	    <c:set var="role" value="${member.auth}"/> 
    						<c:choose>
    							<c:when test="${role =='ROLE_MEMBER'}">
  									<input type="radio" id="customRadioInline1" name="auth" class="custom-control-input" value="ROLE_MEMBER" checked>
  								</c:when>
  								<c:otherwise>
  									<input type="radio" id="customRadioInline1" name="auth" class="custom-control-input" value="ROLE_MEMBER">
  								</c:otherwise>
  							</c:choose>		
  							<label class="custom-control-label" for="customRadioInline1">개인 회원</label>
						</div>
						<div class="ml-5 custom-control custom-radio custom-control-inline">
							<c:choose>
    							<c:when test="${role =='ROLE_HOST'}">
  									<input type="radio" id="customRadioInline2" name="auth" class="custom-control-input" value="ROLE_HOST" checked>
  								</c:when>
  								<c:otherwise>
  									<input type="radio" id="customRadioInline2" name="auth" class="custom-control-input" value="ROLE_HOST" >
  								</c:otherwise>
  							</c:choose>		
  							<label class="custom-control-label" for="customRadioInline2">사업자 회원</label>
						</div>
	                </div>
	              </div>
		          <hr>	                    
			</div>
		</div>

		<div class="card shadow mb-4 border border-primary">
			<div class="card-header py-3">
				<h6 class="h2 mb-2 text-gray-800">프로파일 설정</h6>
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
			
		<div class="form-group" align="right">
		   <div class="col-sm-8 ">				
	          <button id="memberModify" type="submit" data-oper='modify' class="btn btn-primary btn-user btn-lg">정보 수정하기</button>
	          <button id="memberDelete" type="submit" data-oper='remove' class="btn btn-danger btn-user btn-lg">탈퇴하기</button>
	       </div>
	     </div>         
	</form>		
</div>
<!-- /탈퇴 확인 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">탈퇴 확인</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body" style="text-align: center;">더이상 ITWILLSPACE의 멤버 서비스를 이용할 수 없습니다.<br> 정말로 탈퇴하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="removeMember()">동의</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<script>

$(document).ready(function(e){
  
  (function(){	  
	    var userId = '<c:out value="${member.userId}"/>';
	    var phone = '<c:out value="${member.phone}"/>'; 
	    $("input[name='phone']").val( phone.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") );	    
	    console.log(userId);
	    $.getJSON("/member/getAttachList", {userId: userId}, function(arr){        
	       console.log(arr);
	       var uploadImg = $(".card-img");
	       var str = "";
	       
	       $(arr).each(function(i, attach){       
			    var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
			    console.log(fileCallPath);
			    uploadImg.attr('src', "/display?fileName=" + fileCallPath);

				str += "<li data-path='"+attach.uploadPath+"'";
				str +=" data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.image+"'"
				str +" ><div>";
				str += "<span> "+ attach.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-secondary btn-circle btn-sm'><i class='fas fa-times'></i></button><br>";
				str += "</div>";
				str +"</li>";	
	       }); 
	       $(".uploadResult ul").append(str);             
	     });//end getjson	
	     	         
	  })();//end function

	//submit(가입신청)	
	var formObj = $("form[role='form']");
	//$("button[type='submit']").on("click", function(e){
	$("#memberModify, #memberDelete").on("click", function(e){
	   
		e.preventDefault();	
		var operation = $(this).data("oper");
		if(operation === 'remove'){
			$("#myModal").modal();
		}
		else if(operation === 'modify'){
		    if(checkFormData()==false) //form input이 입력되었는지, 올바른지 확인
		        return;
	        
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
		}
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
		//전화번호에 "-" 자동 추가	
		$("input[name='phone']").keyup(function(){ 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") );
		});	
		
		$("input[name='phone']").change(function(){ 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") );
		});					
	});	 
	
   function checkFormData() {
		var userName = $("input[name='userName']").val();
		var phone = $("input[name='phone']").val();
					       
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
 
