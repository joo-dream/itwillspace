<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <%@include file="../nav.jsp"%>	
</head>
<body>

<!-- 예약리스트 -->
<div class="container resList-box" style="margin-top:120px;">
  <h2>공간 예약 현황</h2> <br>
  <table class="table table-hover">
    <thead class="thead-dark">
			<tr align="center">	
				<th>예약자</th>	
				<th>연락처</th>	
				<th>예약일</th>
				<th>이용시간</th>
				<th>이용인원</th>	
				<th>등록날짜</th>									
			</tr>
		</thead>		
		
		<tbody>		
		<c:forEach items="${listBySpaceid}" var="listBySpaceid">
			<tr align="center">
				<td>${listBySpaceid.res_name}</td>
				<td>${listBySpaceid.res_phone}</td>
				<td>${listBySpaceid.res_date}</td>
				<td>${listBySpaceid.res_time}</td>			
				<td>${listBySpaceid.res_people}</td>
				<td>${listBySpaceid.res_tstamp}</td>				
			</tr>
		</c:forEach>
		</tbody>
	</table>

</div>
</body>
</html>