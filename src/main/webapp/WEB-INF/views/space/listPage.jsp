<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공간 리스트</title>
	<%@include file="../includes/header.jsp"%>  
</head>
<body>
<script>
#(document).ready(function(){
	$("#myInput").on("keyup",function(){
		var value = $(this).val().toLowerCase();
		$("#myTable tr").filter(function(){
			if(!$(this).hasClass("info")){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			}
		});
	});
});
</script>
<body>


<div class="container">

	<!-- framework -->
	<div class="row justify-content-center">

	<div class="col-xl-6 col-lg-12 col-md-9">

	<div class="card o-hidden border-0 shadow-lg my-5">
	<div class="card-body p-0">
	
	<!-- Nested Row within Card Body -->
	<div class="row">
	<div class="col-lg-12">
	<div class="p-5">
	<div class="text-center">
		<h1 class="h4 text-gray-900 mb-4">공간정보 작성</h1>
	</div>
	
	<input id="myInput" type="text" placeholder="검색..">
	<br><br>
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr class="info">
				<th width="60">번   호</th>
				<th width="140">제   목</th>
				<th width="100">타   입</th>
				<th width="150">가   격</th>
				<th width="250">주   소</th>
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
				<td>${list.space_account}</td>
				<td>${list.space_regDate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div class="col-sm-offset-4">
		<c:if test="${prev }">
			<span>[ <a href="/space/listPage?page=${startPage-1}">이전</a> ]</span>
		</c:if>

		<c:forEach begin="${startPage}" end="${endPage}" var="page">
			<span>
				<c:if test="${curPage != page}">
					<a href="/space/listPage?page=${page}">${page}</a>
				</c:if>
				<c:if test="${curPage == page}">
					<b>${page}</b>
				</c:if>
			</span>
		</c:forEach>

		<c:if test="${next }">
			<span>[ <a href="/space/listPage?page=${endPage+1}">다음</a> ]</span>
		</c:if>
	</div>

	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</div>

</body>
</html>