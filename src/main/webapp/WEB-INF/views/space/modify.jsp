<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>   

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>방 정보 수정</title>
	<%@ include file="../includes/header.jsp" %>
</head>
<body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumZipCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

        	// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
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

<br><br><br>

<div class="container">
	<h2>방 정보 수정</h2><hr>
	
	<form method="post">
		<sec:authentication property="principal.username" var="pUserId"/><input type ="hidden" name='userId' value="${pUserId}" >
		<table>
			<tr>
				<th width="50" height="50" class="form-control">공간명</th>
				<td><input type="hidden" name="space_id" value="${view.space_id}"/>
				<input type="text" name="space_title" value="${view.space_title}"/></td>
			</tr>
			<tr>
				<label>방타입</label> 
				<select name="space_kind" class="form-control">
					<option value="파티" selected>파티</option>
					<option value="회의">회의</option>
					<option value="연습">연습</option>
				</select>
			</tr>	
			<tr>
				<label>방가격</label> 
				<select name="space_price" class="form-control">
					<option value="6시간:50000" selected>6시간:50000</option>
					<option value="종일:150000">종일:150000</option>
				</select>
			</tr>
			<tr>
				<th width="50" height="50" class="form-control">방주소</th>
				<td>
					<input type="text" name="space_address" value="${view.space_address}"/>
					<input type="button" onclick="daumZipCode()" value="주소 검색">
				</td>
			</tr>
			
			<tr>
				<th width="50" height="50" class="form-control">공간상세내용</th>
				<td><textarea cols="80" rows="10" name="space_content">${view.space_content}</textarea></td>
			</tr>
			<tr>
				<th width="50" height="50" class="form-control">공간결제계좌</th>
				<td><input type="text" name="space_account" value="${view.space_account }"/></td>
			
			</tr>
		</table>
		<button type="submit">수정</button>
		
	</form>
</div>
</html>