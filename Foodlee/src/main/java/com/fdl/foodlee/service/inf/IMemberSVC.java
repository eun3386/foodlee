package com.fdl.foodlee.service.inf;

public interface IMemberSVC {

	int loginProcess(String login, String password);

	int selectMemberIdByLogin(String login);

}
