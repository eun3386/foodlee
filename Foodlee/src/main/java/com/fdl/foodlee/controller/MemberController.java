package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


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
//	member/login_form.fdl (form, get; 비회원)
	@RequestMapping(value = "/login_form.fdl", method = RequestMethod.GET)
	public String memberLoginForm() {
		return "member/mb_login_form";
	}
// member/login.fdl (proc, post, dao; 암호화; 세션; 회원)
	@RequestMapping(value = "/login.fdl", method = RequestMethod.POST)
	public ModelAndView memberLoginProc(
			HttpSession ses, 
			String login, String pw) {
		// TODO
		System.out.println("login = "+ login);
		System.out.println("pw = "+ pw);
		ModelAndView mav = new ModelAndView();
		
//		MemberVO mbFound = mbDao.selectOneMember(login); 
//		int authResult
//			= mbSvc.loginProcess(login,pw);
////		String str = 
////				mbDao.loginAuthenticate(login,
////						mbFound.getId());
//		if( authResult == MyCode.MB_LOGIN_AUTH_OK ) {
//			ses.setAttribute("mbLoginName", login);
//			ses.setAttribute("mbLoginTime", 
//					System.currentTimeMillis() );
//			int mbId = mbSvc.selectMemberIdByLogin(login);
//			ses.setAttribute("mbId", new Integer(mbId) );
//			mav.setViewName("redirect:member_list.my");
//		} else {
//			mav.addObject("msg", "로그인 실패!! - "
//						+ authResult + " : " +
//					MyCode.getMsg(authResult) );
//			mav.setViewName("member/mb_login_form");
//		}		
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
}
