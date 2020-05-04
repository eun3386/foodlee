package com.fdl.foodlee.model.dao.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.fdl.foodlee.model.dao.inf.IEventDAO;
import com.fdl.foodlee.model.vo.EventVO;

public class EventMysqlDAOImpl implements IEventDAO {

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
