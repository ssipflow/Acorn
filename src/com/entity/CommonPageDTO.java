package com.entity;

import java.util.List;

public class CommonPageDTO {

	private List<PostDTO> list;
	
	private int totalRecord;
	private int curPageNum;
	private int perPage = 4;
	
	public List<PostDTO> getList() {
		return list;
	}
	
	public void setList(List<PostDTO> list) {
		this.list = list;
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
	public int getCurPageNum() {
		return curPageNum;
	}
	
	public void setCurPageNum(int curPageNum) {
		this.curPageNum = curPageNum;
	}
	
	public int getPerPage() {
		return perPage;
	}
	
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
}
