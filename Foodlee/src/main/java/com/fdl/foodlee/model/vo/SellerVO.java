package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class SellerVO {
	private int sellerId; // 판매자 번호 ⇔  int seller_id <<PK>> AI(AutoIncrement)
	private String type; // 회원구분
	private String login; // <<UQ>> 아이디 ⇔  varchar(12) login <<UQ>> NN
	private String password; // 비밀번호 ⇔  varchar(24) password NN
	private String name; // 이름 ⇔  varchar(12) name NN
	private String gender; // 성별 ⇔  varchar(4) gender
	private int age; // 나이 ⇔ int age
	private String residentRn; // 주민번호 Resident Registration Number, RRn ⇔ varchar(13) resident_Rn
	private String email; // 이메일 ⇔ varchar(24) email
	private String phoneNumber; // 연락처 ⇔ varchar(12) phone_number NN
	private String address; // 주소 ⇔ varchar(128) address
	private Timestamp joinedAt; // 가입날짜 ⇔ timestamp joined_at
	private Timestamp updatedAt; // 수정날짜 ⇔ timestamp updated_at
	private String companyRn; // 사업자등록번호 Company Registration Number, CRn ⇔ varchar(10) company_Rn
	private Timestamp loginTime; // 로그인일자 ⇔ timestamp login_time
	private Timestamp logoutTime; // 로그아웃일자 ⇔ timestamp logout_time
	private String imgPath;
	
	public SellerVO() {}
	public SellerVO(String login) {
		this(0, null, login, null, null,null, 0, null, null, null, null, null, null, null, null, null, null);
	}
	public SellerVO(String login, String password, String name, String gender, int age, String residentRn, String email,
			String phoneNumber, String address, String companyRn, String imgPath) {
		this(0, "seller", login, password, name, gender, age, residentRn, email, phoneNumber, address, null, null, companyRn, null, null, imgPath);
	}
	public SellerVO(int sellerId, String type, String login, String password, String name, String gender, int age, String residentRn,
			String email, String phoneNumber, String address, Timestamp joinedAt, Timestamp updatedAt, String companyRn,
			Timestamp loginTime, Timestamp logoutTime, String imgPath) {
		super();
		this.sellerId = sellerId;
		this.type = type;
		this.login = login;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.residentRn = residentRn;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.joinedAt = joinedAt;
		this.updatedAt = updatedAt;
		this.companyRn = companyRn;
		this.loginTime = loginTime;
		this.logoutTime = logoutTime;
		this.imgPath = imgPath;
	}
	
	@Override
	public String toString() {
		return "SellerVO [sellerId=" + sellerId + ", type=" + type + ", login=" + login + ", password=" + password
				+ ", name=" + name + ", gender=" + gender + ", age=" + age + ", residentRn=" + residentRn + ", email="
				+ email + ", phoneNumber=" + phoneNumber + ", address=" + address + ", joinedAt=" + joinedAt
				+ ", updatedAt=" + updatedAt + ", companyRn=" + companyRn + ", loginTime=" + loginTime + ", logoutTime="
				+ logoutTime + ", imgPath=" + imgPath + "]";
	}
	
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getResidentRn() {
		return residentRn;
	}
	public void setResidentRn(String residentRn) {
		this.residentRn = residentRn;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Timestamp getJoinedAt() {
		return joinedAt;
	}
	public void setJoinedAt(Timestamp joinedAt) {
		this.joinedAt = joinedAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getCompanyRn() {
		return companyRn;
	}
	public void setCompanyRn(String companyRn) {
		this.companyRn = companyRn;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
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
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
}