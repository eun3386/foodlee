package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class CommentVO {
	private int commentNum; // 댓글 일련번호
	private int commentId; // 댓글번호
	private int commentSellerId; // 댓글 단 판매자 번호
	private String commentRegId; // 댓글 작성자
	private String commentFtName; // 댓글 단 푸드트럭
	private String commentMenu; // 댓글 단 메뉴
	private int commentMenuId; // 댓글 단 메뉴번호
	private String commentContents; // 댓글 내용
	private Timestamp commentCreatedAt; // 댓글 작성일
	
	public CommentVO() {}

	public CommentVO(int commentNum, int commentId, int commentSellerId, String commentRegId, String commentFtName,
			String commentMenu, int commentMenuId, String commentContents, Timestamp commentCreatedAt) {
		super();
		this.commentNum = commentNum;
		this.commentId = commentId;
		this.commentSellerId = commentSellerId;
		this.commentRegId = commentRegId;
		this.commentFtName = commentFtName;
		this.commentMenu = commentMenu;
		this.commentMenuId = commentMenuId;
		this.commentContents = commentContents;
		this.commentCreatedAt = commentCreatedAt;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public int getCommentSellerId() {
		return commentSellerId;
	}

	public void setCommentSellerId(int commentSellerId) {
		this.commentSellerId = commentSellerId;
	}

	public String getCommentRegId() {
		return commentRegId;
	}

	public void setCommentRegId(String commentRegId) {
		this.commentRegId = commentRegId;
	}

	public String getCommentFtName() {
		return commentFtName;
	}

	public void setCommentFtName(String commentFtName) {
		this.commentFtName = commentFtName;
	}

	public String getCommentMenu() {
		return commentMenu;
	}

	public void setCommentMenu(String commentMenu) {
		this.commentMenu = commentMenu;
	}

	public int getCommentMenuId() {
		return commentMenuId;
	}

	public void setCommentMenuId(int commentMenuId) {
		this.commentMenuId = commentMenuId;
	}

	public String getCommentContents() {
		return commentContents;
	}

	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}

	public Timestamp getCommentCreatedAt() {
		return commentCreatedAt;
	}

	public void setCommentCreatedAt(Timestamp commentCreatedAt) {
		this.commentCreatedAt = commentCreatedAt;
	}

	@Override
	public String toString() {
		return "CommentVO [commentNum=" + commentNum + ", commentId=" + commentId + ", commentSellerId="
				+ commentSellerId + ", commentRegId=" + commentRegId + ", commentFtName=" + commentFtName
				+ ", commentMenu=" + commentMenu + ", commentMenuId=" + commentMenuId + ", commentContents="
				+ commentContents + ", commentCreatedAt=" + commentCreatedAt + "]";
	}

	
}
