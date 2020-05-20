package com.fdl.foodlee.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.dao.MyCode;
import com.fdl.foodlee.model.vo.FoodtruckVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
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
	
//// 	munu_list.fdl 
//	@RequestMapping(value = "munu_list.fdl", method = RequestMethod.GET)
//	public ModelAndView muniListPage(
//			@PathVariable(value = "muniName") String muniName ) {
//		System.out.println("muniName = "+ muniName);
//		ModelAndView mav = new ModelAndView();
//		List<FoodtruckVO> ftList = 
//		return mav;
//	}

}
