package com.fdl.foodlee.model.vo;

public class OrderVO {
	private int orderId; // 주문번호 <<PK>>
	private String login; // 주문한 사람의 아이디 <<FK>>
	private String orderName; // 주문한 메뉴 이름 (,)구분
	private String orderNumber; // 주문한 메뉴 개수 (,)구분
	private String orderPrice; // 주문한 메뉴의 가격 (,)구분
	private int orderPriceSum; // 주문한 메뉴의 총가격

	public OrderVO() {}

	public OrderVO(int orderId, String login, String orderName, String orderNumber, String orderPrice,
			int orderPriceSum) {
		this.orderId = orderId;
		this.login = login;
		this.orderName = orderName;
		this.orderNumber = orderNumber;
		this.orderPrice = orderPrice;
		this.orderPriceSum = orderPriceSum;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getOrderPriceSum() {
		return orderPriceSum;
	}

	public void setOrderPriceSum(int orderPriceSum) {
		this.orderPriceSum = orderPriceSum;
	}

	@Override
	public String toString() {
		return "OrderVO [orderId=" + orderId + ", login=" + login + ", orderName=" + orderName + ", orderNumber="
				+ orderNumber + ", orderPrice=" + orderPrice + ", orderPriceSum=" + orderPriceSum + "]";
	}

}
