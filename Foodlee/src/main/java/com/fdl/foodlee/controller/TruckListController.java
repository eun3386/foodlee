package com.fdl.foodlee.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdl.foodlee.model.dao.inf.IFoodtruckDAO;

@Controller
public class TruckListController {
	
//	@Autowired
//	private IFoodtruckDAO ftDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(TruckListController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "truckList.fdl", method = RequestMethod.GET)
	public String truckList() {
		return "truckList";
	}
	
	@RequestMapping(value = "new_foodtruck_form.fdl",method = RequestMethod.GET)
	public String foodtruckNewForm() {
		
		System.out.println("테스트foodtruckNewForm");
		return "truck/new_foodtruck_form";
	}
	
	@RequestMapping(value = "foodtruck_select_form.fdl",method = RequestMethod.GET)
	public String foodtruckSelectForm() {
		System.out.println("테스트foodtruckSelectForm");
		return "truck/foodtruck_select_form";
	}
	
	@RequestMapping(value = "foodtruck_update_form.fdl",method = RequestMethod.GET)
	public String foodtruckUpdateForm() {
		System.out.println("테스트foodtruckUpdateForm");
		return "truck/foodtruck_update_form";
	}
	
	@RequestMapping(value = "foodtruck_delete_form.fdl",method = RequestMethod.GET)
	public String foodtruckDeleteForm() {
		System.out.println("테스트foodtruckDeleteForm");
		return "truck/foodtruck_delete_form";
	}
}
