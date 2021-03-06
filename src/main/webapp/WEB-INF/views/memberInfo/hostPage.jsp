<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
   
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Oswald:400,700">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/mediaelementplayer.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/fl-bigmug-line.css">

<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/aos.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/style.css">
   
   <%@include file="../nav.jsp"%>  
</head> 

<body style="margin:150px auto;">

<div class="container-fluid" style="width:75%; margin-bottom:5%;">

   <h1 class="h2 text-gray-800">Host Page</h1>
   <br>
   <div class="media border p-3">
        <img src="/resources/image/default.png" id = "profileImg" class="m-3 rounded-circle" style="width:250px;height:250px ">
        <div class="media-body ml-5">
           <br>
          <h3 class = " ml-4 media-title"> ${member.userId}</h3>
           <table class="mt-3">
             <tr>
                <td align="center">이름</td>
                <td>&nbsp;:&nbsp;&nbsp;</td>
                <td>${member.userName}</td>
             </tr>
              <tr>              
                <td align="center">전화번호</td>
                <td>&nbsp;:&nbsp;&nbsp;</td>                
                <td id="td-Phone"></td>
             </tr>
             <c:set var="email" value="${member.email}"/>
             <c:if test="${email != '' }">         
                <tr>
                   <td align="center">이메일</td>
                   <td>&nbsp;:&nbsp;&nbsp;</td>
                   <td>${member.email}</td>
                </tr>
             </c:if>  
              <tr>
                <td align="center">회원구분</td>
                <td>&nbsp;:&nbsp;&nbsp;</td>
                <c:set var="role" value="${member.auth}"/> 
                <c:choose>
                <c:when test="${role =='ROLE_MEMBER'}">
                   <td>개인 회원</td>
                </c:when>
                <c:when test="${role =='ROLE_HOST'}">
                   <td>사업자 회원</td>
                </c:when>
                </c:choose>
             </tr>
              <tr>
                <td align="center">가입일</td>
                <td>&nbsp;:&nbsp;&nbsp;</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}" /></td>
             </tr>                                                                
          </table>
          <div><a href="/member/modify?userId=${member.userId}" class="mb-3 btn btn-primary offset-md-9">회원 정보 수정</a></div>
          <div><a href="/member/changePw?userId=${member.userId}" class="btn btn-danger offset-md-9">비밀 번호 변경</a></div>
        </div>
   </div>                       
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel"></h4>
         </div>
         <div class="modal-body" style="text-align: center;"></div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">close</button>
         </div>
      </div>
   </div>
</div>

<div class="container">
   
   <h2>내가 등록한 공간 보기</h2><br>
   <hr><br>
   <!-- 검색 기능 수정 -->
   <div class="col-md-11 text-center">
		<div class="form-inline">
			<select id="searchTypeSel" name="searchType">
				<option value="">검색조건</option>
				<option value="all">전체조건</option>
				<option value="title">공간명</option>
				<option value="type">공간유형</option>
				<option value="address">공간주소</option>
			</select>
			<input class="form-control" type="text" id="keyword" name="keyword"
					value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>
			<button id="searchBtn" class="btn btn-primary">검색</button>
		</div>
	</div>
	
   <br><br>
   
   <%-- 카드형식 테스트 --%>
   <div class="row">
      <c:forEach items="${myList}" var="myList" begin="0" end="8">
         <div class="col-lg-4" data-aos="fade-up"
            data-aos-delay="100" >
            <a href="/space/view?id=${myList.space_id}"  style="border-radius:5px; margin-bottom:10%;">
               <div class="image unit-9" 
                  style="background-image: url('<spring:url value='/img/${myList.space_image}' />');border-radius:5px; "></div>
               <div class="unit-9-content-9 title"  style="margin-bottom:20%;">
                  <h3 style="margin-top:10px;"><a href="/memberInfo/resListPage?id=${myList.space_id}">${myList.space_title}</a></h3>
                  <span class="info" style="color:#a3a3a3;"> ${myList.space_address} </span>
               </div>
            </a>
         </div>
      </c:forEach>
   </div>
   
    <!-- 페이지 번호 -->
	<div>
		<ul class="pagination justify-content-center">
		
		<!-- prev 버튼 -->
			<li id="page-prev" class="page-item">
				<a class='page-link' href="hostPage${pageMaker.makeQuery(pageMaker.startPage-1, true)}" aria-label="Prev">
					<span aria-hidden="true">이전</span>
				</a>
			</li>
			
		<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			   <li id="page${idx}" class="page-item">
				    <a class='page-link' href="hostPage${pageMaker.makeQuery(idx, true)}">
				    	<!-- 시각 장애인을 위한 추가 -->
				      	<span>${idx}<span class="sr-only">(current)</span></span>
				    </a>
			    </li>
			</c:forEach>
			
			<!-- next 버튼 -->
			<li id="page-next" class="page-item">
			    <a class='page-link' href="hostPage${pageMaker.makeQuery(pageMaker.endPage + 1, true)}" aria-label="Next">
			    	<span aria-hidden="true">다음</span>
			    </a>
			</li>
		</ul>
	</div>  
   
   
