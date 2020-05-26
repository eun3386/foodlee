package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView loginProc(
			HttpSession ses, String login, String password) {
		System.out.println("login = "+ login);
		System.out.println("pw = "+ password);
		ModelAndView mav = new ModelAndView();
		int authResult;
			authResult = logSvc.loginProcess(login, password);
			if( authResult == MyCode.MEMBER_LOGIN_AUTH_OK ) {
				ses.setAttribute("LoginName", login);
				ses.setAttribute("LoginType", authResult);
				ses.setAttribute("LoginTime", System.currentTimeMillis() );
				int id = mbSvc.selectMemberIdbyLogin(login);
				ses.setAttribute("id", new Integer(id) );
				mbSvc.updateMemberLoginTime(id);
				mav.setViewName("redirect:/main.fdl");
			} else if( authResult == MyCode.SELLER_LOGIN_AUTH_OK ) {
				ses.setAttribute("LoginName", login);
				ses.setAttribute("LoginType", authResult);
				ses.setAttribute("LoginTime", System.currentTimeMillis() );
				int id = selSvc.selectSellerIdbyLogin(login);
				ses.setAttribute("id", new Integer(id) );
				selSvc.updateSellerLoginTime(id);
				mav.setViewName("redirect:/main.fdl");
			} else if( authResult == MyCode.ADMIN_LOGIN_AUTH_OK ) {
				ses.setAttribute("LoginName", login);
				ses.setAttribute("LoginType", authResult);
				ses.setAttribute("LoginTime", System.currentTimeMillis() );
				int id = mbSvc.selectMemberIdbyLogin(login);
				ses.setAttribute("id", new Integer(id) );
				mbSvc.updateMemberLoginTime(id);
				mav.setViewName("redirect:/admin.fdl");
			} else {
				mav.addObject("msg", "로그인 실패!! - "
						+ authResult + " : " +
					MyCode.getMsg(authResult) );
				mav.setViewName("login_form");
			}
		return mav;
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
	@RequestMapping(value = "find_id.fdl", method = RequestMethod.GET)
	public String findIdProc(HttpSession ses) {
		int loginType = (Integer)ses.getAttribute("LoginType");
		return null;
	}
	
//	find_pw.fdl
	@RequestMapping(value = "find_pw.fdl", method = RequestMethod.GET)
	public String findPasswordProc() {
		return null;
	}
	
//	join_choice_form.fdl (form; get; 비회원)
	@RequestMapping(value = "join_choice_form.fdl", 
			method = RequestMethod.GET)
	public String mbSignUpChoiceForm() {
		return "join_choice_form";
	}
	
}
