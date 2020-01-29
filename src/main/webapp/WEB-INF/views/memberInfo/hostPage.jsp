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

<div class="container-fluid">
	<h1 class="h2 mb-2 text-gray-800">Host Page</h1>
		
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>
			</div>
		</div>
	</div>
</div>

<div class="container">
	
	<h2>등록된 공간 목록</h2>
	<hr>
	<input id="myInput" type="text" placeholder="검색..">
	<br><br>
	<table id="myTable" class="table table-bordered table-striped table-hover">
		<thead>
			<tr class="info">
				<th width="60">번   호</th>
				<th width="140">제   목</th>
				<th width="100">방타입</th>
				<th width="150">방가격</th>
				<th width="250">방주소</th>
				<th width="150">계   좌</th>
				<th width="150">작성일</th>
				
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${myList}" var="myList">
			<tr class="trs">
				<td>${myList.space_id}</td>
				<td><a href="/space/view?id=${myList.space_id}">${myList.space_title}</a></td>
				<td>${myList.space_kind}</td>
				<td>${myList.space_price}</td>
				<td>${myList.space_address}</td>
				<!-- 
				<td>${list.space_content}</td>
				 -->
				<td>${myList.space_account}</td>
				<td>${myList.space_regDate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
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

<script>
$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myTable tr").filter(function() {
	        if(!$(this).hasClass("info")){
	      		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	        }
	    });
	  });
	});
</script>


</body>
</html>