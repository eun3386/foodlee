package com.fdl.foodlee.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IEventDAO;
import com.fdl.foodlee.model.vo.EventVO;
import com.fdl.foodlee.model.vo.virtual.EventRowVO;
import com.fdl.foodlee.service.inf.IEventSVC;

@Service
public class EventSVCImpl implements IEventSVC {
	
	@Autowired
	private IEventDAO evDao;

	@Override
	public boolean insertNewEvent(EventVO ev) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean insertNewEvent(String title, String content, String filePath, int memberId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean insertNewEvent(String title, String content, String filePath, String tags, int memberId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int insertNewEventReturnKey(String title, String content, String std, String edd, int onGoing, String filePath) {
		EventVO ev = new EventVO(title, content, std, edd, onGoing, filePath);
		return evDao.insertNewEventReturnKey2(ev);
	}

	@Override
	public EventVO selectOneEvent(int evId) {
		EventVO ev = evDao.selectOneEvent(evId);
		if( ev != null ) {
			if( evDao.increaseReadCount(evId) )
				return ev;
//			else 
//				return null;
		}
		return ev;	
		//return atDao.selectOneArticle(id);
	}

	@Override
	public boolean likeEvent(int evId, int mbId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateEvent(String eventTitle, String eventContent, Date eventStartDate, boolean eventOngoing) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public boolean updateEvent(EventVO ev) {
//		if( ev.getLikeMembers() == null || 
//				ev.getLikeMembers().isEmpty() )
				//return false; // 의도적 에러...
			return evDao.updateEvent(ev);	
	}

	@Override
	public boolean increaseReadCount(int evId) {
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
	public List<EventRowVO> showAllEventsForRow(int pn) {
		return null;
	}

	@Override
	public List<Map<String, Object>> showAllEventsForMap(int pn) {
		return null;
	}

	@Override
	public List<EventVO> showAllEvents(boolean order) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> showAllEvents(int pn) {
		int offset = (pn-1) * PAGE_SIZE;
		List<EventVO> evList
			= evDao.showAllEvents(offset, PAGE_SIZE);
		System.out.println("evsvc: pn "+ pn + 
					" events: pn = " + evList.size());
		return evList;
	}

	@Override
	public int checkMaxPageNumber() {
		int totalRecords = evDao.checkNumberOfEvents();
		int maxPg = totalRecords / PAGE_SIZE + (
				totalRecords % PAGE_SIZE == 0 ?
						0 : 1 );
		return maxPg;
	}

	@Override
	public Map<String, Integer> checkMaxPageNumber(String target, String keyword) {
		int totalRecords = evDao.checkNumberOfEvents(target, keyword);
		int maxPg = totalRecords / PAGE_SIZE + (totalRecords % PAGE_SIZE == 0 ? 0 : 1);
		HashMap<String, Integer> rMap = new HashMap<>();
		rMap.put("totalRecords", totalRecords);
		rMap.put("maxPg", maxPg);
		return rMap;	
	}

	@Override
	public List<EventVO> showAllEvents(String keyword, int pn, Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> searchEvents(String keyword, int pn, String orderCol, boolean order, String target) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventVO> searchEvents(String keyword, int pn, String orderCol, boolean order, String target,
			Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return null;
	}

	


}
