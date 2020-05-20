package com.fdl.foodlee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.BannerVO;
import com.fdl.foodlee.service.inf.IBannerSVC;

@Controller
public class BannerController {

	@Autowired
	IBannerSVC bSvc;

	// - 배너 리스트를 볼 수 있다
//	banner_list.fdl(get, proc, dao, param?fdId)
//	@RequestMapping(value = "banner_list.fdl", method = RequestMethod.GET)
	@RequestMapping(value = "mapMain.fdl", method = RequestMethod.GET)
	public String bannerList(Model model, HttpSession see) {
		System.out.println("BannerList...");
		
		List<BannerVO> baList = bSvc.showAllBanner();
		if (baList != null) {
			see.setAttribute("msg", "배너 리스트 조회 성공: " + baList.size());
			see.setAttribute("baList", baList);
			see.setAttribute("baSize", baList.size());
//			model.addAttribute("msg", "배너 리스트 조회 성공: " + baList.size());
//			model.addAttribute("baList", baList);
//			model.addAttribute("baSize", baList.size());
			return "mapMain";
		} else {
			System.out.println("ERROR: 배너 리스트 조회 실패!!");
			return "redirect:/mapMain.fdl";
		}
	}
}
