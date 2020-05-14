package com.fdl.foodlee.model.vo;

public class CommentVO {
	private int commentId; // 댓글번호
	private String commentFtName; // 댓글 단 푸드트럭
	private String commentMenu; // 댓글 단 메뉴
	private int commentMenuId; // 댓글 단 메뉴번호
	private String commentContents; // 댓글 내용
	
	public CommentVO() {}

	public CommentVO(int commentId, String commentFtName, String commentMenu, int commentMenuId,
			String commentContents) {
		super();
		this.commentId = commentId;
		this.commentFtName = commentFtName;
		this.commentMenu = commentMenu;
		this.commentMenuId = commentMenuId;
		this.commentContents = commentContents;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
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

	@Override
	public String toString() {
		return "CommentVO [commentId=" + commentId + ", commentFtName=" + commentFtName + ", commentMenu=" + commentMenu
				+ ", commentMenuId=" + commentMenuId + ", commentContents=" + commentContents + "]";
	}
	
	
}
