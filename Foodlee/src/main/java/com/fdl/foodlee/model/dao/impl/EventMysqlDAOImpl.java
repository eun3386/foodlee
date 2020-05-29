package com.fdl.foodlee.model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IEventDAO;
import com.fdl.foodlee.model.vo.EventVO;
@Repository
public class EventMysqlDAOImpl implements IEventDAO {
	@Autowired
	private JdbcTemplate jtem;
	
	public static final String SQL_EVENT_READ_INC = 
			"update events set event_read_count"
			+ " = event_read_count + 1 where event_id = ?";
		public static final String SQL_EVENT_SHOWALL =
			"select * from events order by created_at desc";
		public static final String SQL_EVENT_SHOWONE =
			"select * from events where event_id = ?";
		public static final String SQL_EVENT_INSERT_VO
			//= "insert into values(),(),()";
			= "INSERT INTO events VALUES (null,?,?,?,?,?,now(),null,0,0,NULL,NULL,?)";
			//insert into events values(null,'2020-05-07','2020-06-30',1,'테스트','이벤트테스트',0,0,null,null,null,now(),null);
			//*="INSERT INTO events VALUES (1,'밤도깨비야시장','잠정 중단','2020-05-28','0000-00-00',1,now(),null,0,0,NULL,NULL,NULL)";
		public static final String SQL_EVENT_SHOWALL_PG
			= "SELECT * FROM events order by created_at "
					+ "desc limit ?, ?";
		public static final String SQL_CHECK_EVENT_NUMBERS
			= "select count(id) as cnt from events";
		public static final String SQL_SEARCH_TITLE 
			= "SELECT * FROM events where title like " +
			"concat('%',?,'%') ";
		public static final String SQL_SEARCH_ANYCOLUMN 
		= "SELECT * FROM events where %s like " +
			"concat('%%',?,'%%') %s";
		public static final String SQL_CHECK_SEARCH_ANYCOLUMN 
		= "SELECT count(*) FROM events where %s like " +
			"concat('%%',?,'%%')";
		public static final String SQL_SEARCH_ANYCOLUMN_PG 
		= "SELECT * FROM events where %s like " +
			"concat('%%',?,'%%') %s limit ?, ?";
				//"'%?%' order by created_at desc";	
				//"'%'중고'%' order by created_at desc";
		public static final String SQL_SEARCH_ALL  
		= "SELECT * FROM events where "
				+ "title like concat('%%',?,'%%') or "
				+ "content like concat('%%',?,'%%') or "
				+ "tags like concat('%%',?,'%%') %s";
		public static final String SQL_CHECK_SEARCH_ALL  
		= "SELECT count(*) FROM events where "
				+ "title like concat('%',?,'%') or "
				+ "content like concat('%',?,'%') or "
				+ "tags like concat('%',?,'%')";
		public static final String SQL_SEARCH_ALL_PG  
		= "SELECT * FROM events where "
				+ "title like concat('%%',?,'%%') or "
				+ "content like concat('%%',?,'%%') or "
				+ "tags like concat('%%',?,'%%') %s"
				+ " limit ?, ?";
		public static final String SQL_EVENT_UPDATE
		= "update events set title=?, content=?, tags=? ,updated_at = now() where id = ?";
		
	@Override
	public boolean insertNewEvent(EventVO ev) {
		int r = jtem.update(SQL_EVENT_INSERT_VO, ev.getEventStartDate(), ev.getEventEndDate(), 
							ev.getEventTitle(), ev.getEventContent());
		return r==1;
	}
	
	@Override
	public int insertNewEventReturnKey(String title, String content, String std, String edd, String filePath) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int insertNewEventReturnKey2(EventVO ev) {
		System.out.println("psc/keyholder...");
		KeyHolder kh = new GeneratedKeyHolder();
		PreparedStatementCreator psc
		 = new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt 
					= con.prepareStatement(
							SQL_EVENT_INSERT_VO,
							new String[] {"id"});
				pstmt.setString(1, ev.getEventTitle());
				pstmt.setString(2, ev.getEventContent());
//				java.sql.Date std = new java.sql.Date(ev.getEventStartDate().getTime());
//				java.sql.Date edd = null;
//				if(ev.getEventEndDate() != null)
//					edd = new java.sql.Date(ev.getEventEndDate().getTime());
				pstmt.setString(3, ev.getEventStartDate());
				if(ev.getEventEndDate().equals("1970-01-01"))
					pstmt.setString(4, null);
				else
					pstmt.setString(4, ev.getEventEndDate());
				pstmt.setInt(5, ev.getEventOngoing());
				pstmt.setString(6, ev.getFilePath());
				return pstmt;
			}
		};
		
		jtem.update(psc, kh);
		Number r = kh.getKey(); // PK
		return r.intValue();
	}

	@Override
	public EventVO selectOneEvent(int evId) {
		return jtem.queryForObject(SQL_EVENT_SHOWONE,
				BeanPropertyRowMapper
				.newInstance(EventVO.class), evId);
	}

	@Override
	public boolean likeEvent(int evId, int mbId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateEvent(String eventTitle, String eventContent, String eventStartDate, 
			boolean eventOngoing) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean increaseReadCount(int id) {
		int r = jtem.update(SQL_EVENT_READ_INC, id);
		return r==1;
	}

	@Override
	public boolean isAlreadyLikedMembers(int evId, int mbId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addLikeMembers(int evId, int mbId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int checkNumberOfLikes(int evId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean deleteEvent(int evId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<EventVO> showAllEvents() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> showAllEvents(boolean order) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> showAllEvents(int offset, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> showAllEvents(int offset, int limit, boolean order) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> showAllEvents(int offset, int limit, boolean order, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> showAllEvents(String keyword, int offset, int limit, boolean order, Date startDate,
			Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkNumberOfEvents() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<EventVO> searchEventForTitle(String keyword, String target, String orderBy) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> searchEventForContent(String keyword, String target, String orderBy) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> searchEventForTags(String keyword, String target, String orderBy) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> searchEventForAll(String keyword, String target, String orderBy) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> searchEventForColumn(String keyword, String target, String orderBy) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
