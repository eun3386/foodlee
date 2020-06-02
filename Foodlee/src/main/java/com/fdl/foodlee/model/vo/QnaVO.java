package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class QnaVO {
	private int qnaId; // 문의번호 <<PK>> AI
	private String login; // 문의 작성자 <<FK>>
	private int sellerId; // 판매자 번호 <<FK>>
	private String qnaContent; // 문의내용
	private int qnaDepth; // 답글 여부 문의 0 답글 1
	private String qnaPnum; // 답글일 경우 해당 문의번호
	private boolean qnaSecret; // 비밀글 여부
	private Timestamp qnaCreatedAt; // 문의 작성일
	
	private String qnaFoodtruckName; // 은경

	public QnaVO() {}
	
	public QnaVO(int qnaId, String login, int sellerId, String qnaContent, int qnaDepth, int qnaSecret, Timestamp qnaCreatedAt) {
		this.qnaId = qnaId;
		this.login = login;
		this.sellerId = sellerId;
		this.qnaContent = qnaContent;
		this.qnaDepth = qnaDepth;
		this.qnaCreatedAt = qnaCreatedAt;
	}

	public QnaVO(int qnaId, String login, int sellerId, String qnaContent, int qnaDepth, String qnaPnum, boolean qnaSecret, Timestamp qnaCreatedAt) {
		this.qnaId = qnaId;
		this.login = login;
		this.sellerId = sellerId;
		this.qnaContent = qnaContent;
		this.qnaDepth = qnaDepth;
		this.qnaPnum = qnaPnum;
		this.qnaSecret = qnaSecret;
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

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public int getQnaDepth() {
		return qnaDepth;
	}

	public void setQnaDepth(int qnaDepth) {
		this.qnaDepth = qnaDepth;
	}

	public String getQnaPnum() {
		return qnaPnum;
	}

	public void setQnaPnum(String qnaPnum) {
		this.qnaPnum = qnaPnum;
	}

	public boolean isQnaSecret() {
		return qnaSecret;
	}

	public void setQnaSecret(boolean qnaSecret) {
		this.qnaSecret = qnaSecret;
	}

	public Timestamp getQnaCreatedAt() {
		return qnaCreatedAt;
	}

	public void setQnaCreatedAt(Timestamp qnaCreatedAt) {
		this.qnaCreatedAt = qnaCreatedAt;
	}
	
	//은경
	public String getQnaFoodtruckName() {
		return qnaFoodtruckName;
	}

	public void setQnaFoodtruckName(String qnaFoodtruckName) {
		this.qnaFoodtruckName = qnaFoodtruckName;
	}
	//
	
	@Override
	public String toString() {
		return "QnaVO [qnaId=" + qnaId + ", login=" + login + ", sellerId=" + sellerId + ", qnaContent=" + qnaContent + ", qnaDepth=" + qnaDepth
				+ ", qnaPnum=" + qnaPnum + ", qnaSecret=" + qnaSecret + ", qnaCreatedAt=" + qnaCreatedAt + "]";
	}

}
