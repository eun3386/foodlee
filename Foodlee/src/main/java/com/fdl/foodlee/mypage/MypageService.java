package com.fdl.foodlee.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.vo.MemberVO;

@Service
public class MypageService {
	
	@Autowired
	private MypageDao mypageDao;
	
	public int updateMypageInfo (MemberVO mem) {
		return mypageDao.updateMypageInfo(mem);
	}
	
}
