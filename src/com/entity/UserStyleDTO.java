package com.entity;

public class UserStyleDTO {

	private String userid;
	private String style;
	
	public UserStyleDTO(String userid, String style) {
		super();
		this.userid = userid;
		this.style = style;
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

	@Override
	public String toString() {
		return "UserStyleDTO [userid=" + userid + ", style=" + style + "]";
	}
}
