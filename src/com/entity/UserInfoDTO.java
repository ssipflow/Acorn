package com.entity;

public class UserInfoDTO {

	private String userid;
	private String pwd;
	private String gender;
	
	public UserInfoDTO(String userid, String pwd, String gender) {
		super();
		this.userid = userid;
		this.pwd = pwd;
		this.gender = gender;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "UserInfoDTO [userid=" + userid + ", pwd=" + pwd + ", gender=" + gender + "]";
	}
}
