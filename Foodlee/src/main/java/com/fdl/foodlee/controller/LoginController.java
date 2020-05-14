package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	private IAdminSVC adSvc;
	@Autowired
	private ISellerSVC selSvc;
	@Autowired
	private ILoginSVC logSvc;
	
//	login_form.fdl (form, get; 비회원)
	@RequestMapping(value = "login_form.fdl", method = RequestMethod.GET)
	public String memberLoginForm() {
		return "login_form";
	}
	
// 	login.fdl (proc, post, dao; 암호화; 세션; 회원)
	@RequestMapping(value = "login.fdl", method = RequestMethod.POST)
	public ModelAndView memberLoginProc(
			HttpSession ses, String login, String password) {
		System.out.println("login = "+ login);
		System.out.println("pw = "+ password);
		ModelAndView mav = new ModelAndView();
		int authResult;
		if( login.equals("admin") == false ) {
			authResult = logSvc.loginProcess(login, password);
			if( authResult == MyCode.MEMBER_LOGIN_AUTH_OK ) {
				ses.setAttribute("LoginName", login);
				ses.setAttribute("LoginTime", 
						System.currentTimeMillis() );
				int id = mbSvc.selectMemberIdByLogin(login);
				ses.setAttribute("id", new Integer(id) );
				mav.setViewName("redirect:/main.fdl");
			} else if( authResult == MyCode.SELLER_LOGIN_AUTH_OK ) {
				ses.setAttribute("LoginName", login);
				ses.setAttribute("LoginTime", 
						System.currentTimeMillis() );
				int id = selSvc.selectSellerIdByLogin(login);
				ses.setAttribute("id", new Integer(id) );
				mav.setViewName("redirect:/main.fdl");
			} else {
				mav.addObject("msg", "로그인 실패!! - "
						+ authResult + " : " +
					MyCode.getMsg(authResult) );
				mav.setViewName("login_form");
			}
			
		} else {
			System.out.println("login, pw" + login + password);
			authResult = logSvc.loginProcess(login, password);
			if(authResult == MyCode.MEMBER_LOGIN_AUTH_OK ) {
				ses.setAttribute("LoginName", login);
				ses.setAttribute("LoginTime", 
						System.currentTimeMillis() );
				int id = mbSvc.selectMemberIdByLogin(login);
				ses.setAttribute("id", new Integer(id) );
				mav.setViewName("redirect:/admin.fdl");
			} else {
				mav.addObject("msg", "로그인 실패!! - "
						+ authResult + " : " +
					MyCode.getMsg(authResult) );
				mav.setViewName("login_form");
			}
		}		
		return mav;
	}
	
//	logout.fdl
	@RequestMapping(value = "logout.fdl", 
			method = RequestMethod.GET)
	public String adminLogoutProc(HttpSession ses) {
		String login = (String)ses
					.getAttribute("LoginName");
		long loginStarted = (Long)ses
				.getAttribute("LoginTime");
		long currentTime = System.currentTimeMillis();
		long elapsedTime = currentTime - loginStarted;
		
		System.out.println(login + " 회원이 로그아웃: "
				+ elapsedTime/1000.0 + "초가 로그인 활동함.." );
		ses.invalidate();
		return "redirect:/";
	}
}
