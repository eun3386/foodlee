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
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.ILoginSVC;
import com.fdl.foodlee.service.inf.IMemberSVC;

@Controller
public class MypageController {

	@Autowired
    private IMemberSVC mbSvc;
	
	@Autowired
	private ILoginSVC logSvc;
	   
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value = "my_page.fdl", method = RequestMethod.GET)
	public ModelAndView infomodify(HttpSession ses) {//정보수정
		ModelAndView mav = new ModelAndView();
		String login = (String)ses.getAttribute("LoginName");
		MemberVO sel = mbSvc.selectOneMember(login);
		if( sel != null ) {
			System.out.println("sel = " + sel);
			mav.addObject("msg","회원조회 성공 - "+ login);
			mav.addObject("member", sel);
			mav.setViewName("my/profile");
		} else {
			mav.addObject("msg","회원조회 실패 - "+ login);
			mav.setViewName("redirect:boss.fdl");
		}

	return mav;
	}
	
//	@RequestMapping(value = "my_info.fdl", method = RequestMethod.GET)
//		
//	}
	
//	// 내 정보 확인
//	@RequestMapping(value = "my_info_show.fdl", method = RequestMethod.GET)
//    public ModelAndView memberShowProc(String login) {
//        ModelAndView mav = new ModelAndView();
//        if( login == null || login.isEmpty() ) {
//            mav.addObject("msg","회원조회 실패");
//            mav.setViewName("redirect:my_page.fdl");
//            return mav;
//        }
//        
//        MemberVO mb = mbSvc.selectOneMember(login); // UQ       
//        if( mb != null ) {
//            mav.addObject("msg","회원조회 성공"+ login);
//            mav.addObject("member", mb);
//            mav.setViewName("my");
//        } else {
//            mav.addObject("msg","회원조회 실패 - " + login);
//            mav.setViewName("redirect:my_page.fdl");
//        } 
//        
//        return mav;
//    }
    
//	// 나의 정보 수정 폼
//    @RequestMapping(value = "my_info_edit.fdl", method = RequestMethod.GET)
//    public ModelAndView memberEditFormProc(int id) {
//        MemberVO mb = mbSvc.selectOneMember(id);
//        ModelAndView mav = new ModelAndView();
//        if( mb != null ) {
////            mav.addObject("msg","회원편집폼 준비 성공"+ id);
//            mav.addObject("member", mb);
////            mav.setViewName("member/mb_edit_form");
//        } else {
//            mav.addObject("msg","회원 정보 수정 준비 실패" + id);
//            mav.setViewName("redirect:my_info.fdl");
//        }
//        return mav; 
//    }

    // 내 정보 수정
    @RequestMapping(value = "my_info_update.fdl", method = RequestMethod.POST)
    public ModelAndView memberUpdateProc(String login, String password, String name, String gender, int age, String residentRN, String email,
			String phoneNumber, String address) {
        MemberVO mb = new MemberVO(login, password, name, gender, age, residentRN, email, phoneNumber, address);
        boolean b = mbSvc.updateOneMember(mb);
        ModelAndView mav = new ModelAndView();
        if( b ) {
            mav.setViewName("redirect:my_page.fdl"+login);
        } else {
            mav.addObject("msg", "회원 정보 갱신 실패"
                        + "<br>" + mb );
            mav.setViewName("mypage");
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
