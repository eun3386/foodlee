package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.dao.MyCode;
import com.fdl.foodlee.service.inf.IAdminSVC;

@Controller
public class AdminController {
	
	@Autowired
	private IAdminSVC adSvc;
	
	@RequestMapping(value = "admin.fdl", method = RequestMethod.GET)
	public String admin() {
		return "admin/admin";
	}
	
	@RequestMapping(value = "member/ad_login.fdl", method = RequestMethod.POST)
	//- 로그인 할 수 있다 (세션+암호화 인증)
	public ModelAndView adminLoginProc(
			HttpSession ses, 
			String login, String password) {
		System.out.println("login = "+ login);
		System.out.println("pw = "+ password);
		ModelAndView mav = new ModelAndView();
		
		int authResult 
			= adSvc.adminLoginCheck(login, password);
		
		if( authResult == MyCode.LOGIN_AUTH_OK ) {
			ses.setAttribute("adLoginName", login);
			ses.setAttribute("adLoginTime", 
					System.currentTimeMillis() );
			int adId = adSvc.selectAdminIdbyLogin(login);
			ses.setAttribute("adId", new Integer(adId) );
			mav.setViewName("redirect:/admin.fdl");
		} else {
			mav.addObject("msg", "로그인 실패!! - "
						+ authResult + " : " +
					MyCode.getMsg(authResult) );
			mav.setViewName("member/mb_login_form");
		}		
		return mav;
	}	
}
