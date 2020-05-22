package com.fdl.foodlee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value = "my_page.fdl", method = RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
	
	// 내 정보
	@RequestMapping(value = "my_info.fdl")
	public String myInfo() {
		return "myinfo";
	}
	
}
