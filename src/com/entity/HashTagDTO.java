package com.entity;

public class HashTagDTO {

	private String hashtag;
	private int idx;
	private int cmntIdx;
	
	public HashTagDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public HashTagDTO(String hashtag, int idx, int cmntIdx) {
		super();
		this.hashtag = hashtag;
		this.idx = idx;
		this.cmntIdx = cmntIdx;
	}
	
	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCmntIdx() {
		return cmntIdx;
	}

	public void setCmntIdx(int cmntIdx) {
		this.cmntIdx = cmntIdx;
	}

	@Override
	public String toString() {
		return "HashTagDTO [hashtag=" + hashtag + ", idx=" + idx + ", cmntIdx=" + cmntIdx + "]";
	}
}
