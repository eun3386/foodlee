package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

/*
- int mbId <<PK>> 회원번호 ⇔ int id <<PK>>  AI(AutoIncrement)
- String login <<UQ>> 아이디 ⇔ varchar(12) login <<UQ>> NN
- String password 비밀번호 ⇔ varchar(24) password NN
- String name 이름 ⇔ varchar(12) name NN
- String gender 성별 ⇔ varchar(4) gender
- String residentRN 주민번호 // Resident Registration Number, resident_rn ⇔  varchar(13) rRN
- String email 이메일 ⇔  varchar(24) email
- String phoneNumber 연락처 ⇔ varchar(12) phone_number NN
- String address 주소 ⇔ varchar(128) address
- timestamp joinedAt 가입날짜 ⇔ timestamp joined_at
- timestamp updatedAt 수정날짜 ⇔ timestamp updated_at
 */
public class MemberVO {
	private int mbId; // <<PK>> 회원번호 ⇔ int id <<PK>>  AI(AutoIncrement)
	private String login; // <<UQ>> 아이디 ⇔ varchar(12) login <<UQ>> NN
	private String password; // 비밀번호 ⇔ varchar(24) password NN
	private String name; // 이름 ⇔ varchar(12) name NN
	private String gender; // 성별 ⇔ varchar(4) gender
	private String residentRN; // 주민번호 // Resident Registration Number, RRN ⇔  varchar(13) rRN
	private String email; // 이메일 ⇔  varchar(24) email
	private String phoneNumber; // 연락처 ⇔ varchar(12) phone_number NN
	private String address; // 주소 ⇔ varchar(128) address
	private Timestamp joinedAt; // 가입날짜 ⇔ timestamp joined_at
	private Timestamp updatedAt; // 수정날짜 ⇔ timestamp updated_at
	
	public MemberVO() {}
	public MemberVO(String login, String password, String name, String gender, String residentRN, String email,
			String phoneNumber, String address) {
		this(0, login, password, name, gender, residentRN, email, phoneNumber, address, null, null);
	}
	public MemberVO(int mbId, String login, String password, String name, String gender, String residentRN, String email,
			String phoneNumber, String address, Timestamp joinedAt, Timestamp updatedAt) {
		super();
		this.mbId = mbId;
		this.login = login;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.residentRN = residentRN;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.joinedAt = joinedAt;
		this.updatedAt = updatedAt;
	}

	@Override
	public String toString() {
		return "MemberVO [mbId=" + mbId + ", login=" + login + ", password=" + password + ", name=" + name + ", gender="
				+ gender + ", residentRN=" + residentRN + ", email=" + email + ", phoneNumber=" + phoneNumber + ", address=" + address
				+ ", joinedAt=" + joinedAt + ", updatedAt=" + updatedAt + "]";
	}
	
	public int getMbId() {
		return mbId;
	}
	public void setMbId(int mbId) {
		this.mbId = mbId;
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
	
	
}
