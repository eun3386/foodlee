package com.fdl.foodlee.service.inf;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.fdl.foodlee.model.vo.EventVO;

public interface IEventSVC {
//	- 관리자가 신규 이벤트 게시글을 등록할 수 있다.(+파일업로드..)
//	event_new_form.fdl (get)
//	event_add.fdl (post, proc, dao, param..vo)
	boolean insertNewEvent(EventVO ev);
	
//	- 이벤트 게시글 상세보기 할 수 있다
//		event_show.fdl (get, proc, dao, param?id)
	EventVO selectOneEvent(int evId);
//	- 회원이 이벤트 게시글을 좋아요 할 수 있다
//		event_like.fdl (get, proc, dao, param?atId&mbId..)
	boolean likeEvent(int evId, int mbId);
//	- 관리자가 자신의 게시글을 편집 갱신 할 수 있다
//		event_edit_form.fdl (get, proc, dao, param?id)
//		event_update.fdl (post, proc, dao, param...vo)
	boolean updateEvent(String eventTitle, String eventContent, Date eventStartDate, 
			boolean eventOngoing);
	boolean increaseReadCount(int evId);
	boolean isAlreadyLikedMembers(int evId, int mbId); // lc++
	boolean addLikeMembers(int evId, int mbId); // lc++
	int checkNumberOfLikes(int evId);

//	- 관리자가 자신의 게시글을 삭제 할 수 있다
//		event_remove.fdl (get, proc, dao, param?id)
	boolean deleteEvent(int evId);
//	- 이벤트 게시글 리스트를 조회할 수 있다. (페이지네이션, 정렬, 태그)
//		event_list.fdl (get, proc, dao)
	List<EventVO> showAllEvents();
	List<EventVO> showAllEvents(boolean order);
//		event_list.fdl (get, proc, dao, param?pn&order)
	List<EventVO> showAllEvents(int offset, int limit);
	List<EventVO> showAllEvents(int offset, int limit, boolean order);
	List<EventVO> showAllEvents(int offset, int limit, boolean order, Date startDate, Date endDate);
//	- 이벤트 게시글 리스트를 검색할 수 있다. (페이지네이션, 정렬)
//		event_search.fdl (post, proc, dao, param?pn&order&keyword&날짜 범위..)
	List<EventVO> showAllEvents(String keyword, 
			int offset, int limit, 
		boolean order, Date startDate, Date endDate);
	int checkNumberOfEvents();
	List<EventVO> searchEventForTitle(String keyword, String target, String orderBy);
	List<EventVO> searchEventForContent(String keyword, String target, String orderBy);
	List<EventVO> searchEventForTags(String keyword, String target, String orderBy);
	List<EventVO> searchEventForAll(String keyword, String target, String orderBy);
	List<EventVO> searchEventForColumn(String keyword, String target, String orderBy);
}
