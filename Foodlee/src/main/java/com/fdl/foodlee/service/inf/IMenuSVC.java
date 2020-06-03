package com.fdl.foodlee.service.inf;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.fdl.foodlee.model.vo.MenuVO;

public interface IMenuSVC {
		// 메뉴를 등록 할 수 있다.
		public boolean insertNewMenu(MenuVO mn);
		// 사장님이 메뉴 번호를 받아 메뉴를 조회 할 수 있다.
		public MenuVO selectOneMenu(int mId);
		// 사장님이 메뉴 이름을 받아 메뉴를 조회 할 수 있다.
		public MenuVO selectOneMenu(String name);
		// 고객이 메뉴를 검색 할 수 있다.
		public MenuVO searchOneMenu(String name);
		// 등록된 메뉴를 업데이트 할 수 있다.
		public boolean updateMenu(MenuVO mn);
		// 등록된 메뉴를 삭제 할 수 있다.
		public boolean deleteMenu(MenuVO mn);
		// 전체 메뉴를 조회 할 수 있다.
		public List<MenuVO> showAllMenu(int sId);
		
		
}
