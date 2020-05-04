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
	private String gender; // 성별 ⇔  varchar(4) gender
	private String residentRN; // 주민번호 Resident Registration Number, RRN ⇔ varchar(13) resident_rn
	private String email; // 이메일 ⇔ varchar(24) email
	private String phoneNumber; // 연락처 ⇔ varchar(12) phone_number NN
	private String address; // 주소 ⇔ varchar(128) address
	private Timestamp joinedAt; // 가입날짜 ⇔ timestamp joined_at
	private Timestamp updatedAt; // 수정날짜 ⇔ timestamp updated_at
	private String companyRN; // 사업자등록번호 Company Registration Number, CRN ⇔ varchar() company_rn
	
	public SellerVO() {}
	public SellerVO(String login, String password, String name, String gender, String residentRN, String email,
			String phoneNumber, String address, String companyRN) {
		this(0, login, password, name, gender, residentRN, email, phoneNumber, address, null, null, companyRN);
	}
	public SellerVO(int sellerId, String login, String password, String name, String gender, String residentRN, String email,
			String phoneNumber, String address, Timestamp joinedAt, Timestamp updatedAt, String companyRN) {
		super();
		this.sellerId = sellerId;
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
		this.companyRN = companyRN;
	}

	@Override
	public String toString() {
		return "SellerVO [sellerId=" + sellerId + ", login=" + login + ", password=" + password + ", name=" + name
				+ ", gender=" + gender + ", residentRN=" + residentRN + ", email=" + email + ", phoneNumber=" + phoneNumber
				+ ", address=" + address + ", joinedAt=" + joinedAt + ", updatedAt=" + updatedAt + ", companyRN=" + companyRN + "]";
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
	public String getCompanyRN() {
		return companyRN;
	}
	public void setCompanyRN(String companyRN) {
		this.companyRN = companyRN;
	}
	
	
}
