<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 조회</title>
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

<%@include file="../includes/header.jsp"%>
<%@include file="../nav.jsp" %>
</head>
<body style="margin: 150px; ">

	<div class="container" style="position:relative;">
	
		<h2>공간 내용</h2>
		<hr>
<!--		
		<img src="/resources/image/test2.jpg" id = "spaceImg" class="m-3" style="width:200px;height:250px ">
		<br>
    	<h3 class = " ml-4 media-title"> ${space.space_image}</h3>
-->
<!-- 방 사진 보여주기 yeounjoo start-->
		<div class="card shadow mb-4 border border-secondary">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">공간 상세 이미지</h6>
			</div>
	        <div class="card-body">
			    <div class='uploadResult'> 
		          <ul class="d-flex flex-wrap">
		          
		          </ul>
	        	</div>							
	        </div>
	   </div>
<!-- 방 사진 보여주기 yeounjoo end-->
	         	
		<table style="line-height: 25px;">
			<tr>
				<th width="50">제 목</th>
				<td>${view.space_title}</td>
			</tr>
			<tr>
				<th>타 입</th>
				<td>${view.space_kind}</td>
			</tr>
			<tr>
				<th>가 격</th>
				<td>${view.space_price}</td>
			</tr>
			<tr>
				<th>주 소</th>
				<td>${view.space_address}</td>
			</tr>

			<tr>
				<th>내 용</th>
				<td>${view.space_content}</td>
			</tr>

			<tr>
				<th>계 좌</th>
				<td>${view.space_account}</td>
			</tr>

		</table>
		<br>

		<sec:authorize access="isAuthenticated()">      
   		<sec:authentication property="principal.username" var="pUserId"/>
   		<c:set var="spaceUserId" value="${view.userId}"/>
   		<c:if test="${pUserId eq spaceUserId }">
   		<div>
			<a href="/space/modify?id=${view.space_id }">게시물 수정</a> 
			<a href="/space/delete?id=${view.space_id }">게시물 삭제</a>
		</div>
	</c:if>
	</sec:authorize>

	</div>

	<div id="map" style="width: 500px; height: 400px; margin: 50px"></div>
	
	<!-- review 등록 yeounjoo start-->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<span class="m-0 font-weight-bold">이용 후기</span>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" var="userId"/>
				<button id="addReviewBtn" type="button" class="btn btn-primary btn-sm float-right">후기 작성</button>
			</sec:authorize>
		</div>
		<div class="chat"></div>		   
		<div class="card-footer"></div>
	</div>
	
	<div class="modal" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">${userId}</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				  <div class="form-group"> 
	                <textarea id ="content" class="form-control" rows="3" name='content'
	                	placeholder="내용을 입력하세요"></textarea>
	              </div>      
				</div>
				<div class="modal-footer">
				    <button id='modalModBtn' type="button" class="btn btn-primary bt-sm">수정</button>
	        		<button id='modalRemoveBtn' type="button" class="btn btn-danger bt-sm">삭제</button>
	        		<button id='modalRegisterBtn' type="button" class="btn btn-primary bt-sm">등록</button>
	        		<button id='modalCloseBtn' type="button" class="btn btn-secondary bt-sm" data-dismiss="modal">Close</button>				
				</div>
			</div>
		</div>
	</div>	<!-- review 등록 yeounjoo end-->
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3fa4cbf02cb5b36919e159ba3770504d&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(
						'${view.space_address}',
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">${view.space_title}</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	</script>

<!-- 방 사진 보여주기 yeounjoo start-->
<script>
$(document).ready(function(){
  
  (function(){  
	  var spaceValue = '<c:out value="${view.space_id}"/>';

    $.getJSON("/space/getAttachList", {space_id: spaceValue}, function(arr){ 
       console.log("test");        
       console.log(arr);
       var str = "";
       $(arr).each(function(i, attach){       
           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
           
           str += "<li class='m-4' data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
           str += "<img src='/display?fileName="+fileCallPath+"' style='width:250px;'>";
           str += "</div>";
           str +"</li>";		    
       }); 
       $(".uploadResult ul").html(str);             
     });//end getjson
    
  })();//end function
});
</script> 
<!-- 방 사진 보여주기 yeounjoo end-->

<!-- review 등록 yeounjoo start-->
<script type="text/javascript" src="/resources/js/review.js"></script> 
<script>	
		
$(document).ready(function () {
  
	var spaceValue = '<c:out value="${view.space_id}"/>';
	var reviewUL = $(".chat");
	var userValue = null;
	<sec:authorize access="isAuthenticated()">
		userValue = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
	
	showList(1);
    
    function showList(page){	
		console.log("show list " + page);	    
	    reviewService.getList({space_id:spaceValue, page: page|| 1 }, function(reviewCnt, list) {
	      
		    console.log("reviewCnt: "+ reviewCnt );
		    console.log("list: " + list);
		    console.log(list);
		    
		    if(page == -1){
		      pageNum = Math.ceil(reviewCnt/10.0);
		      showList(pageNum);
		      return;
		    }		      
		    var str="";		     
		    if(list == null || list.length == 0){
		      return;
		    }
		    console.log(list.length);	     
		    for (var i = 0, len = list.length || 0; i < len; i++) {		    			        	
		        str +="<div class='card-body border-bottom'>";
		        str +="<div><div class='header'><strong class='bg-light'>"+list[i].userId+"</strong>"; 
		        str +="<small class='float-right text-muted'>"
		            +reviewService.displayTime(list[i].regDate)+"</small></div>";
		        str +="<p style='color:black;'>"+list[i].content+"</p></div>";
		        if(userValue == list[i].userId){
					str += "<button type='button' data-rid='"+list[i].reviewId+"' "
					str += "class='mt-n2 pt-0 pb-0 btn btn-secondary btn-sm float-right'><small>편집</small></button>";		
		        }  
		        str +="</div>";            
		    }	     
		    reviewUL.html(str);
		    console.log(str);	     
	    	showReviewPage(reviewCnt);		 
	   	});//end function   	
	}//end showList
  
   
	//Review Modal 관련 
	var modal = $("#myModal");
	var modalInputReview = modal.find("#content");
	 
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	 
	$("#addReviewBtn").on("click", function(e){	
		modal.find("textarea").val("");
		modal.find("button[id !='modalCloseBtn']").hide();	   
		modalRegisterBtn.show();	  
		modal.modal("show");      
	});
	   
  
	//리뷰 등록 처리 
	modalRegisterBtn.on("click",function(e){
		console.log(spaceValue);
		contentValue = modalInputReview.val();
		if(contentValue==null || contentValue=='' ){
			alert("내용을 입력하세요");
			return;
		}
		var review = {
		      content: contentValue,
		      userId:userValue,
		      space_id:spaceValue
		    };
		
		reviewService.add(review, function(result){			
			console.log("add.....................");	 	 
			alert("등록되었습니다.");
			modal.find("textarea").val("");
			modal.modal("hide");	    
			showList(1);
		});			  
	});
	  
   //리뷰 조회 클릭 이벤트 처리 
	$(".chat").on("click", "button", function(e){

		var reviewId = $(this).data("rid");
		console.log(reviewId);
		reviewService.get(reviewId, function(review){		
			modalInputReview.val(review.content);
			modal.data("reviewId", review.reviewId);			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();       
			modal.modal("show");		      
		});
	});
	   
	//리뷰 수정
	modalModBtn.on("click", function(e){
		contentValue = modalInputReview.val();
		if(contentValue==null || contentValue=='' ){
			alert("내용을 입력하세요");
			return;
		}	 	  
		var review = {
				reviewId:modal.data("reviewId"), 
				content: contentValue
				};
		
		reviewService.update(review, function(result){		      
			alert("수정되었습니다");
			modal.modal("hide");
			showList(pageNum);		  
		});		  
	});
		
	//리뷰 삭제	
	modalRemoveBtn.on("click", function (e){
	  
		var reviewId = modal.data("reviewId");
		
		reviewService.remove(reviewId, function(result){		      
			alert("삭제되었습니다");
			modal.modal("hide");
			showList(pageNum);		    
		});	  
	});

	var pageNum = 1;
	var reviewPageFooter = $(".card-footer");

	function showReviewPage(reviewCnt){	  
		var endNum = Math.ceil(pageNum / 10.0) * 10;  
		var startNum = endNum - 9; 		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= reviewCnt){
		  endNum = Math.ceil(reviewCnt/10.0);
		}
		
		if(endNum * 10 < reviewCnt){
		  next = true;
		}
		  
		var str = "<ul class='pagination float-right'>";
		
		if(prev){
			str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		
		for(var i = startNum ; i <= endNum; i++){		  
			var active = pageNum == i? "active":"";			  
			str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
			
		if(next){
			str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		}
		
		str += "</ul></div>";			
		console.log(str);			
		reviewPageFooter.html(str);
	}
		 
	reviewPageFooter.on("click","li a", function(e){
		e.preventDefault();
		console.log("page click");		
		var targetPageNum = $(this).attr("href");		
		console.log("targetPageNum: " + targetPageNum);		
		pageNum = targetPageNum;		
		showList(pageNum);
	});     
    	
});
</script>
<!-- review 등록 yeounjoo end-->	
</body>
</html>