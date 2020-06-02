package com.fdl.foodlee.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.dao.MyCode;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.IAdminSVC;
import com.fdl.foodlee.service.inf.IMemberSVC;

@Controller
public class AdminController {
	
	@Autowired
	private IAdminSVC adSvc;
	
	@RequestMapping(value = "admin.fdl", method = RequestMethod.GET)
	public String admin(HttpSession ses, Model model) {
		/*
		ses.setAttribute("memberCount", adSvc.countMembers());
		ses.setAttribute("sellerCount", adSvc.countSellers());
		ses.setAttribute("foodtruckCount", adSvc.countFoodTrucks());
		ses.setAttribute("menuCount", adSvc.countMenus());
		ses.setAttribute("todayOrder", adSvc.countTodayOrders());
		ses.setAttribute("todayOrderPrice", adSvc.countTodayPriceSum());
		ses.setAttribute("orderCount", adSvc.countOrderSum());
		ses.setAttribute("orderPriceSum", adSvc.countOrderPriceSum());
		*/
		if (ses.getAttribute("LoginType") == null || (int)ses.getAttribute("LoginType") != 6) {
			return "redirect:/main.fdl";
		}
		
		model.addAttribute("memberCount", adSvc.countMembers());
		model.addAttribute("sellerCount", adSvc.countSellers());
		model.addAttribute("foodtruckCount", adSvc.countFoodTrucks());
		model.addAttribute("menuCount", adSvc.countMenus());
		model.addAttribute("todayOrder", adSvc.countTodayOrders());
		model.addAttribute("todayOrderPrice", adSvc.countTodayPriceSum());
		model.addAttribute("orderCount", adSvc.countOrderSum());
		model.addAttribute("orderPriceSum", adSvc.countOrderPriceSum());
		
		Map<String, Object> am = adSvc.countMenuCategory();
		model.addAttribute("mapCategory", am);
		
		List<Map<String, Object>> monthOrder = adSvc.countMonthOrder();
		List<Map<String, Object>> monthOrderPrice = adSvc.countMonthOrderPriceSum();
		
		model.addAttribute("monthOrder", monthOrder);
		model.addAttribute("monthOrderPrice", monthOrderPrice);
		
		return "admin/admin";
	}
	
	@RequestMapping(value = "adminMember.fdl", method = RequestMethod.GET)
	public String adminMember(HttpSession ses, Model model) {
		if (ses.getAttribute("LoginType") == null || (int)ses.getAttribute("LoginType") != 6) {
			return "redirect:/main.fdl";
		}
		List<MemberVO> mbList = adSvc.showAllMember();
		
		model.addAttribute("mbList", mbList);
		return "admin/adminMember";
	}
	
	@RequestMapping(value = "adminSeller.fdl", method = RequestMethod.GET)
	public String adminSeller(HttpSession ses, Model model) {
		if (ses.getAttribute("LoginType") == null || (int)ses.getAttribute("LoginType") != 6) {
			return "redirect:/main.fdl";
		}
		List<SellerVO> sellerList = adSvc.showAllSeller();
		
		model.addAttribute("sellerList", sellerList);
		return "admin/adminSeller";
	}
	
	@RequestMapping(value = "adminMemberChart.fdl", method = RequestMethod.GET)
	public String adminMemberChart(HttpSession ses, Model model) {
		if (ses.getAttribute("LoginType") == null || (int)ses.getAttribute("LoginType") != 6) {
			return "redirect:/main.fdl";
		}
		int lastLoginMembersSum = 0;
		int lastLoginSellersSum = 0;
		
		List<Integer> lastListMembers = adSvc.lastLoginListMembers();
		List<Integer> lastListSellers = adSvc.lastLoginListSellers();
		
		for (Integer integer : lastListMembers) {
			lastLoginMembersSum += integer;
		}
		
		for (Integer integer : lastListSellers) {
			lastLoginSellersSum += integer;
		}
		
		List<Map<String, Object>> monthMembers = adSvc.countMonthMembers();
		Map<String, Object> membersGender = adSvc.countMembersGender();
		
		List<Map<String, Object>> monthSellers = adSvc.countMonthSellers();
		Map<String, Object> sellersGender = adSvc.countSellersGender();
		
		
		model.addAttribute("membersGender", membersGender);
		model.addAttribute("monthMembers", monthMembers);
		model.addAttribute("sellersGender", sellersGender);
		model.addAttribute("monthSellers", monthSellers);
		model.addAttribute("memberCount", adSvc.countMembers());
		model.addAttribute("sellerCount", adSvc.countSellers());
		model.addAttribute("orderCount", adSvc.countOrderSum());
		model.addAttribute("orderPriceSum", adSvc.countOrderPriceSum());
		model.addAttribute("lastLoginSumMembers", lastLoginMembersSum);
		model.addAttribute("lastLoginSumSellers", lastLoginSellersSum);
		
		
		return "admin/adminMemberChart";
	}
	
	@RequestMapping(value = "adminTruckMenuChart.fdl", method = RequestMethod.GET)
	public String adminTruckMenuChart(HttpSession ses, Model model) {
		if (ses.getAttribute("LoginType") == null || (int)ses.getAttribute("LoginType") != 6) {
			return "redirect:/main.fdl";
		}
		model.addAttribute("memberCount", adSvc.countMembers());
		model.addAttribute("sellerCount", adSvc.countSellers());
		model.addAttribute("orderCount", adSvc.countOrderSum());
		model.addAttribute("orderPriceSum", adSvc.countOrderPriceSum());
		return "admin/adminTruckMenuChart";
	}
	
}
