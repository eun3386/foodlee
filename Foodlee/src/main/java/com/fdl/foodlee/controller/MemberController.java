package com.fdl.foodlee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member")
public class MemberController {
//	member_login_form.fdl (form; get; 비회원)
	@RequestMapping(value = "/login_form.fdl", 
			method = RequestMethod.GET)
	public String memberLoginForm() {
		return "member/mb_login_form";
	}
	
//	mb_sign_up_choice_form.fdl (form; get; 비회원)
	@RequestMapping(value = "/join_choice_form.fdl", 
			method = RequestMethod.GET)
	public String mbSignUpChoiceForm() {	
		System.out.println("mb sign up choice form 준비!!!");
		return "member/mb_sign_up_choice_form";
	}
	
//	mb_sign_up_form.fdl (form; get; 비회원)
	@RequestMapping(value = "/sign_up_form.fdl", 
			method = RequestMethod.GET)
	public String mbSignUpForm() {
		System.out.println("mb sign up form 준비!!!");
		return "member/mb_sign_up_form";
	}
}
