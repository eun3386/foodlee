package com.fdl.foodlee.model.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.ISellerDAO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.MenuVO;
import com.fdl.foodlee.model.vo.OrderVO;
import com.fdl.foodlee.model.vo.SellerVO;

// 빈 자동 등록 : MVC 저장단 처리
@Repository
public class SellerMysqlDAOImpl implements ISellerDAO {
	
	@Autowired
	private SqlSessionTemplate sstem;
	
	private static final String SQL_INSERT_SELLER_CRYPTO 
	= "insert into sellers values(null, 'seller', ?, hex(aes_encrypt(?,?)), "
		+"?, ?, ?, ?, ?, ?, ?, now(), now(), ?, null, null, ?)";
	private static final String SQL_SELLER_DUPCHECK
	= "select count(seller_id) from sellers where login = ?";
	private static final String SQL_LOGIN_AUTH
	= "select login, cast(aes_decrypt(unhex(password),?) as char(32) "
		+ "character set utf8) as pw from sellers where seller_id = ?";
	private static final String SQL_UPDATE_SELLER_LOGIN_TIME
	= "update sellers set login_time=now() where seller_id = ?";
	private static final String SQL_UPDATE_SELLER_LOGOUT_TIME
	= "update sellers set logout_time=now() where seller_id = ?";
	private static final String SQL_SELECT_SELLER_ID 
	= "select * from sellers where seller_id = ?";
	private static final String SQL_SELECT_SELLER_LOGIN 
	= "select * from sellers where login = ?";
	private static final String SQL_SELECT_SELLER_PK
	= "select seller_id from sellers where login = ?";
	private static final String SQL_SELECT_SELLER_FIND_ID
	= "select login from sellers where name = ? && phone_number = ?";
	private static final String SQL_SELECT_SELLER_FIND_PW
	= "select cast(aes_decrypt(unhex(password), ?) as char(32) "
		+ "character set utf8) as pw from sellers where login = ? && email = ?";
	private static final String SQL_UPDATE_SELLER
	= "update sellers set name=?, gender=?, "
		+"age=?, email=?, phone_number=?, address=?, updated_at=now(), company_Rn=? where seller_id = ?";
	private static final String SQL_UPDATE_SELLER_PW
	= "update sellers set password=hex(aes_encrypt(?,?)) where seller_id=?";
	private static final String SQL_DELETE_SELLER
	= "delete from sellers where seller_id = ?";
	
	@Autowired
	private JdbcTemplate jtem;
	
	@Override
	public boolean insertNewSellerWithCrypto(SellerVO sel) {
		int r = jtem.update(SQL_INSERT_SELLER_CRYPTO,
				sel.getLogin(), sel.getPassword(), sel.getLogin(),
				sel.getName(), sel.getGender(), sel.getAge(), sel.getResidentRn(),
				sel.getEmail(), sel.getPhoneNumber(), sel.getAddress(),
				sel.getCompanyRn(), sel.getImgPath() );
		return r == 1;
	}

	@Override
	public boolean isDuplicatedSeller(String login) {
		int r = jtem.queryForObject(SQL_SELLER_DUPCHECK, Integer.class, login);
		return r >= 1;
	}

	@Override
	public String loginAuthenticate(String login, int id) {
		Map<String, Object> rMap = jtem.queryForMap(SQL_LOGIN_AUTH,
				new Object[]{login,id},
				new int[]{Types.VARCHAR, Types.INTEGER} );
		String dbPW = (String) rMap.get("pw");
		return dbPW;
	}

	@Override
	public SellerVO selectOneSeller(int id) {
		try {			
			return jtem.queryForObject(SQL_SELECT_SELLER_ID,
				new RowMapper<SellerVO>() {
					@Override
					public SellerVO mapRow(ResultSet rs, int rowNum) throws SQLException {
						return new SellerVO(
								rs.getInt("seller_id"),
								rs.getString("type"),
								rs.getString("login"),
								rs.getString("password"),
								rs.getString("name"),
								rs.getString("gender"),
								rs.getInt("age"),
								rs.getString("resident_Rn"),
								rs.getString("email"),
								rs.getString("phone_number"),
								rs.getString("address"), 
								rs.getTimestamp("joined_at"),
								rs.getTimestamp("updated_at"),
								rs.getString("company_Rn"),
								rs.getTimestamp("login_time"),
								rs.getTimestamp("logout_time"),
								rs.getString("img_path"));
					}
				} , id);
		} catch (DataAccessException e) {
			System.out.println("dao / 판매자 회원 편집폼 실패." + id );
			return null;
		} // 익명객체 방식의 rowmapper 인자로 전달
	}

