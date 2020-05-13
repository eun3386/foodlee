package com.fdl.foodlee.model.vo;

public class OrderVO {
	private int orderId; // 주문번호 <<PK>>
	private String login; // 주문한 사람의 아이디 <<FK>>
	private int sellerId; // 판매자 번호 <<FK>>
	private String orderName; // 주문한 메뉴 이름 (,)구분
	private String orderNumber; // 주문한 메뉴 개수 (,)구분
	private String orderPrice; // 주문한 메뉴의 가격 (,)구분
	private int orderPriceSum; // 주문한 메뉴의 총가격
	private int orderState; // 주문 상황 (1 회원 주문 2 회원 취소 3 판매자 주문 접수 4 판매자 주문 거절 5 판매자 주문 취소)
	private String orderReason; // 판매자 주문 취소/거절 사유

	public OrderVO() {}

	public OrderVO(int orderId, String login, int sellerId, String orderName, String orderNumber, String orderPrice,
			int orderPriceSum, int orderState) {
		this.orderId = orderId;
		this.login = login;
		this.sellerId = sellerId;
		this.orderName = orderName;
		this.orderNumber = orderNumber;
		this.orderPrice = orderPrice;
		this.orderPriceSum = orderPriceSum;
		this.orderState = orderState;
	}
	
	public OrderVO(int orderId, String login, int sellerId, String orderName, String orderNumber, String orderPrice,
			int orderPriceSum, int orderState, String orderReason) {
		this.orderId = orderId;
		this.login = login;
		this.sellerId = sellerId;
		this.orderName = orderName;
		this.orderNumber = orderNumber;
		this.orderPrice = orderPrice;
		this.orderPriceSum = orderPriceSum;
		this.orderState = orderState;
		this.orderReason = orderReason;
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
	
	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
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
	
	public int getOrderState() {
		return orderState;
	}
	
	public void setOrderState(int orderState) {
		this.orderPriceSum = orderState;
	}
	
	public String getOrderReason() {
		return orderReason;
	}
	
	public void setOrderReason(String orderReason) {
		this.orderReason = orderReason;
	}

	@Override
	public String toString() {
		return "OrderVO [orderId=" + orderId + ", login=" + login + ", sellerId=" + sellerId + ", orderName=" + orderName + ", orderNumber="
				+ orderNumber + ", orderPrice=" + orderPrice + ", orderPriceSum=" + orderPriceSum + 
				", orderState" + orderState + ", orderReason=" + orderReason + "]";
	}

}
