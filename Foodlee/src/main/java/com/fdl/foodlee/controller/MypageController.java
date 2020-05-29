package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.mypage.MypageService;
import com.fdl.foodlee.service.inf.ILoginSVC;
import com.fdl.foodlee.service.inf.IMemberSVC;
import com.fdl.foodlee.service.inf.IQnaSVC;
import com.fdl.foodlee.service.inf.IReviewFileSVC;
import com.fdl.foodlee.service.inf.IReviewSVC;

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
	   
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@RequestMapping(value = "my_page.fdl", method = RequestMethod.GET)
	public ModelAndView mypage(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", mbSvc.selectOneMember((String)ses.getAttribute("LoginName")));
		mav.setViewName("mypage");
		return mav;
	}

//	@RequestMapping(value = "mypage/my_page_mem.fdl", method = RequestMethod.GET)
//	public ModelAndView mypageMem(HttpSession ses) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("member", mbSvc.selectOneMember((String)ses.getAttribute("LoginName")));
//		mav.setViewName("my/my_page_mem");
//		return mav;
//	}
	
	@Autowired
	private MypageService mypageService; 
	
	@RequestMapping(value = "my_info_update.fdl", method = RequestMethod.POST)
	public String updateMem(@RequestParam String login,
			@RequestParam String name,@RequestParam String gender,
			@RequestParam String phoneNumber) {
		if (mypageService.updateMypageInfo(new MemberVO(login, name, phoneNumber, gender)) > 0) {
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
		} else {
			mav.addObject("msg","회원조회 실패 - "+ login);
			mav.setViewName("my/mp_profile");
		}

	return mav;
	}

	
}
