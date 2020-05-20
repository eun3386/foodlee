package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
- 회원가입구분/약관동의 할 수 있다.
	member/join_choice_form.fdl (get, )
- 회원가입 할 수 있다.
	member/new_join_form.fdl
	member/join.fdl
- 아이디를 찾을 수 있다.
	member/find_id.fdl
- 비밀번호를 찾을 수 있다.
	member/find_pw.fdl
- 아이디 중복체크를 할 수 있다.
	member/dupcheck.fdl
- 자신의 정보를 확인 할 수 있다.
	member/show.fdl
- 자신의 정보를 갱신 할 수 있다.
	member/edit_form.fdl
	member/update.fdl
- 탈퇴 할 수 있다.
	member/delete.fdl
 */

@Controller
@RequestMapping("/member")
public class MemberController {
	
//	member/join_choice_form.fdl (form; get; 비회원)
	@RequestMapping(value = "/join_choice_form.fdl", 
			method = RequestMethod.GET)
	public String mbSignUpChoiceForm() {	
		System.out.println("mb sign up choice form 준비!!!");
		return "member/join_choice_form";
	}
	
//	join_form.fdl (form; get; 비회원)
	@RequestMapping(value = "/join_form.fdl", 
			method = RequestMethod.GET)
	public String mbSignUpForm() {
		System.out.println("mb sign up form 준비!!!");
		return "member/join_form";
	}
	
}
