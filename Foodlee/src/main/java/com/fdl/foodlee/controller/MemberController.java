package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.dao.MyCode;
import com.fdl.foodlee.service.inf.IAdminSVC;
import com.fdl.foodlee.service.inf.IMemberSVC;
import com.fdl.foodlee.service.inf.ISellerSVC;


/*
- 회원가입구분/약관동의 할 수 있다.
	member/join_choice_form.fdl (get, )
- 회원가입 할 수 있다.
	member/new_join_form.fdl
	member/join.fdl
- 아이디를 찾을 수 있다.
	member/find_id.fdl
- 비밀번호를 찾을 수 있다.
	member/find_pw.fdl
- 아이디 중복체크를 할 수 있다.
	member/dupcheck.fdl
- 로그인 할 수 있다.
	member/login_form.fdl
	member/login.fdl
- 로그아웃 할 수 있다.
	member/logout.fdl
- 자신의 정보를 확인 할 수 있다.
	member/show.fdl
- 자신의 정보를 갱신 할 수 있다.
	member/edit_form.fdl
	member/update.fdl
- 탈퇴 할 수 있다.
	member/delete.fdl
 */

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private IMemberSVC mbSvc;
	
	@Autowired
	private IAdminSVC adSvc;
	
	@Autowired
	private ISellerSVC selSvc;
	
//	member/login_form.fdl (form, get; 비회원)
	@RequestMapping(value = "/login_form.fdl", method = RequestMethod.GET)
	public String memberLoginForm() {
		return "member/mb_login_form";
	}
	
// 	member/login.fdl (proc, post, dao; 암호화; 세션; 회원)
	@RequestMapping(value = "/login.fdl", method = RequestMethod.POST)
	public ModelAndView memberLoginProc(
			HttpSession ses, String login, String password) {
		System.out.println("login = "+ login);
		System.out.println("pw = "+ password);
		ModelAndView mav = new ModelAndView();
		int authResult;
		if( login.equals("admin") == false ) {
			authResult = mbSvc.loginProcess(login, password);
			if( authResult == MyCode.MEMBER_LOGIN_AUTH_OK ) {
				ses.setAttribute("mbLoginName", login);
				ses.setAttribute("mbLoginTime", 
						System.currentTimeMillis() );
				int mbId = mbSvc.selectMemberIdByLogin(login);
				ses.setAttribute("mbId", new Integer(mbId) );
				mav.setViewName("redirect:/main.fdl");
			} else if( authResult == MyCode.SELLER_LOGIN_AUTH_OK ) {
				ses.setAttribute("selLoginName", login);
				ses.setAttribute("selLoginTime", 
						System.currentTimeMillis() );
				int selId = selSvc.selectSellerIdByLogin(login);
				ses.setAttribute("selId", new Integer(selId) );
				mav.setViewName("redirect:/main.fdl");
			} else {
				mav.addObject("msg", "로그인 실패!! - "
						+ authResult + " : " +
					MyCode.getMsg(authResult) );
				mav.setViewName("member/mb_login_form");
			}
			
		} else {
			System.out.println("login, pw" + login + password);
			authResult = adSvc.adminLoginCheck(login, password);
			if(authResult == MyCode.ADMIN_LOGIN_AUTH_OK ) {
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
		}		
		return mav;
	}
	
//	member/join_choice_form.fdl (form; get; 비회원)
	@RequestMapping(value = "/join_choice_form.fdl", 
			method = RequestMethod.GET)
	public String mbSignUpChoiceForm() {	
		System.out.println("mb sign up choice form 준비!!!");
		return "member/mb_sign_up_choice_form";
	}
	
//	mb_sign_up_form.fdl (form; get; 비회원)
	@RequestMapping(value = "/sign_up_form.fdl", 
			method = RequestMethod.GET)
	public String mbSignUpForm() {
		System.out.println("mb sign up form 준비!!!");
		return "member/mb_sign_up_form";
	}
	
// 	member_logout.fdl
	@RequestMapping(value = "member_logout.fdl", 
			method = RequestMethod.GET)
	public String memberLogoutProc(HttpSession ses) {
		String login = (String)ses
					.getAttribute("mbLoginName");
		long loginStarted = (Long)ses
				.getAttribute("mbLoginTime");
		long currentTime = System.currentTimeMillis();
		long elapsedTime = currentTime - loginStarted;
		
		System.out.println(login + " 회원이 로그아웃: "
				+ elapsedTime/1000.0 + "초가 로그인 활동함.." );
		ses.invalidate();
		return "redirect:/";
	}
}