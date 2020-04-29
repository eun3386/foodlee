package com.fdl.foodlee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
//	member_login_form.fdl (form; get; 비회원)
	@RequestMapping(value = "member_login_form.fdl", 
			method = RequestMethod.GET)
	public String memberLoginForm() {	
		System.out.println("login form 준비!!!");
		return "member/mb_login_form";
	}
}
