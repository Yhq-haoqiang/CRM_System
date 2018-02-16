package com.yhq.utils;

import java.util.List;

public class PageBean<T> {
	// 存放查询到的分页的数据
	private List<T> pageInfo = null;
	// 当前页
	private int currentPage;
	// 总页数
	private int totalPage;
	// 每页显示几条记录
	private int numOfPage = 2;
	// 总记录数
	private long totalCount;

	public List<T> getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(List<T> pageInfo) {
		this.pageInfo = pageInfo;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getNumOfPage() {
		return numOfPage;
	}

	public void setNumOfPage(int numOfPage) {
		this.numOfPage = numOfPage;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

}