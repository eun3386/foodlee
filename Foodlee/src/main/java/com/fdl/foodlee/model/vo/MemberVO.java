package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class MemberVO {
	private int id; // 회원번호 ⇔ int mb_id <<PK>> AI(AutoIncrement)
	private String type; // 회원구분
	private String login; // 아이디 ⇔ varchar(12) login <<UQ>> NN
	private String password; // 비밀번호 ⇔ varchar(24) password NN
	private String name; // 이름 ⇔ varchar(12) name NN
	private String gender; // 성별 ⇔ varchar(4) gender
	private int age; // 나이 ⇔ int age
	private String residentRN; // 주민번호 Resident Registration Number, RRN ⇔  varchar(13) resident_rn
	private String email; // 이메일 ⇔  varchar(24) email 
	private String phoneNumber; // 연락처 ⇔ varchar(12) phone_number NN
	private String address; // 주소 ⇔ varchar(128) address
	private Timestamp joinedAt; // 가입날짜 ⇔ timestamp joined_at
	private Timestamp updatedAt; // 수정날짜 ⇔ timestamp updated_at
	private Timestamp loginTime; // 로그인일자 ⇔ timestamp login_time
	private Timestamp logoutTime; // 로그아웃일자 ⇔ timestamp logout_time
	
	public MemberVO() {}
	public MemberVO(String login, String password, String name, String gender, int age, String residentRN, String email,
			String phoneNumber, String address) {
		this(0, "member", login, password, name, gender, age, residentRN, email, phoneNumber, address, null, null, null, null);
	}
	public MemberVO(int id, String type, String login, String password, String name, String gender, int age, String residentRN,
			String email, String phoneNumber, String address, Timestamp joinedAt, Timestamp updatedAt,
			Timestamp loginTime, Timestamp logoutTime) {
		super();
		this.id = id;
		this.type = type;
		this.login = login;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.residentRN = residentRN;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.joinedAt = joinedAt;
		this.updatedAt = updatedAt;
		this.loginTime = loginTime;
		this.logoutTime = logoutTime;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", type=" + type + ", login=" + login + ", password=" + password + ", name="
				+ name + ", gender=" + gender + ", age=" + age + ", residentRN=" + residentRN + ", email=" + email
				+ ", phoneNumber=" + phoneNumber + ", address=" + address + ", joinedAt=" + joinedAt + ", updatedAt="
				+ updatedAt + ", loginTime=" + loginTime + ", logoutTime=" + logoutTime + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getResidentRN() {
		return residentRN;
	}
	public void setResidentRN(String residentRN) {
		this.residentRN = residentRN;
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
	
	
	
}
