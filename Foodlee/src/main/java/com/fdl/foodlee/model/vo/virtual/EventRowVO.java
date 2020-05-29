package com.fdl.foodlee.model.vo.virtual;

import java.sql.Timestamp;

public class EventRowVO {
	private int vId;
	private int vOnGoing;
	private String vTitle;
	private String vStartDate;
	private String vEndDate;
	private Timestamp vCreatedAt;
	private int vLikeCount;
	private int vReadCount;
	
	public EventRowVO() {}
	public EventRowVO(int vId, int vOnGoing, String vTitle, String vStartDate, String vEndDate, Timestamp vCreatedAt,
			int vLikeCount, int vReadCount) {
		super();
		this.vId = vId;
		this.vOnGoing = vOnGoing;
		this.vTitle = vTitle;
		this.vStartDate = vStartDate;
		this.vEndDate = vEndDate;
		this.vCreatedAt = vCreatedAt;
		this.vLikeCount = vLikeCount;
		this.vReadCount = vReadCount;
	}
	public int getvId() {
		return vId;
	}
	public void setvId(int vId) {
		this.vId = vId;
	}
	public int getvOnGoing() {
		return vOnGoing;
	}
	public void setvOnGoing(int vOnGoing) {
		this.vOnGoing = vOnGoing;
	}
	public String getvTitle() {
		return vTitle;
	}
	public void setvTitle(String vTitle) {
		this.vTitle = vTitle;
	}
	public String getvStartDate() {
		return vStartDate;
	}
	public void setvStartDate(String vStartDate) {
		this.vStartDate = vStartDate;
	}
	public String getvEndDate() {
		return vEndDate;
	}
	public void setvEndDate(String vEndDate) {
		this.vEndDate = vEndDate;
	}
	public Timestamp getvCreatedAt() {
		return vCreatedAt;
	}
	public void setvCreatedAt(Timestamp vCreatedAt) {
		this.vCreatedAt = vCreatedAt;
	}
	public int getvLikeCount() {
		return vLikeCount;
	}
	public void setvLikeCount(int vLikeCount) {
		this.vLikeCount = vLikeCount;
	}
	public int getvReadCount() {
		return vReadCount;
	}
	public void setvReadCount(int vReadCount) {
		this.vReadCount = vReadCount;
	}
	
	@Override
	public String toString() {
		return "EventRowVO [vId=" + vId + ", vOnGoing=" + vOnGoing + ", vTitle=" + vTitle + ", vStartDate=" + vStartDate
				+ ", vEndDate=" + vEndDate + ", vCreatedAt=" + vCreatedAt + ", vLikeCount=" + vLikeCount
				+ ", vReadCount=" + vReadCount + "]";
	}
	
}