	@Override
	public SellerVO selectOneSeller(String login) {
		try {
			 SellerVO sel = jtem.queryForObject(SQL_SELECT_SELLER_LOGIN,
						BeanPropertyRowMapper
							.newInstance(SellerVO.class), login);
			 return sel;
		} catch (EmptyResultDataAccessException e) {
			System.out.println(login+ " 회원(판매자) 없음 /dao");
			return null;
		} catch (DataAccessException e) {
			// spring data의 최상위 예외 객체...
			e.printStackTrace();
			return null;
		} // 빈프라퍼티 로우맵퍼
		// Camel낙타VO <==> Snake뱀sql테이블 자동맵핑
	}

	@Override
	public int selectSellerIdbyLogin(String login) {
		return this.jtem.queryForObject
				(SQL_SELECT_SELLER_PK, Integer.class, login);
	}

	@Override
	public boolean updateOneSeller(SellerVO sel) {
		try {
			int r = jtem.update(SQL_UPDATE_SELLER, 
				sel.getName(), sel.getGender(), sel.getAge(), sel.getEmail(), sel.getPhoneNumber(),
				sel.getAddress(), sel.getCompanyRn(), sel.getSellerId() );
			return r == 1;
		} catch (DataAccessException e) {
			System.out.println("dao/ 판매자 회원 정보 갱신 실패 - " + sel.getSellerId());
			return false;
		}
		
	}
	
	@Override
	public boolean updateOneSellerPW(int id, String login, String password) {
		try {
			int r = jtem.update(SQL_UPDATE_SELLER_PW, 
				password, login, id);
			System.out.println("r = "+r);
			return r == 1;
		} catch (DataAccessException e) {
			System.out.println("dao/ 판매자 회원 비밀번호 정보 갱신 실패 - " + id);
			return false;
		}
	}

	@Override
	public boolean deleteOneSeller(int id) {
		int r = jtem.update(SQL_DELETE_SELLER, id);
		return r == 1;
	}

	@Override
	public boolean updateSellerLoginTime(int id) {
		int r = jtem.update(SQL_UPDATE_SELLER_LOGIN_TIME, id);
		return r == 1;
	}

	@Override
	public boolean updateSellerLogoutTime(int id) {
		int r = jtem.update(SQL_UPDATE_SELLER_LOGOUT_TIME, id);
		return r == 1;
	}
	
	@Override
	public List<String> selectSellerLogin(String name, String phoneNumber) {
		List<String> selIdList = jtem.query
				(SQL_SELECT_SELLER_FIND_ID, BeanPropertyRowMapper
						.newInstance(String.class), name, phoneNumber);
		return selIdList;
	}

	@Override
	public String selectSellerPassword(String login, String email) {
		try {
			Map<String, Object> rMap = jtem.queryForMap(SQL_SELECT_SELLER_FIND_PW,
					new Object[]{login,login,email},
					new int[]{Types.VARCHAR, Types.VARCHAR, Types.VARCHAR} );
			String dbPW = (String) rMap.get("pw");
			return dbPW;
		} catch (DataAccessException e) {
			System.out.println("dao / 비밀번호 조회 실패." );
			return null;
		}
	}

	@Override
	public List<FoodtruckVO> showAllFoodtruck(int offset, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderVO> showAllMenu(int offset, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> showAllMemberJoin(MemberVO mv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> showAllMemberJoin(int mbId, String login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SellerVO> showAllSellerJoin(SellerVO sv) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SellerVO> showAllSellerJoin(int mbId, String login) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> showAllJoin() {
		// TODO Auto-generated method stub
		return null;
	}

}