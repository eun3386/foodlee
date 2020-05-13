package com.fdl.foodlee.model.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IEventAnswerDAO;
import com.fdl.foodlee.model.vo.EventAnswerVO;
import com.fdl.foodlee.model.vo.EventVO;
@Repository
public class EventAnswerMysqlDAOImpl implements IEventAnswerDAO {
	@Autowired
	private JdbcTemplate jtem;
	
	@Override
	public boolean answerAdd(EventAnswerVO evAs) {
		// TODO Auto-generated method stub
		return false;
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
		return null;
	}

	@Override
	public int increaseCompassion(int asId, int memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public EventAnswerVO answerSelectOne(int evAsId) {
		// TODO Auto-generated method stub
		return null;
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
