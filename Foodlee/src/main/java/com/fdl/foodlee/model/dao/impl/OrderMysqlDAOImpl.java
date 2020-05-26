package com.fdl.foodlee.model.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IOrderDAO;
import com.fdl.foodlee.model.vo.OrderVO;

@Repository
public class OrderMysqlDAOImpl implements IOrderDAO {
	
	public static final String SQL_ORDER_NEW = "insert into orders"
			+ " values(0, ?, ?, ?, ?, ?, ?, '1', '')";
	public static final String SQL_ORDER_CANCEL_MEMBER = "update orders set order_state='2'"
			+ " where order_id=?";
	public static final String SQL_ORDER_MEMBER_LIST = "select * from orders where login=?";
	public static final String SQL_ORDER_RECEIPT = "update orders set order_state='3'"
			+ " where order_id=? and seller_id=?"; 
	public static final String SQL_ORDER_REJECTION_CANCEL = "update orders set order_state=?"
			+ ", order_reason=? where order_id=? and seller_id=?";
	public static final String SQL_ORDER_SELLER_LIST = "select * from orders where seller_id=?";
	public static final String SQL_ORDER_SHOW_ONE = "select * from orders where order_id=?";
	
	@Autowired
	private JdbcTemplate jtem;
	private SimpleJdbcInsert simIn;
	
	public OrderMysqlDAOImpl() {}
	
	@Autowired
	public OrderMysqlDAOImpl(JdbcTemplate jtem) {
		this.jtem = jtem;		
		this.simIn = new SimpleJdbcInsert(jtem.getDataSource());
		simIn.withTableName("order");
		simIn.usingGeneratedKeyColumns("id");
	}

	@Override
	public boolean memberNewOrder(OrderVO od) {
		int r = jtem.update(SQL_ORDER_NEW,
				od.getLogin(), od.getSellerId(), od.getOrderName(), od.getOrderNumber(),
				od.getOrderPrice(), od.getOrderPriceSum());
		return r == 1; //? true: false;
	}

	@Override
	public boolean memberOrderCancel(int orderId, String login) {
		int r = jtem.update(SQL_ORDER_CANCEL_MEMBER, orderId, login); 
		return r == 1;
	}

	@Override
	public List<OrderVO> memberOrderList(String login) {
		return jtem.query(SQL_ORDER_MEMBER_LIST,
		 		 BeanPropertyRowMapper.newInstance(OrderVO.class), login);
	}

	@Override
	public boolean sellerOrderReceipt(int orderId, int orderState) {
		int r = jtem.update(SQL_ORDER_RECEIPT, orderId, orderState); 
		return r == 1;
	}
	
	@Override
	public boolean sellerOrderRejectionCancel(int orderId, int sellerId, int orderState, String reason) {
		int r = jtem.update(SQL_ORDER_REJECTION_CANCEL, orderState, reason, orderId, sellerId); 
		return r == 1;
	}
	
	@Override
	public List<OrderVO> sellerOrderList(int sellerId) {
		return jtem.query(SQL_ORDER_MEMBER_LIST,
		 		 BeanPropertyRowMapper.newInstance(OrderVO.class), sellerId);
	}

	@Override
	public OrderVO showOneOrder(int orderId) {
		return jtem.queryForObject(SQL_ORDER_SHOW_ONE,
		 		 BeanPropertyRowMapper.newInstance(OrderVO.class), orderId);
	}

}
