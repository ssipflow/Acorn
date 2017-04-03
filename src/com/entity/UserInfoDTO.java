package com.entity;

public class UserInfoDTO {

	private String userid;
	private String pwd;
	private String gender;
	private String fbKey;
	
	public UserInfoDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public UserInfoDTO(String userid, String pwd, String gender, String fbKey) {
		super();
		this.userid = userid;
		this.pwd = pwd;
		this.gender = gender;
		this.fbKey = fbKey;
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
	
	

	public String getFbKey() {
		return fbKey;
	}

	public void setFbKey(String fbKey) {
		this.fbKey = fbKey;
	}

	@Override
	public String toString() {
		return "UserInfoDTO [userid=" + userid + ", pwd=" + pwd + ", gender=" + gender + ", fbKey=" + fbKey + "]";
	}
}
