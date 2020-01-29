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




<div class="container">
	<h2>공간 목록</h2>
	<hr>
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr class="info">
				<th width="100">번   호</th>
				<th width="100">제   목</th>
				<th width="100">방타입</th>
				<th width="100">방가격</th>
				<th width="150">방주소</th>
				<th width="450">방상세정보</th>
				<th width="200">계   좌</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.space_id}</td>
				<td><a href="/space/view?id=${list.space_id}">${list.space_title}</a></td>
				<td>${list.space_kind}</td>
				<td>${list.space_price}</td>
				<td>${list.space_address}</td>
				<td>${list.space_content}</td>
				<td>${list.space_account}</td>
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

</body>
</html>