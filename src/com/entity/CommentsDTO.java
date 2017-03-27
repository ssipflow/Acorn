package com.entity;

public class CommentsDTO {

	private int cmntIdx;
	private String userId;
	private int postIdx;
	private String commented;
	private String writeDay;
	
	public CommentsDTO() {
		// TODO Auto-generated constructor stub
	}

	public CommentsDTO(int cmntIdx, String userId, int postIdx, String commented, String writeDay) {
		super();
		this.cmntIdx = cmntIdx;
		this.userId = userId;
		this.postIdx = postIdx;
		this.commented = commented;
		this.writeDay = writeDay;
	}

	public int getCmntIdx() {
		return cmntIdx;
	}

	public void setCmntIdx(int cmntIdx) {
		this.cmntIdx = cmntIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPostIdx() {
		return postIdx;
	}

	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}

	public String getCommented() {
		return commented;
	}

	public void setCommented(String commented) {
		this.commented = commented;
	}

	public String getWriteDay() {
		return writeDay;
	}

	public void setWriteDay(String writeDay) {
		this.writeDay = writeDay;
	}

	@Override
	public String toString() {
		return "CommentsDTO [cmntIdx=" + cmntIdx + ", userId=" + userId + ", postIdx=" + postIdx + ", commented="
				+ commented + ", writeDay=" + writeDay + "]";
	}
}
