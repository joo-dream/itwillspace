<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 정보 작성</title>

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/aos.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/style.css">
   
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400" rel="stylesheet">   

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<%@include file="../includes/header.jsp"%>
<%@include file="../nav.jsp" %>

</head>
<body>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//1.주소 검색 api
		function daumZipCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					/* console.log(data.zonecode); */
					console.log(fullRoadAddr);

					/* $("[name=addr1]").val(data.zonecode); */
					$("[name=space_address]").val(fullRoadAddr);

				}
			}).open();

		}
	</script>

<body style="margin:170px; padding:45px;">
<div class="container" style="position: relative;">

   <!-- framework -->   
   <div class="form-group" style="float:left; width:100%; display:inline-block;">
   	  <div class="container p-3 my-3 bg-dark text-white">
	      <h2>공간정보 작성</h2>   	  
   	  </div>
      <form role="form" method="post">
      	<sec:authentication property="principal.username" var="pUserId" />
      	<input type="hidden" name='userId' value="${pUserId}">
      	<div class="controls">
            <h6><span class="badge badge-dark">공간명</span></h6>
            <input type="text" class="form-control" name="space_title" placeholder="공간명을 입력해주세요.">
        </div>
        <br>
      	<div class="controls">
            <h6><span class="badge badge-dark">공간유형</span></h6>
            <select class="form-control" name="space_kind" id="space_kind">
                  <option value="" selected>공간유형을 선택해주세요.</option>
                  <option value="파티룸">파티룸</option>
                  <option value="회의실">회의실</option>
                  <option value="연습실">연습실</option>
            </select>
        </div>
        <br>
      	<div class="controls">
            <h6><span class="badge badge-dark">가격(6시간)</span></h6>
            <input type="text" class="form-control" name="space_6Hprice" placeholder="6시간 이용금액">
        </div>
        <br>
      	<div class="controls">
            <h6><span class="badge badge-dark">가격(종일)</span></h6>
            <input type="text" class="form-control" name="space_AllPrice" placeholder="종일 이용금액">
        </div>
        <br>
      	<div class="controls">
            <h6><span class="badge badge-dark">공간주소</span></h6>
            <div class="form-row">
            	<div class="col col-sm-10">
	            	<input type="text" class="form-control" name="space_address" value="${view.address}" placeholder="주소검색 버튼을 이용해주세요">
            	</div>
            	<div class="col col-sm-2">
	            	<input type="button" class="btn btn-primary" onclick="daumZipCode()" value="주소 검색">
            	</div>
            
            </div>
        </div>
        <br>
      	<div class="controls">
            <h6><span class="badge badge-dark">공간의 상세내용</span></h6>
            <textarea title="공간의 상세내용" rows="10" id="space_content" class="form-control" name="space_content">${view.content}</textarea>
        </div>
        <br>
        <div class="controls">
            <h6><span class="badge badge-dark">결제계좌번호</span></h6>
            <input type="text" class="form-control" name="space_account" placeholder="결제 계좌번호를 입력해주세요.">
        </div>
        <br>
        <div class="card shadow mb-4 border border-primary">
            <div class="card-header py-3">
               <!-- <h6 class="m-0 font-weight-bold text-primary">공간 이미지 설정</h6> -->
               <h6><span class="badge badge-dark">공간 이미지 등록</span></h6>
            </div>
              <div class="card-body">
                  <input multiple="multiple" type="file" name='uploadFile' accept="image/*">
                <div class='uploadResult'> 
                   <ul class="d-flex flex-wrap">
                   
                   </ul>
                 </div>                     
              </div>
        </div>
        
        <button id="spaceWrite" type="submit" class="btn btn-primary btn-lg">작성</button>
      	<a href="/memberInfo/hostPage" class="btn btn-danger btn-lg">취소</a>
        
      </form>
   </div>

