package com.fdl.foodlee.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.BannerAddVO;
import com.fdl.foodlee.model.vo.BannerVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.IBannerSVC;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Controller
public class MapController {
	
	@Autowired
	IBannerSVC bSvc;
	
	@Autowired
	ISellerSVC selSvc;
	
	@RequestMapping(value = "mapMain.fdl", method = RequestMethod.GET)
	public String mapMain(Model model) {
		
		// - 배너 리스트를 볼 수 있다
		int max = 50000; // 어드민이 설정
		int min = 10000; // 어드민이 설정
		int limit = 5; // 어드민이 설정
		int avg = (max + min)/2;
		System.out.println("BannerList...");
		List<BannerAddVO> baList = bSvc.showAddBannerList(min, max, limit);
		List<BannerAddVO> baTopList = new ArrayList<BannerAddVO>();
		List<BannerAddVO> baBtmList = new ArrayList<BannerAddVO>();
		int A;
		int B;
		if (baList != null) {
			for (BannerAddVO ba : baList) {
					if(ba.getPrice() >= avg) {
						baTopList.add(ba);
							System.out.println(baTopList);
//						System.out.println("가격"+ba.getPrice());	
//						System.out.println("배너 top 리스트 조회 성공: " + baTopList.size() + "개");
					} else {
						baBtmList.add(ba);
//						System.out.println("가격"+ba.getPrice());	
//						System.out.println("배너 bottom 리스트 조회 성공: " + baBtmList.size() + "개");
	//					model.addAttribute("msg", "배너  bottom 리스트 조회 성공: " + baList.size());
					}
				}
			model.addAttribute("baTopList", baTopList);
			model.addAttribute("baBtmList", baBtmList);
			return "mapMain";
		} else {
			System.out.println("ERROR: 배너 리스트 조회 실패!!");
			return "redirect:/mapMain.fdl";
		}
	}
}
