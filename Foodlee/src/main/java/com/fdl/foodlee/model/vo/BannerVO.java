package com.fdl.foodlee.model.vo;

import java.util.Date;

public class BannerVO {
	private int fodId; // 푸드트럭 번호 <<FK>>
	private int adPrice; // 광고금액
	private Date adStarDate; // 적용 시작 기간
	private String adLocation; // 노출 위치
	
	public BannerVO() {}
	
	public BannerVO(int fodId, int adPrice, Date adStarDate, String adLocation) {
		super();
		this.fodId = fodId;
		this.adPrice = adPrice;
		this.adStarDate = adStarDate;
		this.adLocation = adLocation;
	}
	
	public int getFodId() {
		return fodId;
	}
	
	public void setFodId(int fodId) {
		this.fodId = fodId;
	}
	
	public int getAdPrice() {
		return adPrice;
	}

	public void setAdPrice(int adPrice) {
		this.adPrice = adPrice;
	}

	public Date getAdStarDate() {
		return adStarDate;
	}

	public void setAdStarDate(Date adStarDate) {
		this.adStarDate = adStarDate;
	}

	public String getAdLocation() {
		return adLocation;
	}

	public void setAdLocation(String adLocation) {
		this.adLocation = adLocation;
	}

	@Override
	public String toString() {
		return "BannerVO [adPrice=" + adPrice + ", adStarDate=" + adStarDate + ", adLocation=" + adLocation + "]";
	}
	
}
