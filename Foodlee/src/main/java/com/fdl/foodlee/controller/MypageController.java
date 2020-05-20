package com.fdl.foodlee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	@RequestMapping(value = "mypage.fdl", method = RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
}
