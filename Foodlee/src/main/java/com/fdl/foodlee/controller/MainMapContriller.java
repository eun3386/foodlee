package com.fdl.foodlee.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainMapContriller {
	private static final Logger logger = LoggerFactory.getLogger(MainMapContriller.class);
	
	@RequestMapping(value = "mapMain.fdl", method = RequestMethod.GET)
	public String mapMain() {
		return "mapMain";
	}
	
}
