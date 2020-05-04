package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

import com.mysql.fabric.xmlrpc.base.Data;

public class QaVO {
	private int qaId; // 문의번호 <<PK>> AI
	private String login; // 문의 작성자 <<FK>>
	private String title;
	private String qaCountent; //문의내용
	private Timestamp qaCreatedAt; // 문의작성일
	
	public QaVO() {}
	
	public QaVO(String login, String title) {
		this(0, login, title, "", null);
	}
	public QaVO(int qaId, String login, String title, String qaCountent, Timestamp qaCreatedAt) {
		super();
		this.qaId = qaId;
		this.login = login;
		this.title = title;
		this.qaCountent = qaCountent;
		this.qaCreatedAt = qaCreatedAt;
	}

	public int getQaId() {
		return qaId;
	}

	public void setQaId(int qaId) {
		this.qaId = qaId;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getQaCountent() {
		return qaCountent;
	}

	public void setQaCountent(String qaCountent) {
		this.qaCountent = qaCountent;
	}

	public Timestamp getQaCreatedAt() {
		return qaCreatedAt;
	}

	public void setQaCreatedAt(Timestamp qaCreatedAt) {
		this.qaCreatedAt = qaCreatedAt;
	}

	@Override
	public String toString() {
		return "QaVO [qaId=" + qaId + ", login=" + login + ", qaCountent=" + qaCountent + ", qaCreatedAt=" + qaCreatedAt
				+ "]";
	}
}
