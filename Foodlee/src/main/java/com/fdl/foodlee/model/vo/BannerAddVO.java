package com.fdl.foodlee.model.vo;

public class BannerAddVO {
	private String selNum;
	private String selLogin;
	private String imgPath;
	private int price;
	private String stDay;
	private String edDay;
	
	public BannerAddVO() {}
	
	public BannerAddVO(String selNum, String selLogin, String imgPath, int price, String stDay, String edDay) {
		super();
		this.selNum = selNum;
		this.selLogin = selLogin;
		this.imgPath = imgPath;
		this.price = price;
		this.stDay = stDay;
		this.edDay = edDay;
	}

	public String getSelNum() {
		return selNum;
	}

	public void setSelNum(String selNum) {
		this.selNum = selNum;
	}

	public String getSelLogin() {
		return selLogin;
	}

	public void setSelLogin(String selLogin) {
		this.selLogin = selLogin;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getStDay() {
		return stDay;
	}

	public void setStDay(String stDay) {
		this.stDay = stDay;
	}

	public String getEdDay() {
		return edDay;
	}

	public void setEdDay(String edDay) {
		this.edDay = edDay;
	}

	@Override
	public String toString() {
		return "BannerAddVO [selNum=" + selNum + ", selLogin=" + selLogin + ", imgPath=" + imgPath + ", price=" + price
				+ ", stDay=" + stDay + ", edDay=" + edDay + "]";
	}
}
