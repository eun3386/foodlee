package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

/*
- int sellerId <<PK>> 판매자 번호 ⇔  int seller_id <<PK>>  AI(AutoIncrement)
- String login <<UQ>> 아이디 ⇔  varchar(12) login <<UQ>> NN
- String password 비밀번호 ⇔  varchar(24) password NN
- String name 이름 ⇔  varchar(12) name NN
- String gender 성별 ⇔  varchar() gender
- String rRN 주민번호 // Resident Registration Number, RRN
	⇔  varchar() rrn
- String email 이메일 ⇔ varchar() email
- String phoneNumber 연락처 ⇔ varchar() phone_number NN
- String address 주소 ⇔ varchar() address
- timestamp joinedAt 가입날짜 ⇔ timestamp joined_at
- timestamp updatedAt 수정날짜 ⇔ timestamp updated_at
- String cRN 사업자등록번호 Company Registration Number, CRN ⇔ varchar() crn
 */
public class SellerVO {
	private int sellerId; // <<PK>> 판매자 번호 ⇔  int seller_id <<PK>>  AI(AutoIncrement)
	private String login; // <<UQ>> 아이디 ⇔  varchar(12) login <<UQ>> NN
	private String password; // 비밀번호 ⇔  varchar(24) password NN
	private String name; // 이름 ⇔  varchar(12) name NN
	private String gender; // 성별 ⇔  varchar() gender
	private String rRN; // 주민번호 Resident Registration Number, RRN ⇔ varchar() rrn
	private String email; // 이메일 ⇔ varchar() email
	private String phoneNumber; // 연락처 ⇔ varchar() phone_number NN
	private String address; // 주소 ⇔ varchar() address
	private Timestamp joinedAt; // 가입날짜 ⇔ timestamp joined_at
	private Timestamp updatedAt; // 수정날짜 ⇔ timestamp updated_at
	private String cRN; // 사업자등록번호 Company Registration Number, CRN ⇔ varchar() crn
	
	public SellerVO() {}
	public SellerVO(String login, String password, String name, String gender, String rRN, String email,
			String phoneNumber, String address, String cRN) {
		this(0, login, password, name, gender, rRN, email, phoneNumber, address, null, null, cRN);
	}
	public SellerVO(int sellerId, String login, String password, String name, String gender, String rRN, String email,
			String phoneNumber, String address, Timestamp joinedAt, Timestamp updatedAt, String cRN) {
		super();
		this.sellerId = sellerId;
		this.login = login;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.rRN = rRN;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.joinedAt = joinedAt;
		this.updatedAt = updatedAt;
		this.cRN = cRN;
	}

	@Override
	public String toString() {
		return "SellerVO [sellerId=" + sellerId + ", login=" + login + ", password=" + password + ", name=" + name
				+ ", gender=" + gender + ", rRN=" + rRN + ", email=" + email + ", phoneNumber=" + phoneNumber
				+ ", address=" + address + ", joinedAt=" + joinedAt + ", updatedAt=" + updatedAt + ", cRN=" + cRN + "]";
	}
	
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
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
	public String getrRN() {
		return rRN;
	}
	public void setrRN(String rRN) {
		this.rRN = rRN;
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
	public String getcRN() {
		return cRN;
	}
	public void setcRN(String cRN) {
		this.cRN = cRN;
	}
	
	
}
