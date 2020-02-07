package com.itwspace.paging;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
	// 페이징 처리를 위한 속성
	private int page;
	private int perPageNum;
	
	// 검색기능을 위한 속성
	private String searchType;
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Criteria() {
		this.page = 1;
		this.perPageNum = 9;
		
		this.searchType = null;
		this.keyword = null;
	}
	
	// PageStart를 반환
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum > 100) {
			this.perPageNum = 9;
		} else {
			this.perPageNum = perPageNum;
		}
	}
	
	public String makeQuery() {
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", this.perPageNum);
		if(searchType != null) {
			uriComponentsBuilder
				.queryParam("searchType", this.searchType)
				.queryParam("keyword", this.keyword);
		}
		
		return uriComponentsBuilder.build().encode().toString();
		
	}

	@Override
	public String toString() {
		return "PagingCriteria [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType
				+ ", keyword=" + keyword + "]";
	}
	
}
