package com.fdl.foodlee.model.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

import com.fdl.foodlee.model.dao.inf.IOrderDAO;
import com.fdl.foodlee.model.vo.OrderVO;

public class OrderMysqlDAOImpl implements IOrderDAO {
	
	public static final String SQL_ORDER_NEW = "insert into order"
			+ " values(0, ?, ?, ?, ?, ?, ?, '1', '')";
	public static final String SQL_ORDER_CANCEL_MEMBER = "update order set order_state='2'"
			+ " where order_id=?";
	public static final String SQL_ORDER_MEMBER_LIST = "select * from order where login=?";
	public static final String SQL_ORDER_RECEIPT = "update order set order_state='3'"
			+ " where order_id=?";
	public static final String SQL_ORDER_REJECTION = "update order set order_state='4'"
			+ ", order_reason=? where order_id=?";
	public static final String SQL_ORDER_CANCEL_SELLER = "update order set order_state='5'"
			+ ", order_reason=? where order_id=?";
	public static final String SQL_ORDER_SELLER_LIST = "select * from order where seller_id=?";
	public static final String SQL_ORDER_SHOW_ONE = "select * from order where order_id=?";
	
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
	public boolean memberOrderCancel(int id) {
		int r = jtem.update(SQL_ORDER_CANCEL_MEMBER, id); 
		return r == 1;
	}

	@Override
	public List<OrderVO> memberOrderList(String login) {
		return jtem.query(SQL_ORDER_MEMBER_LIST,
		 		 BeanPropertyRowMapper.newInstance(OrderVO.class), login);
	}

	@Override
	public boolean sellerOrderReceipt(int id) {
		int r = jtem.update(SQL_ORDER_RECEIPT, id); 
		return r == 1;
	}

	@Override
	public boolean sellerOrderRejection(int id, String reason) {
		int r = jtem.update(SQL_ORDER_REJECTION, id, reason); 
		return r == 1;
	}
	
	@Override
	public boolean sellerOrderCancel(int id, String reason) {
		int r = jtem.update(SQL_ORDER_CANCEL_SELLER, id, reason); 
		return r == 1;
	}

	@Override
	public List<OrderVO> sellerOrderList(int sellerId) {
		return jtem.query(SQL_ORDER_MEMBER_LIST,
		 		 BeanPropertyRowMapper.newInstance(OrderVO.class), sellerId);
	}

	@Override
	public OrderVO showOneOrder(int id) {
		return jtem.queryForObject(SQL_ORDER_SHOW_ONE,
		 		 BeanPropertyRowMapper.newInstance(OrderVO.class), id);
	}

}
