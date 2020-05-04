package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class QaVO {
	private int qaId; // 문의번호 <<PK>> AI
	private String login; // 문의 작성자 <<FK>>
	private String qaCountent; // 문의내용
	private int qaDepth; // 답글 여부 문의 0 답글 1
	private int qaPnum; // 답글일 경우 해당 문의번호
	private Timestamp qaCreatedAt; // 문의 작성일

	public QaVO() {}
	
	public QaVO(int qaId, String login, String qaCountent, int qaDepth, Timestamp qaCreatedAt) {
		this.qaId = qaId;
		this.login = login;
		this.qaCountent = qaCountent;
		this.qaDepth = qaDepth;
		this.qaCreatedAt = qaCreatedAt;
	}

	public QaVO(int qaId, String login, String qaCountent, int qaDepth, int qaPnum, Timestamp qaCreatedAt) {
		this.qaId = qaId;
		this.login = login;
		this.qaCountent = qaCountent;
		this.qaDepth = qaDepth;
		this.qaPnum = qaPnum;
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

	public String getQaCountent() {
		return qaCountent;
	}

	public void setQaCountent(String qaCountent) {
		this.qaCountent = qaCountent;
	}

	public int getQaDepth() {
		return qaDepth;
	}

	public void setQaDepth(int qaDepth) {
		this.qaDepth = qaDepth;
	}

	public int getQaPnum() {
		return qaPnum;
	}

	public void setQaPnum(int qaPnum) {
		this.qaPnum = qaPnum;
	}

	public Timestamp getQaCreatedAt() {
		return qaCreatedAt;
	}

	public void setQaCreatedAt(Timestamp qaCreatedAt) {
		this.qaCreatedAt = qaCreatedAt;
	}

	@Override
	public String toString() {
		return "QaVO [qaId=" + qaId + ", login=" + login + ", qaCountent=" + qaCountent + ", qaDepth=" + qaDepth
				+ ", qaPnum=" + qaPnum + ", qaCreatedAt=" + qaCreatedAt + "]";
	}

}
