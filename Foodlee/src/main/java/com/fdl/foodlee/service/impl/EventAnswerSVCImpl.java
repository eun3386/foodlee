package com.fdl.foodlee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IEventAnswerDAO;
import com.fdl.foodlee.model.vo.EventAnswerVO;
import com.fdl.foodlee.model.vo.EventVO;
import com.fdl.foodlee.service.inf.IEventAnswerSVC;


@Service
public class EventAnswerSVCImpl implements IEventAnswerSVC {
	@Autowired
	@Qualifier("mybatisEvAsRepo")
	private IEventAnswerDAO evAsDao;
	
	@Override
	public int answerAdd(EventAnswerVO evAs) {
		if( evAs == null || evAs.getEvAsReply() == null || 
				evAs.getEvAsReply().isEmpty() )
//				||
//				evAs.getEvAsReply().length() <= 10 )
			return 0; // 의도적 에러 발생...
		return evAsDao.answerAdd(evAs);
	}

	@Override
	public boolean answerAdd(String evAsReply, int eventId, int memberId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<EventAnswerVO> answerList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventAnswerVO> answerListForEvent(int eventId) {
		// TODO Auto-generated method stub
		return evAsDao.answerListForEvent(eventId);
	}

	@Override
	public int increaseCompassion(int asId, int memberId) {
		return 0;
	}

	@Override
	public EventAnswerVO answerSelectOne(int evAsId) {
		// TODO Auto-generated method stub
		return evAsDao.answerSelectOne(evAsId);
	}

	@Override
	public boolean answerUpdate(EventAnswerVO evAs) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean answerRemove(int evAsId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Integer[] checkNumberOfAnswers(List<EventVO> evList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkNumberOfAnswersForEvent(int eventId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkNumberOfAnswersForMember(int memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
