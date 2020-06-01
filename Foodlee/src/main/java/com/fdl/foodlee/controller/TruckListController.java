package com.fdl.foodlee.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.dao.inf.IFoodtruckDAO;
import com.fdl.foodlee.model.dao.inf.IMenuDAO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MenuVO;
import com.fdl.foodlee.service.inf.IFoodtruckSVC;

@Controller
public class TruckListController {
	
//	@Autowired
//	private IFoodtruckDAO ftDAO;
	private IMenuDAO mnDAO;
	@Autowired
	private IFoodtruckSVC ftSvc;
//	private FoodtruckVO ft;
	
	private static final Logger logger = LoggerFactory.getLogger(TruckListController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "truckListPage.fdl", method = RequestMethod.GET)
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
	
//	// 트럭 상세 보기를 할 수 있다.
//	@RequestMapping(value = "truckList.fdl",method = RequestMethod.GET)
//	public String truckShowProc(HttpSession ses, String mainMenu, Model model) {
//		MenuVO mn = this.mnDAO.searchOneMenu(mainMenu);
//		if( mn != null ) {
//			System.out.println("메뉴 푸드 트럭 상세 조회 성공!" + mn);
//			model.addAttribute("menu", mn);
//			
//			// 트럭 리스트
//			List<FoodtruckVO> ftList
//				= ftSvc.searchAllFoodtruck(mn.getMenuType());
//			if( ftList != null ) {
//				model.addAttribute("ftSize", ftList.size());
//				model.addAttribute("foodtrucks", ftList);
//			} else {
//				model.addAttribute("msg", "푸드 트럭 리스트 조회 실패");
//			}
//			return "truck/truckList";
//		} else {
//			model.addAttribute("msg", "메뉴 별 푸드 트럭 상세 조회 실패: " + mainMenu);
//			return "truck/truckList";
//		}
//	}
	
	// 메뉴에 따라 트럭 리스트를 볼 수 있다.(페이지네이션)
	@RequestMapping(value = "truckList.fdl",method = RequestMethod.GET)
	public String truckShowProc(HttpSession ses, 
			@RequestParam(value = "toppn", required = false,defaultValue = "1") int topPageNumber,
			@RequestParam(value = "mc", required = false,defaultValue = "1") int menuCategory, Model model, 
			@RequestParam(value = "pn", required = false,defaultValue = "1") int pageNumber) {				
			int maxTopPg = ftSvc.checkMaxTop10PageNumber();
			int maxPG = ftSvc.checkMaxPageNumberForMenu(menuCategory);
			System.out.println("Top10 트럭 카운트 : " + maxTopPg);
			if( topPageNumber > maxTopPg || topPageNumber <= 0 ) {
				System.out.println("잘못된 TOP 10 페이지 번호: " + topPageNumber);
				return "redirect:truckList.fdl?toppn=1";
			}
			List<FoodtruckVO> topFtList = this.ftSvc.showTop10Foodtrucks(topPageNumber);
			if( topFtList != null ) {
				System.out.println("Top 10 트럭 리스트 확인" + topFtList);
				model.addAttribute("topFtListsize", topFtList.size());
				model.addAttribute("topFtList", topFtList);
				model.addAttribute("maxTopPg", maxTopPg);
				model.addAttribute("toppn", topPageNumber);
			}
			if( pageNumber > maxPG || pageNumber <= 0 ) {
				System.out.println("잘못된 페이지 번호: " + pageNumber);
				return "redirect:truckList.fdl?mc=1";
			}
			List<FoodtruckVO> ftList = this.ftSvc.showCategoryFoodtrucks(menuCategory, pageNumber);
			if( ftList != null ) {
				System.out.println("메뉴 푸드 트럭 리스트 확인" + ftList);
				System.out.println("푸드트럭 리스트 검색 결과");
				model.addAttribute("ftListsize", ftList.size());
				model.addAttribute("ftList", ftList);
				model.addAttribute("maxPG", maxPG);
				model.addAttribute("pn", pageNumber);
				model.addAttribute("mc", menuCategory);
			} else {
				System.out.println(menuCategory + "인식에 실패하여 푸드 트럭 리스트 검색에 실패하였습니다.");
			}
			return "truck/truckList";
		}
//	// 트럭 리스트 (페이지네이션)
//	public ModelAndView foodtruckListShowProc(
//		@RequestParam(value = "pn", required = false, defaultValue = "1") int pageNumber) {
//		System.out.println("foodtruckListProc(PN)...");
//		int maxPG = ftSvc.checkMaxPageNumber();
//		if( pageNumber > maxPG || pageNumber <= 0 ) {
//			System.out.println("잘못된 페이지 번호 : " + pageNumber);
//			return new ModelAndView(
//					"redirect:truckList.fdl?pn=1");
//		}
//		List<FoodtruckVO> ftList = ftSvc.showAllFoodtrucks(pageNumber);
//		ModelAndView mav = new ModelAndView("truck/truckList");
//		if( ftList != null ) {
//			mav.addObject("ftSize", ftList.size());
//			mav.addObject("ftList", ftList);
//			mav.addObject("maxPG", maxPG);
//			mav.addObject("pn", pageNumber);
//			System.out.println("푸드 트럭 리스트 조회 성공 : " + ftList.size());
//		} else {
//			mav.addObject("msg", "푸드 트럭 리스트 조회 실패");
//		}
//		return mav;
//	}
}





















