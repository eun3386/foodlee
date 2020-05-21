package com.fdl.foodlee.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.dao.MyCode;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.service.inf.IFoodtruckSVC;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private IFoodtruckSVC ftSvc;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "main.fdl", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}
	
// 	muni_list.fdl 
	@RequestMapping(value = "muni_list.fdl", method = RequestMethod.GET)
	public ModelAndView muniListPage(
			@RequestParam(value = "muniCode") int muniCode, String guName) {
		System.out.println("muniCode = "+ muniCode);
		ModelAndView mav = new ModelAndView();
//		FoodtruckVO fdTrucks = ftSvc.selectOneFoodtruckWithGuCode(muniCode);
		List<FoodtruckVO> ftList = ftSvc.searchAllFoodtruckWithGuCode(muniCode);
		mav.addObject("ftList",ftList);
		mav.addObject("guName",guName);
		mav.setViewName("municipalityList");
		return mav;
	}

}
