package com.fdl.foodlee.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
	
	// 메뉴에 따라 트럭 리스트를 볼 수 있다.
	// <a href="truckList.fdl?mc=1">식사 카테고리 표시</a>
	@RequestMapping(value = "truckList.fdl",method = RequestMethod.GET)
	public String truckShowProc(HttpSession ses, 
			
			@RequestParam(value = "mc", required = false,defaultValue = "1") int menuCategory, Model model) {
			List<FoodtruckVO> ftList = this.ftSvc.searchAllFoodtruckFromCategory(menuCategory);
			if( ftList != null ) {
				System.out.println("메뉴 푸드 트럭 리스트 확인" + ftList);
				if( menuCategory == FoodtruckVO.snack ) {
					System.out.println(FoodtruckVO.menuTypes[FoodtruckVO.snack] + " 푸드 트럭 리스트 검색 결과");
					model.addAttribute("ftListsize", ftList.size());
					model.addAttribute("ftList", ftList);
				} else if( menuCategory == FoodtruckVO.meal ) {
					System.out.println(FoodtruckVO.menuTypes[FoodtruckVO.meal] + " 푸드 트럭 리스트 검색 결과");
					model.addAttribute("ftListsize", ftList.size());
					model.addAttribute("ftList", ftList);	
				} else if( menuCategory == FoodtruckVO.dessert ) {
					System.out.println(FoodtruckVO.menuTypes[FoodtruckVO.dessert] + " 푸드 트럭 리스트 검색 결과");
					model.addAttribute("ftListsize", ftList.size());
					model.addAttribute("ftList", ftList);
				} else if( menuCategory == FoodtruckVO.riceCar ) {
					System.out.println(FoodtruckVO.menuTypes[FoodtruckVO.riceCar] + " 푸드트럭 리스트 검색 결과");
					model.addAttribute("ftListsize", ftList.size());
					model.addAttribute("ftList", ftList);
				} else {
					System.out.println(FoodtruckVO.menuTypes[FoodtruckVO.error]);
				}
			} else {
				System.out.println(menuCategory + "인식에 실패하여 푸드 트럭 리스트 검색에 실패하였습니다.");
			}
			return "truck/truckList";
		}
	
}





















