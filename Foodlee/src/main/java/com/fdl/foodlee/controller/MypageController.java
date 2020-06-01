package com.fdl.foodlee.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.OrderVO;
import com.fdl.foodlee.model.vo.QnaVO;
import com.fdl.foodlee.model.vo.ReviewVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.mypage.MypageService;
import com.fdl.foodlee.service.inf.IFoodtruckSVC;
import com.fdl.foodlee.service.inf.ILoginSVC;
import com.fdl.foodlee.service.inf.IMemberLikeTruckSVC;
import com.fdl.foodlee.service.inf.IMemberSVC;
import com.fdl.foodlee.service.inf.IMenuSVC;
import com.fdl.foodlee.service.inf.IOrderSVC;
import com.fdl.foodlee.service.inf.IQnaSVC;
import com.fdl.foodlee.service.inf.IReviewFileSVC;
import com.fdl.foodlee.service.inf.IReviewSVC;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Controller
public class MypageController {

	@Autowired
    private IMemberSVC mbSvc;
	@Autowired
	private ILoginSVC logSvc;
	@Autowired
	private IReviewSVC rvSvc;
	@Autowired
	private IQnaSVC qnaSvc;
	@Autowired
	private IReviewFileSVC rvFileSvc;
	@Autowired
	private IOrderSVC orderSvc;
	@Autowired
	private IFoodtruckSVC fdSvc;
	@Autowired
	private IMemberLikeTruckSVC mltSvc;
	@Autowired
	private ISellerSVC sellSvc;
	@Autowired
	private IMenuSVC menuSvc;
	@Autowired
	private MypageService mypageService; 
	   
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	// 일반 회원 정보
	@RequestMapping(value = "my_page.fdl", method = RequestMethod.GET)
	public ModelAndView mypage(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", mbSvc.selectOneMember((String)ses.getAttribute("LoginName")));
		mav.setViewName("mypage");
		System.out.println("회원조회성공");
		return mav;
	}

//	@RequestMapping(value = "mypage/my_page_mem.fdl", method = RequestMethod.GET)
//	public ModelAndView mypageMem(HttpSession ses) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("member", mbSvc.selectOneMember((String)ses.getAttribute("LoginName")));
//		mav.setViewName("my/my_page_mem");
//		return mav;
//	}
	

	
	@RequestMapping(value = "my_info_update.fdl", method = RequestMethod.POST)
	public String updateMem(String name, String gender, String phoneNumber, 
				String address, HttpSession ses) {
		System.out.println(name +"-"+ phoneNumber+"-"+ gender+"-"+ address);
		MemberVO mb = new MemberVO(name, phoneNumber, gender, address);
		mb.setLogin( (String)ses.getAttribute("LoginName"));
		if (mypageService.updateMypageInfo(mb) > 0) {
			return "my/my_page_mem_success";
		} else {
			return "my/my_page_mem_error";
		}
	}
	@RequestMapping(value = "my_page_mem.fdl", method = RequestMethod.GET)
	public ModelAndView infomodify(HttpSession ses) {//정보수정
		ModelAndView mav = new ModelAndView();
		String login = (String)ses.getAttribute("LoginName");
		MemberVO mem = mbSvc.selectOneMember(login);
		if( mem != null ) {
			System.out.println("mem = " + mem);
			mav.addObject("msg","회원조회 성공 - "+ login);
			mav.addObject("member", mem);
			mav.setViewName("my/mp_profile");
			System.out.println("회원 조회 성공");
		} else {
			mav.addObject("msg","회원조회 실패 - "+ login);
			mav.setViewName("my/mp_profile");
		}

	return mav;
	}

	
	// 좋아요내역
	@RequestMapping(value = "my_like_list.fdl", method = RequestMethod.GET)
	@ResponseBody
	public List<FoodtruckVO> getLikeFoodtruck(HttpSession ses) {
		System.out.println(ses.getAttribute("LoginName"));
		return mypageService.getLikeFoodtruck((String)ses.getAttribute("LoginName"));
	}
	
	// 주문내역
	@RequestMapping(value = "my_order_list.fdl", method = RequestMethod.GET)
	@ResponseBody
	public List<OrderVO> orderList(HttpSession ses) {
		return mypageService.orderlist((String)ses.getAttribute("LoginName"));
	}
//	public ModelAndView orderList(HttpSession ses) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("order", orderSvc.memberOrderList((String)ses.getAttribute("LoginName")));
//		mav.setViewName("mypage");
//		System.out.println("주문내역 조회성공");
//		return mav;
//		
//	}
	
	// QnA 목록
	@RequestMapping(value = "my_QnA_list.fdl", method = RequestMethod.GET)
	@ResponseBody
	public List<QnaVO> qnaList(HttpSession ses) {
		return mypageService.qnaList((String)ses.getAttribute("LoginName"));
	}
	
	// 리뷰 목록
	@RequestMapping(value = "my_review.fdl", method = RequestMethod.GET)
	@ResponseBody
	public List<ReviewVO> reviewList(HttpSession ses) {
//		List<ReviewVO> reviewList = rvSvc.showAllReviewLogin((String)ses.getAttribute("LoginName"));
		return mypageService.reviewList((String)ses.getAttribute("LoginName"));
	}
	
}
