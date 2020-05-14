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
public class TruckListController {
	private static final Logger logger = LoggerFactory.getLogger(TruckListController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "truckList.fdl", method = RequestMethod.GET)
	public String truckList() {
		return "truckList";
	}
	
	@RequestMapping(value = "ft_new_form.fdl",method = RequestMethod.GET)
	public String foodtruckNewForm() {
		System.out.println("테스트foodtruckNewForm");
		return "truck/ft_new_form";
	}
	
}
