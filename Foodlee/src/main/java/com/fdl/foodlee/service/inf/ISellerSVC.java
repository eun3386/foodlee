package com.fdl.foodlee.service.inf;

public interface ISellerSVC {
	
	int loginProcess(String login, String pw);

	int selectSellerIdByLogin(String login);
	
}
