package com.fdl.foodlee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
//	seller/join_form.fdl (form; get; 비회원)
	@RequestMapping(value = "/join_form.fdl", 
			method = RequestMethod.GET)
	public String mbSignUpForm() {
		System.out.println("join form 준비!!!");
		return "seller/join_form";
	}
	
}
