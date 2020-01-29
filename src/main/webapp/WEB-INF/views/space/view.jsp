<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공간 조회</title>
<%@include file="../includes/header.jsp"%>
</head>
<body style="margin: 0 auto; width: 80%;">

	<br><br><br>

	<div class="container">
		<h2>공간 내용</h2>
		<hr>
		<table style="line-height: 25px;">
			<tr>
				<th width="50">제 목</th>
				<td>${view.space_title}</td>
			</tr>
			<tr>
				<th>방타입</th>
				<td>${view.space_kind}</td>
			</tr>
			<tr>
				<th>방가격</th>
				<td>${view.space_price}</td>
			</tr>
			<tr>
				<th>방주소</th>
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

</body>
</html>