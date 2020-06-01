package com.fdl.foodlee.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.dao.MyCode;
import com.fdl.foodlee.service.inf.IAdminSVC;
import com.fdl.foodlee.service.inf.ILoginSVC;
import com.fdl.foodlee.service.inf.IMemberSVC;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Controller
public class LoginController {
	
	@Autowired
	private IMemberSVC mbSvc;
	
	@Autowired
	private ISellerSVC selSvc;
	
	@Autowired
	private ILoginSVC logSvc;
	
//	login_form.fdl (form, get; 비회원)
	@RequestMapping(value = "login_form.fdl", method = RequestMethod.GET)
	public String loginForm() {
		return "login_form";
	}
	
// 	login.fdl (proc, post, dao; 암호화; 세션; 회원)
	@RequestMapping(value = "login.fdl", method = RequestMethod.POST)
	//public ModelAndView loginProc(
	@ResponseBody
	public String loginProc(HttpSession ses, String login, String password) {
		int authResult;
		authResult = logSvc.loginProcess(login, password);
		if( authResult == MyCode.MEMBER_LOGIN_AUTH_OK ) {
			ses.setAttribute("LoginName", login);
			ses.setAttribute("LoginType", authResult);
			ses.setAttribute("LoginTime", System.currentTimeMillis() );
			int id = mbSvc.selectMemberIdbyLogin(login);
			ses.setAttribute("id", new Integer(id) );
			mbSvc.updateMemberLoginTime(id);
			return "memberLogin";
		} else if( authResult == MyCode.SELLER_LOGIN_AUTH_OK ) {
			ses.setAttribute("LoginName", login);
			ses.setAttribute("LoginType", authResult);
			ses.setAttribute("LoginTime", System.currentTimeMillis() );
			int id = selSvc.selectSellerIdbyLogin(login);
			ses.setAttribute("id", new Integer(id) );
			selSvc.updateSellerLoginTime(id);
			return "sellerLogin";
		} else if( authResult == MyCode.ADMIN_LOGIN_AUTH_OK ) {
			ses.setAttribute("LoginName", login);
			ses.setAttribute("LoginType", authResult);
			ses.setAttribute("LoginTime", System.currentTimeMillis() );
			int id = mbSvc.selectMemberIdbyLogin(login);
			ses.setAttribute("id", new Integer(id) );
			mbSvc.updateMemberLoginTime(id);
			return "adminLogin";
		} else if( authResult == MyCode.LOGIN_NONE ) {
			return "loginNone";
		} else if( authResult == MyCode.LOGIN_PW_MISMATCH ) {
			return "pwMismatch";
		} else {
			return "loginFail";
		}
	}
	
//	logout.fdl
	@RequestMapping(value = "logout.fdl", method = RequestMethod.GET)
	public String logoutProc(HttpSession ses) {
		String login = (String)ses.getAttribute("LoginName");
		int loginType = (Integer)ses.getAttribute("LoginType");
		int id = (Integer)ses.getAttribute("id");
		long loginStarted = (Long)ses.getAttribute("LoginTime");
		long currentTime = System.currentTimeMillis();
		long elapsedTime = currentTime - loginStarted;
		System.out.println(login + " 회원이 로그아웃: "
				+ elapsedTime/1000.0 + "초가 로그인 활동함.." );
		if( loginType == MyCode.MEMBER_LOGIN_AUTH_OK ) {
			mbSvc.updateMemberLogoutTime(id);
		} else if( loginType == MyCode.SELLER_LOGIN_AUTH_OK ) {
			selSvc.updateSellerLogoutTime(id);
		} else if( loginType == MyCode.ADMIN_LOGIN_AUTH_OK ) {
			mbSvc.updateMemberLogoutTime(id);
		}
		ses.invalidate();
		return "redirect:/";
	}
	
//	find_form.fdl
	@RequestMapping(value = "find_form.fdl", method = RequestMethod.GET)
	public String findForm() {
		return "find_form";
	}
	
//	find_id.fdl
	@RequestMapping(value = "find_id.fdl", method = RequestMethod.POST)
	public ModelAndView findIdProc(String name, String phoneNumber, HttpSession ses) {
		List<String> mbIdList = mbSvc.selectMemberLogin(name, phoneNumber);
		List<String> selIdList = selSvc.selectSellerLogin(name, phoneNumber);
		ModelAndView mav = new ModelAndView();
		if( mbIdList != null && selIdList != null ) {
			for (int i = 0; i < selIdList.size(); i++) {
				mbIdList.add(selIdList.get(i));
			}
			mav.addObject("idList", mbIdList);
			System.out.println("AllIdList = " + mbIdList);
			mav.setViewName("redirect:/main.fdl");
		} else if( mbIdList != null && selIdList == null ) {
			mav.addObject("idList", mbIdList);
			System.out.println("mbIdList = " + mbIdList);
			mav.setViewName("redirect:/main.fdl");
		} else if( mbIdList == null && selIdList != null ) {
			mav.addObject("idList", selIdList);
			System.out.println("selIdList = " + selIdList);
			mav.setViewName("redirect:/main.fdl");
		} else {
			mav.setViewName("find_form.fdl");
		}
		return mav;
	}
	
//	find_pw.fdl
	@RequestMapping(value = "find_pw.fdl", method = RequestMethod.POST)
	public ModelAndView findPasswordProc(String login, String email) {
		String mbPw = mbSvc.selectMemberPassword(login, email);
		String selPw = selSvc.selectSellerPassword(login, email);
		ModelAndView mav = new ModelAndView();
		if( mbPw != null && selPw != null ) {
			mav.addObject("pw", mbPw);
			System.out.println("AllPw = " + mbPw);
			mav.setViewName("redirect:/login_form.fdl");
		} else if( mbPw != null && selPw == null ) {
			mav.addObject("pw", mbPw);
			System.out.println("mbPw = " + mbPw);
			mav.setViewName("redirect:/login_form.fdl");
		} else if( mbPw == null && selPw != null ) {
			mav.addObject("pw", selPw);
			System.out.println("selPw = " + selPw);
			mav.setViewName("redirect:/login_form.fdl");
		} else {
			mav.setViewName("find_form");
		}
		return mav;
	}
	
//	join_choice_form.fdl (form; get; 비회원)
	@RequestMapping(value = "join_choice_form.fdl", 
			method = RequestMethod.GET)
	public String mbSignUpChoiceForm() {
		return "join_choice_form";
	}
	
}
