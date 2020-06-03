package com.fdl.foodlee.model.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.fdl.foodlee.model.dao.inf.IEventAnswerDAO;
import com.fdl.foodlee.model.vo.EventAnswerVO;
import com.fdl.foodlee.model.vo.EventVO;

@Repository("mybatisEvAsRepo")
public class EventAnswerMysqlMybatisDAOImpl implements IEventAnswerDAO {
	@Autowired
	private SqlSessionTemplate sstem;
	
	@Override
	public int answerAdd(EventAnswerVO evAs) {
		System.out.println("mybatis: answerAdd()..");
		int r = this.sstem.insert("IEventAnswerDAO.answerAdd", evAs);
		int ekey = evAs.getEvAsId();
		System.out.println("ekey = " + ekey);
		return r == 1 ? ekey: 0;
	}

	@Override
	public boolean answerAdd(String evAsReply, int eventId, int memberId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<EventAnswerVO> answerList() {
		List<EventAnswerVO> evAsList = sstem.selectList("IEventAnswerDAO.answerList");
		System.out.println("mybatis: answerList()..");
		return evAsList;
	}

	@Override
	public List<EventAnswerVO> answerListForEvent(int eventId) {
		System.out.println("mybatis: answerListForEvent()");
		return sstem.selectList(
			"IEventAnswerDAO.answerListForEvent", eventId);
	}

	@Override
	public int increaseCompassion(int asId, int memberId) {
		System.out.println("mybatis: increaseCompassion()");
		int r = sstem.update("IEventAnswerDAO.increaseCompassion", asId);
		return r;
	}

	@Override
	public EventAnswerVO answerSelectOne(int evAsId) {
		System.out.println("mybatis: answerSelectOne()");
		return sstem.selectOne("IEventAnswerDAO.answerSelectOne", evAsId);
	}

	@Override
	public boolean answerUpdate(EventAnswerVO evAs) {
		System.out.println("mybatis: answerUpdate()");
		System.out.println(evAs);
		int r = sstem.update("IEventAnswerDAO.answerUpdate", evAs);
		System.out.println("r => " + r);
		return r == 1;
	}

	@Override
	public boolean answerRemove(int evAsId) {
		System.out.println("mybatis: answerRemove()");
		int r = sstem.delete("IEventAnswerDAO.answerRemove", evAsId);
		return r == 1;
	}

	@Override
	public Integer[] checkNumberOfAnswers(List<EventVO> evList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkNumberOfAnswersForEvent(int eventId) {
		int cnt = sstem.selectOne("IEventAnswerDAO.checkNumberOfAnswersForEvent", eventId);
		System.out.println("mybatis: checkNumberOfAnswersForEvent()..");
		System.out.println("answer개수: "+ cnt);
		return cnt;
	}

	@Override
	public int checkNumberOfAnswersForMember(int memberId) {
		// TODO Auto-generated method stub
		return 0;
	}
	


}
