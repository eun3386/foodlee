package com.fdl.foodlee.controller;

import java.lang.ProcessBuilder.Redirect;
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
import com.fdl.foodlee.model.vo.EventVO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.service.inf.IEventSVC;
import com.fdl.foodlee.service.inf.IFoodtruckSVC;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private IFoodtruckSVC ftSvc;
	@Autowired
	private IEventSVC evSvc;
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
	
//	@RequestMapping(value = "main.fdl", method = RequestMethod.GET)
//	public String home() {
//		return "main";
//	}
//		ModelAndView eventListProc(
//				@RequestParam(value = "pn",
//				required = false, 
//				defaultValue = "1")
//				int pageNumber) {
//				//int pn) {
//		System.out.println("eventListProc(PN)..");
//		int maxPG = evSvc.checkMaxPageNumber();
//		if( pageNumber > maxPG || pageNumber <= 0 ) {
//			System.out.println("잘못된 페이지 번호: " + pageNumber);
//			return new ModelAndView(
//				"redirect:event_list.fdl?pn=1");
//		}
//		
//		List<EventVO> evList =
//				evSvc.showAllEvents(pageNumber);
//		
//		ModelAndView mav = 
//			new ModelAndView("event/_ev_list");
//		if( evList != null ) {
//			mav.addObject("evSize", evList.size());
//			mav.addObject("events", evList);
//			mav.addObject("maxPn", maxPG);
//			mav.addObject("pn", pageNumber); // 활성페이지			
//			
//			System.out.println("게시글리스트 pg 조회 성공: "
//					+ evList.size());
//		} else {
//			mav.addObject("msg", "게시글리스트 pg 조회 실패!");
//		}
//		
//		//return "article/at_list";
//		return mav;
//		
//		
//	}	
	
		
	
	
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
