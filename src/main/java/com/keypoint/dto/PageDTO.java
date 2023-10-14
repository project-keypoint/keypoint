package com.keypoint.dto;

public class PageDTO {
	private int pageSize;
	private String pageNum;
	private int currentPage;
	private int startRow;
	private int pageBlock;
	private int startPage;
	private int endPage;
	private int count;
	private int pageCount;
	private int endRow;
	
	//검색어 pageDTO에 담아간다.
	private String search;
	private String search2;
	private String search3;
	private String search4;
	private String search5;
	private String search6;
	private String search7;
	private String search8;
	
	private String cusStatus;
	
	//check박스값
	private String check1;
	private String check2;
	private String check3;
	private String check4;
	
	

	private String searchType;				//	검색 타입
	private String searchKeyword;			//	검색 키워드
	
	
	
	
	
	@Override
	public String toString() {
		return "PageDTO [pageSize=" + pageSize + ", pageNum=" + pageNum + ", currentPage=" + currentPage + ", startRow="
				+ startRow + ", pageBlock=" + pageBlock + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", count=" + count + ", pageCount=" + pageCount + ", endRow=" + endRow + ", search=" + search
				+ ", search2=" + search2 + ", search3=" + search3 + ", search4=" + search4 + ", search5=" + search5
				+ ", search6=" + search6 + ", search7=" + search7 + ", search8=" + search8 + ", cusStatus=" + cusStatus
				+ ", check1=" + check1 + ", check2=" + check2 + ", check3=" + check3 + ", check4=" + check4
				+ ", searchType=" + searchType + ", searchKeyword=" + searchKeyword + "]";
	}
	
	
	
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getPageNum() {
		return pageNum;
	}
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSearch2() {
		return search2;
	}
	public void setSearch2(String search2) {
		this.search2 = search2;
	}
	public String getSearch3() {
		return search3;
	}
	public void setSearch3(String search3) {
		this.search3 = search3;
	}
	public String getSearch4() {
		return search4;
	}
	public void setSearch4(String search4) {
		this.search4 = search4;
	}
	public String getSearch5() {
		return search5;
	}
	public void setSearch5(String search5) {
		this.search5 = search5;
	}
	public String getSearch6() {
		return search6;
	}
	public void setSearch6(String search6) {
		this.search6 = search6;
	}
	public String getSearch7() {
		return search7;
	}
	public void setSearch7(String search7) {
		this.search7 = search7;
	}
	public String getSearch8() {
		return search8;
	}
	public void setSearch8(String search8) {
		this.search8 = search8;
	}
	public String getCusStatus() {
		return cusStatus;
	}
	public void setCusStatus(String cusStatus) {
		this.cusStatus = cusStatus;
	}
	public String getCheck1() {
		return check1;
	}
	public void setCheck1(String check1) {
		this.check1 = check1;
	}
	public String getCheck2() {
		return check2;
	}
	public void setCheck2(String check2) {
		this.check2 = check2;
	}
	public String getCheck3() {
		return check3;
	}
	public void setCheck3(String check3) {
		this.check3 = check3;
	}
	public String getCheck4() {
		return check4;
	}
	public void setCheck4(String check4) {
		this.check4 = check4;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	
	
	
	
	
	
	
	
	
}
