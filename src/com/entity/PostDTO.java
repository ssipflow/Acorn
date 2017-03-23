package com.entity;

public class PostDTO {

	private int idx;
	private String userid;
	private String style;
	private String photo;
	private String content;
	private String writeday;
	
	public PostDTO(int idx, String userid, String style, String photo, String content, String writeday) {
		super();
		this.idx = idx;
		this.userid = userid;
		this.style = style;
		this.photo = photo;
		this.content = content;
		this.writeday = writeday;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteday() {
		return writeday;
	}

	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}

	@Override
	public String toString() {
		return "PostDTO [idx=" + idx + ", userid=" + userid + ", style=" + style + ", photo=" + photo + ", content="
				+ content + ", writeday=" + writeday + "]";
	}
}
