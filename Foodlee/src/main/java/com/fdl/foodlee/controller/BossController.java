package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BossController {
	@RequestMapping(value = "boss.fdl", method = RequestMethod.GET)
	public String boss() {
		return "boss";
	}
	
// 	seller_logout.fdl
	@RequestMapping(value = "member_logout.fdl", 
			method = RequestMethod.GET)
	public String memberLogoutProc(HttpSession ses) {
		String login = (String)ses
					.getAttribute("mbLoginName");
		long loginStarted = (Long)ses
				.getAttribute("mbLoginTime");
		long currentTime = System.currentTimeMillis();
		long elapsedTime = currentTime - loginStarted;
		
		System.out.println(login + " 회원이 로그아웃: "
				+ elapsedTime/1000.0 + "초가 로그인 활동함.." );
		ses.invalidate();
		return "redirect:/";
	}
}
