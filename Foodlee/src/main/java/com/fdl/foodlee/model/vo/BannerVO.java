package com.fdl.foodlee.model.vo;

import java.sql.Timestamp;

public class BannerVO {
	private int bannerId; // 푸드트럭 번호 <<FK>>
	private int adPrice; // 광고금액
	private String adImg; // 광고 이미지
	private Timestamp adStartDate; // 적용 시작 기간
	private Timestamp adEndDate; // 적용 종료 기간
	private int adWaiting; // 신청 대기
	private int sellerId; // 판매자 아이디 <<FK>>
	
	public BannerVO() {}
	
	public BannerVO(int adPrice, String adImg, Timestamp adStartDate, int adWaiting, int sellerId) {
		this(adPrice, adImg, adStartDate, null, adWaiting, sellerId);
	}
	public BannerVO(int adPrice, String adImg, Timestamp adStartDate, Timestamp adEndDate, int adWaiting,
			int sellerId) {
		this(0, adPrice, adImg, adStartDate, adEndDate, adWaiting, sellerId);
		
	}
	
	public BannerVO(int bannerId, int adPrice, String adImg, Timestamp adStartDate, Timestamp adEndDate, int adWaiting,
			int sellerId) {
		super();
		this.bannerId = bannerId;
		this.adPrice = adPrice;
		this.adImg = adImg;
		this.adStartDate = adStartDate;
		this.adEndDate = adEndDate;
		this.adWaiting = adWaiting;
		this.sellerId = sellerId;
	}

	public int getBannerId() {
		return bannerId;
	}

	public void setBannerId(int bannerId) {
		this.bannerId = bannerId;
	}

	public int getAdPrice() {
		return adPrice;
	}

	public void setAdPrice(int adPrice) {
		this.adPrice = adPrice;
	}

	public String getAdImg() {
		return adImg;
	}

	public void setAdImg(String adImg) {
		this.adImg = adImg;
	}

	public Timestamp getAdStartDate() {
		return adStartDate;
	}

	public void setAdStartDate(Timestamp adStartDate) {
		this.adStartDate = adStartDate;
	}

	public Timestamp getAdEndDate() {
		return adEndDate;
	}

	public void setAdEndDate(Timestamp adEndDate) {
		this.adEndDate = adEndDate;
	}

	public int getAdWaiting() {
		return adWaiting;
	}

	public void setAdWaiting(int adWaiting) {
		this.adWaiting = adWaiting;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	@Override
	public String toString() {
		return "BannerVO [bannerId=" + bannerId + ", adPrice=" + adPrice + ", adImg=" + adImg + ", adStartDate="
				+ adStartDate + ", adEndDate=" + adEndDate + ", adWaiting=" + adWaiting + ", sellerId=" + sellerId
				+ "]";
	}
	
}
