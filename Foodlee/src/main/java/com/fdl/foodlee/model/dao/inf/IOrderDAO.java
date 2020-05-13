package com.fdl.foodlee.model.dao.inf;

import com.fdl.foodlee.model.vo.OrderVO;

public interface IOrderDAO {
	
	// 회원이 주문을 할 수 있다.
	boolean new_order(OrderVO od);
	
	// 회원이 주문 취소를(주문 접수 전까지) 할 수 있다.
	boolean order_cancel(int id);
}