<script type="text/javascript">
   $(document).ready(function(){
      var result = '<c:out value="${result}"/>';
      if(result == null || result =='')
         return;
      $("#myModal").modal();
      if(result == "modified")
         $(".modal-body").text("정보가 수정되었습니다.")
      else if(result == "changed")
         $(".modal-body").text("비밀번호가 변경되었습니다.")
   });   
</script>

<script>

$(document).ready(function(){
  
  (function(){
  
    var userId = '<c:out value="${member.userId}"/>';
    var phone = '<c:out value="${member.phone}"/>'; 
    $("#td-Phone").text( phone.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})/,"$1-$2-$3").replace("--", "-") );
    $.getJSON("/member/getAttachList", {userId: userId}, function(arr){        
       console.log(arr);
       var uploadImg = $("#profileImg");
       
       $(arr).each(function(i, attach){       
          var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
          console.log(fileCallPath);
          uploadImg.attr('src', "/display?fileName=" + fileCallPath);
       });              
     });//end getjson
    
  })();//end function
});

</script>     

<!-- <script>
$(document).ready(function(){
     $("#myInput").on("keyup", function() {
       var value = $(this).val().toLowerCase();
       $(".title").filter(function() {
           if(!$(this).hasClass("info")){
               $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
           }
       });
     });
   });
</script> -->

<script>
	$(function(){
		//perPageNum select 박스 설정
		setPerPageNumSelect();
		//searchType select 박스 설정
		setSearchTypeSelect();
		
		//prev 버튼 활성화, 비활성화 처리
		var canPrev = '${pageMaker.prev}';
		if(canPrev !== 'true'){
			$('#page-prev').addClass('disabled');
		}
		
		//next 버튼 활성화, 비활성화 처리
		var canNext = '${pageMaker.next}';
		if(canNext !== 'true'){
			$('#page-next').addClass('disabled');
		}
		
		//현재 페이지 파란색으로 활성화
		var thisPage = '${pageMaker.cri.page}';
		//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
		$('#page'+thisPage).addClass('active');
	})
	
	function setPerPageNumSelect(){
		var perPageNum = '${pageMaker.cri.perPageNum}';
		var $perPageSel = $('#perPageSel');
		var thisPage = '${pageMaker.cri.page}';
		
		$perPageSel.val(perPageNum).prop("selected",true);
		$perPageSel.on('change',function(){
			window.location.href = "hostPage?page="+thisPage+"&perPageNum="+$perPageSel.val();
		})
	}
	function setSearchTypeSelect(){
		var $searchTypeSel = $('#searchTypeSel');
		var $keyword = $('#keyword');
		
		$searchTypeSel.val('${pageMaker.cri.searchType}').prop("selected",true);
		//검색 버튼이 눌리면
		$('#searchBtn').on('click',function(){
			var searchTypeVal = $searchTypeSel.val();
			var keywordVal = $keyword.val();
			//검색 조건 입력 안했으면 경고창 
			if(!searchTypeVal){
				alert("검색 조건을 선택하세요!");
				$searchTypeSel.focus();
				return;
			//검색어 입력 안했으면 검색창
			}else if(!keywordVal){
				alert("검색어를 입력하세요!");
				$('#keyword').focus();
				return;
			}
			var url = "hostPage?page=1"
				+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
				+ "&searchType=" + searchTypeVal
				+ "&keyword=" + encodeURIComponent(keywordVal);
			window.location.href = url;
		})
	}
</script>

</div>

</body>
</html>