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

<div class="container pt-5">
	<h2>공간 목록</h2>
<div class="form-inline">
		<select id="searchType" name="searchType">
			<option value="">검색조건</option>
			<option value="all">전체조건</option>
			<option value="title">공간명</option>
			<option value="type">공간유형</option>
			<option value="address">공간주소</option>
		</select>
		<input class="form-control" type="text" id="keyword" name="keyword"
				value="" placeholder="검색어를 입력하세요"/>
		<button id="searchBtn" class="btn btn-primary">검색</button>
	</div>
	<hr>

	<c:forEach items="${list}" var="list">
		<div class="row">
			<div class="col-md-6">
				<h5><a href="/space/view?id=${list.space_id}">${list.space_title}</a></h5>
				<div class="fakeimg">Space Image</div>
			</div>
			<div class="col-md-4">
				<p>종류 : ${list.space_kind}</p>
				<p>가격 : ${list.space_price}</p>
				<p>주소 : ${list.space_address}</p>				
			</div>
			<div class="col-md-2">
				<button type="submit" class="btn btn-info" 
					onclick="location.href='/space/view?id=${list.space_id}'">상세정보 보기</button>
				
			</div>
		</div>
	</c:forEach>
	
	<div>
		<ul class='pagination justify-content-center'>
				<c:if test="${prev }">
			<li class='page-item'>
					<span><a class='page-link' href="/space/listPage?page=${startPage-1}">이전</a></span>
			</li>
				</c:if>

			<c:forEach begin="${startPage}" end="${endPage}" var="page">
				<li class='page-item ${curPage == page ? "active":""}'>
					<a class='page-link' href="/space/listPage?page=${page}">${page}</a>
				</li>
			</c:forEach>

			<c:if test="${next }">
				<li class='page-item'>
				<span><a class='page-link' href="/space/listPage?page=${endPage+1}">다음</a></span>
				</li>
			</c:if>
		</ul>
	</div>
	
</div>

</body>
</html>