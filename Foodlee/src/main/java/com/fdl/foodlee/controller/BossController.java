package com.fdl.foodlee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BossController {
	@RequestMapping(value = "boss.fdl", method = RequestMethod.GET)
	public String boss() {
		return "boss";
	}
}