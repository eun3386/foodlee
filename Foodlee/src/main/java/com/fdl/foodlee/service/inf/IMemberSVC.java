package com.fdl.foodlee.service.inf;

public interface IMemberSVC {

	int loginProcess(String login, String pw);

	int selectMemberIdByLogin(String login);

}
