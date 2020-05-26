package com.fdl.foodlee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IOrderDAO;
import com.fdl.foodlee.model.vo.OrderVO;
import com.fdl.foodlee.service.inf.IOrderSVC;

@Service
public class OrderSVCImpl implements IOrderSVC {
	
	@Autowired
	private IOrderDAO orderDao;
	
	@Override
	public boolean memberNewOrder(OrderVO order) {
		return orderDao.memberNewOrder(order);
	}

	@Override
	public boolean memberOrderCancel(int orderId, String login) {
		return orderDao.memberOrderCancel(orderId, login);
	}

	@Override
	public List<OrderVO> memberOrderList(String login) {
		return orderDao.memberOrderList(login);
	}

	@Override
	public boolean sellerOrderReceipt(int orderId, int orderState) {
		return orderDao.sellerOrderReceipt(orderId, orderState);
	}

	@Override
	public boolean sellerOrderRejectionCancel(int orderId, int sellerId, int orderState, String reason) {
		return orderDao.sellerOrderRejectionCancel(orderId, sellerId, orderState, reason);
	}

	@Override
	public List<OrderVO> sellerOrderList(int sellerId) {
		return orderDao.sellerOrderList(sellerId);
	}

	@Override
	public OrderVO showOneOrder(int orderId) {
		return orderDao.showOneOrder(orderId);
	}

}
