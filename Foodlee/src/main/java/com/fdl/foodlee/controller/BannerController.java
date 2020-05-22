package com.fdl.foodlee.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.BannerAddVO;
import com.fdl.foodlee.model.vo.BannerVO;
import com.fdl.foodlee.service.inf.IBannerSVC;

@Controller
public class BannerController {

//	@Autowired
//	IBannerSVC bSvc;
//
//	// - 배너 리스트를 볼 수 있다
////	banner_list.fdl(get, proc, dao, param?fdId)
////	@RequestMapping(value = "banner_list.fdl", method = RequestMethod.GET)
//	@RequestMapping(value = "banner_top_list.fdl", method = RequestMethod.GET)
//	public String bannerTopList(Model model, HttpSession ses) {
//		System.out.println("BannerList...");
//		
//		List<BannerAddVO> baList = bSvc.showAllBanner();
//		
//		for (BannerAddVO ba : baList) {
//			System.out.println(ba.getSelNum());
//			System.out.println(ba.getSelLogin());
//			System.out.println(ba.getImgPath());
//			System.out.println(ba.getPrice());
//			System.out.println(ba.getStDay());
//			System.out.println(ba.getEdDay());
//		}
//		if (baList != null) {
////			ses.setAttribute("msg", "배너 리스트 조회 성공: " + baList.size());
////			ses.setAttribute("baList", baList);
////			ses.setAttribute("baSize", baList.size());
//			System.out.println("배너 리스트 조회 성공: " + baList.size()+"개"+ baList.get(0));
//			model.addAttribute("msg", "배너 리스트 조회 성공: " + baList.size());
//			model.addAttribute("baList", baList);
//			model.addAttribute("baSize", baList.size());
//			return "redirect:/";
////			return "common/map_sliderTop";
//		} else {
//			System.out.println("ERROR: 배너 리스트 조회 실패!!");
//			return "redirect:/mapMain.fdl";
//		}
//	}
}
