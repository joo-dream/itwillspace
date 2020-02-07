<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<%-- <h5>${totalPost}개의 공간</h5> --%>
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
	
	<!-- 페이지 번호 -->
	<div>
		
			<ul class="pagination justify-content-center">
		
				<!-- prev 버튼 -->
				<li id="page-prev" class="page-item">
					<a class='page-link' href="listPage${pageMaker.makeQuery(pageMaker.startPage-1, false)}" aria-label="Prev">
						<span aria-hidden="true">이전</span>
					</a>
				</li>
			
			<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <li id="page${idx}" class="page-item">
				    <a class='page-link' href="listPage${pageMaker.makeQuery(idx, true)}">
				    	<!-- 시각 장애인을 위한 추가 -->
				      	<span>${idx}<span class="sr-only">(current)</span></span>
				    </a>
			    </li>
			</c:forEach>
			
			<!-- next 버튼 -->
			<li id="page-next" class="page-item">
			    <a class='page-link' href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1, false)}" aria-label="Next">
			    	<span aria-hidden="true">다음</span>
			    </a>
			</li>
			
			</ul>
		
	</div>
	
<script>
	$(function(){
		//perPageNum select 박스 설정
		setPerPageNumSelect();
		//searchType select 박스 설정
		setSearchTypeSelect();
		
		//등록, 삭제 후 문구 처리
		var result = '${result}';
		$(function(){
			if(result === 'registerOK'){
				$('#registerOK').removeClass('hidden');
				$('#registerOK').fadeOut(2000);
			}
			if(result === 'removeOK'){
				$('#removeOK').removeClass('hidden');
				$('#removeOK').fadeOut(2000);
			}
		})
		
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
			window.location.href = "listPage?page="+thisPage+"&perPageNum="+$perPageSel.val();
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
			var url = "listPage?page=1"
				+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
				+ "&searchType=" + searchTypeVal
				+ "&keyword=" + encodeURIComponent(keywordVal);
			window.location.href = url;
		})
	}
</script>

</body>
</html>