package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.OrderVO;

public interface IOrderDAO {
	// 회원이 주문을 할 수 있다.
	boolean memberNewOrder(OrderVO order);
	// 회원이 주문 취소를(주문 접수 전까지) 할 수 있다.
	boolean memberOrderCancel(int orderId, String login);
	// 회원이 주문 내역들을 조회 할 수 있다.
	List<OrderVO> memberOrderList(String login);
	// 판매자가 주문을 접수 할 수 있다.
	boolean sellerOrderReceipt(int orderId, int orderState);
	// 판매자가 주문을 거절,취소(상황에 따라) 할 수 있다.
	boolean sellerOrderRejectionCancel(int orderId, int sellerId, int orderState, String reason);
	// 판매자가 주문 목록을 조회 할 수 있다.
	List<OrderVO> sellerOrderList(int sellerId);
	// 하나의 주문 내역을 볼 수 있다.
	OrderVO showOneOrder(int orderId);
	
	String showOneMid(int orderId);
}
