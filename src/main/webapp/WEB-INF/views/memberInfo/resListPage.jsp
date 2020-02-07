<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

<!-- 예약리스트 -->


<div class=""resList-box" style="margin-top:80px;">
<h2 style="margin-left:50px;"> 예약 현황</h2>

<div class="container">	
	
	<table id="myTable" class="table table-bordered table-striped table-hover">
		<thead>
			<tr class="info">	
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


</div>



</body>
</html>