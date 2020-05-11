package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class QnaVO {
	private int qnaId; // 문의번호 <<PK>> AI
	private String login; // 문의 작성자 <<FK>>
	private int sellerId; // 판매자 번호 <<FK>>
	private String qnaCountent; // 문의내용
	private int qnaDepth; // 답글 여부 문의 0 답글 1
	private int qnaPnum; // 답글일 경우 해당 문의번호
	private Timestamp qnaCreatedAt; // 문의 작성일

	public QnaVO() {}
	
	public QnaVO(int qnaId, String login, int sellerId, String qnaCountent, int qnaDepth, Timestamp qnaCreatedAt) {
		this.qnaId = qnaId;
		this.login = login;
		this.sellerId = sellerId;
		this.qnaCountent = qnaCountent;
		this.qnaDepth = qnaDepth;
		this.qnaCreatedAt = qnaCreatedAt;
	}

	public QnaVO(int qnaId, String login, int sellerId, String qnaCountent, int qnaDepth, int qnaPnum, Timestamp qnaCreatedAt) {
		this.qnaId = qnaId;
		this.login = login;
		this.sellerId = sellerId;
		this.qnaCountent = qnaCountent;
		this.qnaDepth = qnaDepth;
		this.qnaPnum = qnaPnum;
		this.qnaCreatedAt = qnaCreatedAt;
	}

	public int getQnaId() {
		return qnaId;
	}

	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}
	
	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public String getQnaCountent() {
		return qnaCountent;
	}

	public void setQnaCountent(String qnaCountent) {
		this.qnaCountent = qnaCountent;
	}

	public int getQnaDepth() {
		return qnaDepth;
	}

	public void setQnaDepth(int qnaDepth) {
		this.qnaDepth = qnaDepth;
	}

	public int getQnaPnum() {
		return qnaPnum;
	}

	public void setQnaPnum(int qnaPnum) {
		this.qnaPnum = qnaPnum;
	}

	public Timestamp getQnaCreatedAt() {
		return qnaCreatedAt;
	}

	public void setQnaCreatedAt(Timestamp qnaCreatedAt) {
		this.qnaCreatedAt = qnaCreatedAt;
	}

	@Override
	public String toString() {
		return "QnaVO [qnaId=" + qnaId + ", login=" + login + ", sellerId=" + sellerId + ", qnaCountent=" + qnaCountent + ", qnaDepth=" + qnaDepth
				+ ", qnaPnum=" + qnaPnum + ", qnaCreatedAt=" + qnaCreatedAt + "]";
	}

}
