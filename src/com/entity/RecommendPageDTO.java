package com.entity;

import java.util.HashMap;
import java.util.List;

public class RecommendPageDTO {

	List<HashMap<String, Object>> resultList;
	
	private int totalRecord;
	private int curPageNum;
	private int perPage = 4;
	
	public List<HashMap<String, Object>> getResultList() {
		return resultList;
	}

	public void setResultList(List<HashMap<String, Object>> resultList) {
		this.resultList = resultList;
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