</div>
<script>
	$(document).ready(function(e) {
		var formObj = $("form[role='form']");
		
		//submit
		$("#spaceWrite").on("click", function(e){
		   
			e.preventDefault();
			if(checkFormData()==false) //form input이 입력되었는지, 올바른지 확인
	 	        return;  			
			    	    
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
			
		var regex = new RegExp("\\.(bmp|gif|jpg|jpeg|png)$", "i");
		var maxSize = 5242880; //5MB

		//업로드 가능한 파일인지 확인
		function checkExtension(fileName, fileSize) {
			if (regex.test(fileName) == false) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			return true;
		}

		//업로드 된 사진 화면에 보여주기
		function showUploadResult(uploadResultArr) {
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return;
			}

			//var uploadImg = $(".card-img");
			var uploadUL = $(".uploadResult ul");
			var str = "";

//			$(".uploadResult ul li").each(function(i, obj) {
//				var jobj = $(obj);
//			jobj.remove();
//			});
			$(uploadResultArr).each(function(i, obj) {
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_"+ obj.fileName);
					console.log(fileCallPath);
					//uploadImg.attr('src', "/display?fileName="+ fileCallPath);

					str += "<li class='m-4' data-path='"+obj.uploadPath+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
					str +" ><div>";
					str += "<span> "+ obj.fileName + "</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image' class='btn btn-secondary btn-circle btn-sm'><i class='fas fa-times'></i></button><br>";
					str += "<img src='/display?fileName="+fileCallPath+"' style='width:250px;'>";
					str += "</div>";
					str + "</li>";
				});
				uploadUL.append(str);
			}

			//파일 선택후 이미지 파일 저장 	
			$("input[type='file']").change(function(e) {

				var formData = new FormData();

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;
				for (var i = 0; i < files.length; i++) {

				if (!checkExtension(files[i].name, files[i].size)) {
					console.log(files);
					return false;
				}
				formData.append("uploadFile",files[i]);

				}
				console.log(files);
				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
					console.log(result);
					showUploadResult(result); //업로드 결과 처리 함수 	
					}
				}); //$.ajax  
			});

			//첨부된 이미지 파일 삭제
			$(".uploadResult").on("click","button",function(e) {

				console.log("delete file");

				var uploadImg = $(".card-img");
				var targetFile = $(this).data("file");
				var type = $(this).data("type");

				var targetLi = $(this).closest("li");

				$.ajax({
					url : '/deleteFile',
					data : {fileName : targetFile, type : type},
					dataType : 'text',
					type : 'POST',
					success : function(result) {
						//alert("프로파일 설정이 삭제되었습니다.");

						targetLi.remove();
					}
				}); //$.ajax
		});
	// 작성 후 등록 클릭시 유효성검사
	function checkFormData() {
		var space_title = $("input[name='space_title']").val();
		var space_kind = $("#space_kind").val();
		var space_6Hprice = $("input[name='space_6Hprice']").val();
		var space_AllPrice = $("input[name='space_AllPrice']").val();
		var space_address = $("input[name='space_address']").val();
		var space_content = $("#space_content").val();
		var space_account = $("input[name='space_account']").val();

		if(space_title == null || space_title == ''){
			alert("공간명을 입력해야 합니다.");
			$("input[name='space_title']").attr("tabindex", -1).focus();
			return false;
		}

		if(space_kind == null || space_kind == ''){
			alert("공간의 유형을 선택해주세요.");
			$("#space_kind").attr("tabindex", -1).focus();
			return false;
		}
					
		if(space_6Hprice == null || space_6Hprice == ''){
			alert("공간의 6시간 이용료를 입력해야 합니다.");
			$("input[name='space_6Hprice']").attr("tabindex", -1).focus();
			return false;
		}
		
		if(space_AllPrice == null || space_AllPrice == ''){
			alert("공간의 종일 이용료를 입력해야 합니다.");
			$("input[name='space_AllPrice']").attr("tabindex", -1).focus();
			return false;
		}
					
		if(space_address == null || space_address == ''){
			alert("공간의 주소를 입력해야 합니다. 주소검색 버튼을 이용하여 입력해주세요!");
			$("input[name='space_address']").attr("tabindex", -1).focus();
			return false;
		}
					
		if(space_content == null || space_content == ''){
			alert("공간의 상세내용을 입력해야 합니다.");
			$("#space_content").attr("tabindex", -1).focus();
			return false;
		}
					
		if(space_account == null || space_account == ''){
			alert("결제 계좌번호를 입력해주세요.");
			$("input[name='space_account']").attr("tabindex", -1).focus();
			return false;
		}

	};
});
</script>

</body>
</html>