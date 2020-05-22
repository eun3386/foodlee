package com.fdl.foodlee.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IMemberLikeTruckDAO;
import com.fdl.foodlee.service.inf.IMemberLikeTruckSVC;

@Service
public class MemberLikeTruckSVCImpl implements IMemberLikeTruckSVC {
	
	@Autowired
	@Qualifier("mbLikeTrMybatis")
	IMemberLikeTruckDAO mltDao;

	@Override
	public Map<String, Object> processMemberLike(int tgSr, int sesMb) {
		String oldLikeMemberIds = mltDao.currentLikeMembers(tgSr);
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("seller_id", tgSr);

		Map<String, Object> rMap = new HashMap<String, Object>();

		int like = this.isAlreadyLikedMember(tgSr, sesMb);
		boolean r = false;
		switch (like) {
		case LIKE_MB_FOUND_ONE: // 취소
			oldLikeMemberIds = "";
			pMap.put("mbLikes", oldLikeMemberIds);
			r = mltDao.memberLikeRemove(pMap);
			rMap.put("typeLike", "cancel");
			break;
		case LIKE_MB_FOUND_OTHERS:// 취소
			String temp[] = oldLikeMemberIds.split(LIKE_SEP);
			// List<String> strList = Arrays.asList(temp);
			List<String> strList = new ArrayList<>();
			for (String t : temp)
				strList.add(t);
			//
			for (int i = 0; i < strList.size(); i++) {
				String str = strList.get(i);
				if (str.equals(String.valueOf(sesMb)))
					strList.remove(i);
			}
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < strList.size(); i++) {
				sb.append(strList.get(i));
				if (i < strList.size() - 1)
					sb.append(LIKE_SEP);
			}
			pMap.put("mbLikes", sb.toString());
			r = mltDao.memberLikeRemove(pMap);
			rMap.put("typeLike", "cancel");
			break;
		case LIKE_MB_EMPTY:// 추가
			oldLikeMemberIds = String.valueOf(sesMb);
			// oldLikeCount++; // 1
			pMap.put("mbLikes", oldLikeMemberIds);
			r = mltDao.memberLikeADD(pMap);
			rMap.put("typeLike", "add");
			break;
		case LIKE_MB_NOT_FOUND_OTHER_ONE:// 추가
		case LIKE_MB_NOT_FOUND_OTHERS:// 추가
			rMap.put("typeLike", "add");
			oldLikeMemberIds = oldLikeMemberIds + "," + String.valueOf(sesMb);
			pMap.put("mbLikes", oldLikeMemberIds);
			r = mltDao.memberLikeADD(pMap); // ++
			break;
		default:
			System.out.println("좋아요 없는경우!");
		}
		//
		if (r)
			rMap.put("cntLikes", mltDao.countLikeFoodtruck(tgSr));
		// return mltDao.countLikeMember(tgSr);
		// return 0; //
		else
			rMap.put("cntLikes", -1);
		// return -1;//
		return rMap;
	}

	@Override
	public int isAlreadyLikedMember(int tgSr, int sesMb) {
		String oldLikeMemberIds = mltDao.currentLikeMembers(tgSr);
		//
		if (oldLikeMemberIds == null || oldLikeMemberIds.isEmpty())
			return LIKE_MB_EMPTY; // 현재 좋아요 없음

		// 1명 혹은 2명 이상의 좋아요 id가 존재..
		if (oldLikeMemberIds.indexOf(LIKE_SEP) == -1) {
			// 1명 (구분자가 없을 경우..)
			if (oldLikeMemberIds.equals(String.valueOf(sesMb)))
				return LIKE_MB_FOUND_ONE;
			// 이미 1명이 친구인데.. 바로 sesMb와 일치..
			else
				return LIKE_MB_NOT_FOUND_OTHER_ONE;
			// 이미 1명이 친구인데.. 다른 사람임...
		} else {
			// 2명이상 (구분자개수+1개 = 명수)
			String temp[] = oldLikeMemberIds.split(LIKE_SEP);
			for (String ids : temp) {
				if (ids.equals(String.valueOf(sesMb))) {
					return LIKE_MB_FOUND_OTHERS;
					// 여러명이 있고, 거기에 포함됨..
				}
			}
			return LIKE_MB_NOT_FOUND_OTHERS;
			// 여러명이 있고, 거기에 포함 안됨...
		}
	}

	@Override
	public int countLikeMembers(int tgSr) {
		return mltDao.countLikeFoodtruck(tgSr);
	}
}
