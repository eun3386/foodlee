package com.fdl.foodlee.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Base64.Decoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonFormat.Value;
import com.fdl.foodlee.model.vo.BannerAddVO;
import com.fdl.foodlee.model.vo.BannerVO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.IBannerSVC;
import com.fdl.foodlee.service.inf.IFoodtruckSVC;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Controller
public class MapController {
	
	@Autowired
	IBannerSVC bSvc;
	
	@Autowired
	ISellerSVC selSvc;
	
	@Autowired
	IFoodtruckSVC fodSvc;
	
	// 맵에 보여주는 푸드트럭 리스트 목록으로 볼 수 있다
	@RequestMapping(value = "getFd.fdl", method = RequestMethod.GET)
	public String getOneTruck(Model model, int sid ) {
		FoodtruckVO fv = fodSvc.selectOneFoodtruck(sid);
		if(fv == null) {
			System.out.println("ERROR: 푸드트럭 리스트 목록 조회 실패!!");
		} else {
			model.addAttribute("fd", fv);
		}
//		System.out.println("getFd.fdl = " + fv);
		return "/common/map_truck";
		
	}
	
	// 푸드트럭을 이름으로 검색할수 있다
	@RequestMapping(value = "getFdName.fdl", method = RequestMethod.POST)
	public String searchOneTruck(Model model, String fne ) {
		FoodtruckVO fNe = fodSvc.selectOneFoodtruck(fne);
		model.addAttribute("fd", fNe);
//			System.out.println("getFd.fdl = " + fv);
		return "/common/map_truck";
	}
	
	// 푸드트럭 상세정보 페이지를 볼수 있다
		@RequestMapping(value = "showOneTruck.fdl", method = RequestMethod.GET)
		public String selectOneShowTruck(Model model, int sid) {
			FoodtruckVO tshow = fodSvc.selectOneFoodtruck(sid);
			model.addAttribute("ts", tshow);
//				System.out.println("getFd.fdl = " + fv);
			return "/common/map_truckInfo";
		}
	
	@RequestMapping(value = "mapMain.fdl", method = RequestMethod.GET)
	public String mapMain(Model model) {
		
		// - 배너 리스트를 볼 수 있다
		int max = 50000; // 어드민이 설정
		int min = 10000; // 어드민이 설정
		int limit = 100; // 어드민이 설정
		int avg = (max + min)/2;
		
//		System.out.println("BannerList...");
		List<BannerAddVO> baList = bSvc.showAddBannerList(min, max, limit);
		List<BannerAddVO> baTopList = new ArrayList<BannerAddVO>();
		List<BannerAddVO> baBtmList = new ArrayList<BannerAddVO>();
		if (baList != null) {
			for (BannerAddVO ba : baList) {
					if(ba.getPrice() >= avg) {
						baTopList.add(ba);
//						System.out.println(baTopList);
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
		} else {
			System.out.println("ERROR: 배너 리스트 조회 실패!!");
			return "redirect:/mapMain.fdl";
		}
		// 맵에서 푸드트럭위치를 알수 있다
		List<FoodtruckVO> fodList = fodSvc.searchAddAllFoodtruckList();
		List<String> fod = new ArrayList<String>();
		List<String> fodName = new ArrayList<String>();
		if(fodList != null) {
			for (int i = 0; i < fodList.size(); i++) {
				String latlngs = fodList.get(i).getSellerFoodtruckCoordinate();
				String fName = fodList.get(i).getFoodtruckName();
				fod.add(latlngs);
				fodName.add(fName);
			}
			model.addAttribute("fodlatlngs", fod);
			model.addAttribute("fodName", fodName);
			model.addAttribute("fodSize", fodList.size());
			
//			for (FoodtruckVO ft : fodList) {
//				String ftImgName = ft.getFoodtruckImgPath();
//				try {
//					String deFtImgName = java.net.URLDecoder.decode(ftImgName, "utf-8");
//					System.out.println("de = " + deFtImgName);
//					ft.setFoodtruckImgPath(deFtImgName);
//				} catch (UnsupportedEncodingException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
			model.addAttribute("fodList", fodList);
		} else {
			System.out.println("ERROR: 트럭 리스트 조회 실패!!");
			return "redirect:/mapMain.fdl";
		}
		return "mapMain";
	}
}
