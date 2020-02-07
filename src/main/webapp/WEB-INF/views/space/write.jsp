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
<%@include file="../includes/header.jsp"%>

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

	<div class="container">
		<!-- framework -->
		<div class="row justify-content-center">
		<div class="col-xl-6 col-lg-12 col-md-9">
		<div class="card o-hidden border-0 shadow-lg my-g">
		<div class="card-body p-0">
		
		<div class="row">
		<div class="col-lg-12">
		<div class="p-5">
		<div class="text-center">
			<h2 class="h4 text-gray-900 mb-4">공간정보 작성</h2>
		</div>

		<form role="form" method="post">
			<sec:authentication property="principal.username" var="pUserId" />
			<input type="hidden" name='userId' value="${pUserId}">
			<table>
				<tr>
					<th width="50" height="50" class="form-control">공간명</th>
					<td><input type="text" name="space_title"
						value="${view.title}" /></td>
				</tr>
				<tr>
					<label>타입</label>
					<select name="space_kind" class="form-control">
						<option value="파티" selected>파티</option>
						<option value="회의">회의</option>
						<option value="연습">연습</option>
					</select>
				</tr>
				<!--
			<th width="50" height="50">공간타입</th>
			<td><input type="text" name="space_kind" value="${view.kind}"/></td>
			-->
				<!--  
			<tr>
				<th width="50" height="50" class="form-control">작성자</th>
				<td><input type="text" name="space_writer" value="${view.writer}"/></td>
			</tr>
			-->
				<tr>
					<label>가격</label>
					<select name="space_price" class="form-control">
						<option value="6시간:50000" selected>6시간:50000</option>
						<option value="종일:150000">종일:150000</option>
					</select>
				</tr>
				<tr>
					<th width="50" height="50" class="form-control">방주소</th>
					<td><input type="text" name="space_address"
						value="${view.address}" /> <input type="button"
						onclick="daumZipCode()" value="주소 검색"></td>
				</tr>
				<tr>
					<th width="50" height="50" class="form-control">공간상세내용</th>
					<td><textarea cols="80" rows="10" name="space_content">${view.content}</textarea></td>
				</tr>
				<tr>
					<th width="50" height="50" class="form-control">공간결제계좌</th>
					<td><input type="text" name="space_account"
						value="${view.account }" /></td>
				</tr>
				<div class="card shadow mb-4 border border-primary">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">공간 이미지 설정</h6>
					</div>
			        <div class="card-body">
			            <input multiple="multiple" type="file" name='uploadFile'
												accept="image/*">
					    <div class='uploadResult'> 
				          <ul class="d-flex flex-wrap">
				          
				          </ul>
			        	</div>							
			        </div>					
				</div>

			</table>
			<button type="submit">작성</button>
		</form>
		
		</div>
		</div>
		</div>
	
	</div>
	</div>
	</div>
	</div>
</div>
<script>
	$(document).ready(function(e) {
		var formObj = $("form[role='form']");
		
		//submit
		$("button[type='submit']").on("click", function(e){
		   
			e.preventDefault();				
			    	    
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
	});
</script>

</body>
</html>