package com.fdl.foodlee.service.inf;

import java.util.List;

import com.fdl.foodlee.model.vo.EventAnswerVO;
import com.fdl.foodlee.model.vo.EventVO;


public interface IEventAnswerSVC {
//	answer_add	
	boolean answerAdd(EventAnswerVO evAs);
	boolean answerAdd(String evAsReply, int eventId, int memberId);
//	answer_list /all
	List<EventAnswerVO> answerList();
//	answer_list /event id	
	List<EventAnswerVO> answerListForEvent(int eventId);
//	answer_compassion	
	int increaseCompassion(int asId, int memberId);
//	answer_select_one
	EventAnswerVO answerSelectOne(int evAsId);
//	answer_update
	boolean answerUpdate(EventAnswerVO evAs);
//	answer_remove
	boolean answerRemove(int evAsId);
//  answer_count /all
	public Integer[] checkNumberOfAnswers(
			List<EventVO> evList);
//	int[] checkNumberOfAnswers();
//	List<Integer> checkNumberOfAnswers();
//	List<Short> checkNumberOfAnswers();
//  answer_count /event id
	int checkNumberOfAnswersForEvent(int eventId);
//	answer_count /member id
	int checkNumberOfAnswersForMember(int memberId);
}
