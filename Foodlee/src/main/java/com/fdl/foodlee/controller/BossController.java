package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Controller
public class BossController {
	
	@Autowired
	private ISellerSVC selSvc;
	
	@RequestMapping(value = "storeinfo.fdl", method = RequestMethod.GET)
	public ModelAndView content() { // 데이터와 뷰를 동시에 설정이 가능 
		ModelAndView mv = new ModelAndView(); mv.setViewName("/board/content"); // 뷰의 이름 뷰의 경로
		mv.addObject("data", "12341234"); // 뷰로 보낼 데이터 값 
		return mv; 
	
	}

	
	@RequestMapping(value = "boss.fdl", method = RequestMethod.GET)
	public String boss() {//시작화면
		return "boss";
	}
	@RequestMapping(value = "menumodify.fdl", method = RequestMethod.GET)
	public String menumodify() {//메뉴수정
		return "boss/bossmenu/menumodify";
	}
	@RequestMapping(value = "infomodify.fdl", method = RequestMethod.GET)
	public ModelAndView infomodify(HttpSession ses) {//정보수정
		ModelAndView mav = new ModelAndView();
		String login = (String)ses.getAttribute("LoginName");
		SellerVO sel = selSvc.selectOneSeller(login);
		if( sel != null ) {
			System.out.println("sel = " + sel);
			mav.addObject("msg","회원조회 성공 - "+ login);
			mav.addObject("seller", sel);
			mav.setViewName("boss/bossinfo/infomodify");
		} else {
			mav.addObject("msg","회원조회 실패 - "+ login);
			mav.setViewName("redirect:boss.fdl");
		}
		
		return mav;
	}
	@RequestMapping(value = "orderlist.fdl", method = RequestMethod.GET)
	public String orderlist() { //주문리스트
		return "boss/bossorder/orderlist";
	}
	@RequestMapping(value = "review.fdl", method = RequestMethod.GET)
	public String order() {//리뷰목록
		return "boss/bossreview/review";
	}
	@RequestMapping(value = "position.fdl", method = RequestMethod.GET)
	public String position() {//리뷰목록
		return "boss/bossinfo/position";
	}
	@RequestMapping(value = "ad.fdl", method = RequestMethod.GET)
	public String ad() {//광고
		return "boss/bossinfo/ad2";
	}
//	@RequestMapping(value = "storeinfo.fdl", method = RequestMethod.GET)
//	public String storeinfo() {//트럭정보
//		return "boss/bossmenu/storeinfo";
//	}
	
}





