package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BossController {
	@RequestMapping(value = "boss.fdl", method = RequestMethod.GET)
	public String boss() {//시작화면
		return "boss";
	}
	@RequestMapping(value = "menumodify.fdl", method = RequestMethod.GET)
	public String menumodify() {//메뉴수정
		return "boss/bossmenu/menumodify";
	}
	@RequestMapping(value = "infomodify.fdl", method = RequestMethod.GET)
	public String infomodify() {//정보수정
		return "boss/bossinfo/infomodify";
	}
	@RequestMapping(value = "orderlist.fdl", method = RequestMethod.GET)
	public String orderlist() { //주문리스트
		return "/boss/bossorder/orderlist";
	}
	@RequestMapping(value = "review.fdl", method = RequestMethod.GET)
	public String order() {//리뷰목록
		return "/boss/bossreview/review";
	}
	@RequestMapping(value = "position.fdl", method = RequestMethod.GET)
	public String position() {//리뷰목록
		return "/boss/bossinfo/position";
	}
	@RequestMapping(value = "ad.fdl", method = RequestMethod.GET)
	public String ad() {//리뷰목록
		return "/boss/bossinfo/ad2";
	}
}





