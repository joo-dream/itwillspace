<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공간 리스트</title>
	<%@include file="../includes/header.jsp"%>  
</head>
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
<body>

<div class="container">
	<h2>공간 목록</h2>
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
		<c:forEach items="${list}" var="list">
			<tr class="trs">
				<td>${list.space_id}</td>
				<td><a href="/space/view?id=${list.space_id}">${list.space_title}</a></td>
				<td>${list.space_kind}</td>
				<td>${list.space_price}</td>
				<td>${list.space_address}</td>
				<!-- 
				<td>${list.space_content}</td>
				 -->
				<td>${list.space_account}</td>
				<td>${list.space_regDate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>