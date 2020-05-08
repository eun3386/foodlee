package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class QnaVO {
	private int qnaId; // 문의번호 <<PK>> AI
	private String login; // 문의 작성자 <<FK>>
	private String qnaCountent; // 문의내용
	private int qnaDepth; // 답글 여부 문의 0 답글 1
	private int qnaPnum; // 답글일 경우 해당 문의번호
	private Timestamp qnaCreatedAt; // 문의 작성일

	public QnaVO() {}
	
	public QnaVO(int qnaId, String login, String qnaCountent, int qnaDepth, Timestamp qnaCreatedAt) {
		this.qnaId = qnaId;
		this.login = login;
		this.qnaCountent = qnaCountent;
		this.qnaDepth = qnaDepth;
		this.qnaCreatedAt = qnaCreatedAt;
	}

	public QnaVO(int qnaId, String login, String qnaCountent, int qnaDepth, int qnaPnum, Timestamp qnaCreatedAt) {
		this.qnaId = qnaId;
		this.login = login;
		this.qnaCountent = qnaCountent;
		this.qnaDepth = qnaDepth;
		this.qnaPnum = qnaPnum;
		this.qnaCreatedAt = qnaCreatedAt;
	}

	public int getQaId() {
		return qnaId;
	}

	public void setQaId(int qnaId) {
		this.qnaId = qnaId;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getQaCountent() {
		return qnaCountent;
	}

	public void setQaCountent(String qnaCountent) {
		this.qnaCountent = qnaCountent;
	}

	public int getQaDepth() {
		return qnaDepth;
	}

	public void setQaDepth(int qnaDepth) {
		this.qnaDepth = qnaDepth;
	}

	public int getQaPnum() {
		return qnaPnum;
	}

	public void setQaPnum(int qnaPnum) {
		this.qnaPnum = qnaPnum;
	}

	public Timestamp getQaCreatedAt() {
		return qnaCreatedAt;
	}

	public void setQaCreatedAt(Timestamp qnaCreatedAt) {
		this.qnaCreatedAt = qnaCreatedAt;
	}

	@Override
	public String toString() {
		return "QaVO [qnaId=" + qnaId + ", login=" + login + ", qnaCountent=" + qnaCountent + ", qnaDepth=" + qnaDepth
				+ ", qnaPnum=" + qnaPnum + ", qnaCreatedAt=" + qnaCreatedAt + "]";
	}

}
