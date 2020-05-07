package com.fdl.foodlee.model.dao.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.fdl.foodlee.model.dao.inf.IEventDAO;
import com.fdl.foodlee.model.vo.EventVO;

public class EventMysqlDAOImpl implements IEventDAO {
	public static final String SQL_EVENT_READ_INC = 
			"update events set read_count"
			+ " = read_count + 1 where id = ?";
		public static final String SQL_EVENT_SHOWALL =
			"select * from events order by created_at desc";
		public static final String SQL_EVENT_SHOWONE =
			"select * from events where id = ?";
		public static final String SQL_EVENT_INSERT_VO
			//= "insert into values(),(),()";
			= "insert into events values("
				+ "null,?,?,0,0,'',?,?,?,now(),now())";
		
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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public EventVO selectOneEvent(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean likeEvent(int evId, int mbId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateEvent(String eventTitle, String eventContent, Date eventStartDate, boolean eventOngoing,
			Timestamp eventCreatedAt) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean increaseReadCount(int id) {
		// TODO Auto-generated method stub
		return false;
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
	public List<EventVO> showAllEvents(int offset, int limit, boolean order, Date startDate, Date endDate) {
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