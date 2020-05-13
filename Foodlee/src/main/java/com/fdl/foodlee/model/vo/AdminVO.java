package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class AdminVO {
	private int adId; // 관리자번호 ⇔ int ad_id <<PK>> 
	private String login; // 아이디 ⇔ varchar(12) login <<UQ>> NN
	private String password; // 비밀번호 ⇔ varchar(24) password NN
	private String email; // 이메일 ⇔  varchar(24) email
	private String phoneNumber; // 연락처 ⇔ varchar(12) phone_number NN
	private String notice; // 공지(인수인계) ⇔ text
	private Timestamp createdAt; // 생성날짜 ⇔ timestamp created_at 
	private Timestamp updatedAt; // 수정날짜 ⇔ timestamp updated_at
	private Timestamp loginTime; // 로그인일자 ⇔ timestamp login_time
	private Timestamp logoutTime; // 로그아웃일자 ⇔ timestamp logout_time
	
	public AdminVO() {}
	public AdminVO(int adId, String login) {
		this(adId, login, "", "", "", "", null, null, null, null);
	}
	public AdminVO(int adId, String login, String password, String email, String phoneNumber, String notice,
			Timestamp createdAt, Timestamp updatedAt, Timestamp loginTime, Timestamp logoutTime) {
		super();
		this.adId = adId;
		this.login = login;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.notice = notice;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.loginTime = loginTime;
		this.logoutTime = logoutTime;
	}
	
	public int getAdId() {
		return adId;
	}
	public void setAdId(int adId) {
		this.adId = adId;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Timestamp getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Timestamp loginTime) {
		this.loginTime = loginTime;
	}
	public Timestamp getLogoutTime() {
		return logoutTime;
	}
	public void setLogoutTime(Timestamp logoutTime) {
		this.logoutTime = logoutTime;
	}
	
	

}
