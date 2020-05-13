package com.fdl.foodlee.model.dao.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.OrderVO;

public interface IOrderDAO {
	
	// 회원이 주문을 할 수 있다.
	boolean memberNewOrder(OrderVO od);
	
	// 회원이 주문 취소를(주문 접수 전까지) 할 수 있다.
	boolean memberOrderCancel(int id);
	
	// 회원이 주문했던 내역들을 볼 수 있다.
	List<OrderVO> memberOrderList(String login);
	
	// 판매자가 주문을 접수 할 수 있다.
	boolean sellerOrderReceipt(int id);
	
	// 판매자가 주문을 거절(상황에 따라) 할 수 있다.
	boolean sellerOrderRejection(int id, String reason);
	
	// 판매자가 주문을 취소(상황에 따라) 할 수 있다.
		boolean sellerOrderCancel(int id, String reason);
	
	// 판매자가 주문 목록들을 조회 할 수 있다.
	List<OrderVO> sellerOrderList(int sellerId);
	
	// 하나의 주문 내역을 볼 수 있다.
	OrderVO showOneOrder(int id);
	
}
