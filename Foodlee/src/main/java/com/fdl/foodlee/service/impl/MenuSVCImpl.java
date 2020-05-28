package com.fdl.foodlee.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fdl.foodlee.model.dao.inf.IMenuDAO;
import com.fdl.foodlee.model.vo.MenuVO;
import com.fdl.foodlee.service.inf.IMenuSVC;

@Service
public class MenuSVCImpl implements IMenuSVC {
	
	@Autowired
	IMenuDAO menuDao;
	
	@Override
	public boolean insertNewMenu(MenuVO mn) {
		return menuDao.insertNewMenu(mn);
	}

	@Override
	public MenuVO selectOneMenu(int mId) {
		return menuDao.selectOneMenu(mId);
	}

	@Override
	public MenuVO selectOneMenu(String name) {
		return menuDao.selectOneMenu(name);
	}

	@Override
	public MenuVO searchOneMenu(String name) {
		return menuDao.searchOneMenu(name);
	}

	@Override
	public boolean updateMenu(MenuVO mn) {
		return menuDao.updateMenu(mn);
	}

	@Override
	public boolean deleteMenu(MenuVO mn) {
		return menuDao.deleteMenu(mn);
	}

	@Override
	public List<MenuVO> showAllMenu(int sId) {
		return showAllMenu(sId);
	}


}
