package com.fdl.foodlee.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.service.inf.IMemberSVC;

@Controller
public class MypageController {

	   @Autowired
	    private IMemberSVC mbSvc;
	   
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value = "my_page.fdl", method = RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
	// 정보 확인
	@RequestMapping(value = "member_show.fdl", method = RequestMethod.GET)
    public ModelAndView memberShowProc(String login) {
        ModelAndView mav = new ModelAndView();
        if( login == null || login.isEmpty() ) {
            mav.addObject("msg","회원조회 실패");
            mav.setViewName("redirect:member_show.fdl");
            return mav;
        }
        
        MemberVO mb = mbSvc.selectOneMember(login); // UQ       
        if( mb != null ) {
            mav.addObject("msg","회원조회 성공 - "+ login);
            mav.addObject("member", mb);
            mav.setViewName("member/mb_show");
        } else {
            mav.addObject("msg","회원조회 실패 - " + login);
            mav.setViewName("redirect:member_show.fdl");
        } 
        
        return mav;
    }
    
	// 정보 수정
    @RequestMapping(value = "member_edit_form.my", method = RequestMethod.GET)
    public ModelAndView memberEditFormProc(
            int id) {
            //HttpServletRequest request) {
//      int mbId = Integer.parseInt(
//              request.getParameter("id"));
        MemberVO mb = mbSvc.selectOneMember(id);
        ModelAndView mav = new ModelAndView();
        if( mb != null ) {
            mav.addObject("msg","회원편집폼 준비 성공! - "+ id);
            mav.addObject("member", mb);
            mav.setViewName("member/mb_edit_form");
        } else {
            mav.addObject("msg","회원편집폼 준비 실패! - " + id);
            mav.setViewName("redirect:member_list.my");
        }
        return mav; 
    }
    
//  member_pw_chagnge.my??
    @RequestMapping(value = "member_pw_chagnge.my", 
            method = RequestMethod.POST)
    public String memberPasswordChangeProc() {
        return null;
    }
    
//  member_update.my (proc, post, 세션, dao, 회원)
    @RequestMapping(value = "member_update.my", 
            method = RequestMethod.POST)
    public ModelAndView memberUpdateProc(int id, String name, int age, 
            String email, String password, String login ) {
        MemberVO mb = new MemberVO(id, name, login, login, login, login, age, email, login, password, null, null, null, null, null);
        boolean b = mbSvc.updateOneMember(mb);
        ModelAndView mav = new ModelAndView();
        if( b ) {
            mav.setViewName("redirect:member_show.my?login="+login);
        } else {
            mav.addObject("msg", "회원 정보 갱신 실패!! "
                        + "<br>" + mb );
            mav.setViewName("member/mb_edit_form");
        }
        return mav;
    }
	
//	
//	// 내 정보
//	@RequestMapping(value = "my_info.fdl")
//	public String myInfo(@RequestParam String ) {
//		return "myinfo";
//	}
	
}
