package com.fdl.foodlee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private ISellerSVC selSvc;
	
//	seller/join_form.fdl (form; get; 비회원)
	@RequestMapping(value = "/join_form.fdl", 
			method = RequestMethod.GET)
	public String sellerJoinForm() {
		return "seller/join_form";
	}
	
//	seller/join.fdl (proc; post; dao; 비회원)
	@RequestMapping(value = "/join.fdl", 
			method = RequestMethod.POST)
	public ModelAndView sellerJoinProc(
			HttpServletRequest request, HttpSession ses) {
		//HttpSession ses = request.getSession();
		
		// 요청 파라미터 뽑기
		String login = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String residentRN = request.getParameter("residentRN1")+"-"+request.getParameter("residentRN2");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String companyRN = request.getParameter("companyRN1")+"-"+request.getParameter("companyRN2")+"-"+request.getParameter("companyRN3");
		
		// 암호화 적용 (aes 알고리즘)
		SellerVO sel = new SellerVO(login, password, name, gender, age, residentRN, email, phoneNumber, address, companyRN);
//		int key = seSvc.insertNewSellerWithCryptoReturnKey(sel);
		boolean b = selSvc.insertNewSellerWithCrypto(sel);

		// 응답 성공유무에 따라 view 분기/ mav 리턴
		// dao 응답을 통해 model 데이터를 생성
		ModelAndView mav = new ModelAndView();		
//		if( key > 0 ) {
		if( b ) {
			mav.addObject("msg", "판매자 회원 가입 성공!!");
			mav.setViewName("redirect:/main.fdl");	
		} else {
			mav.addObject("msg", "판매자 회원 가입 실패~");
			mav.setViewName("seller/join_form"); // fw?
		}		
		return mav;
	}
	
//	seller/dupcheck.fdl (proc; get; dao; 비회원)
	@RequestMapping(value = "/dupcheck.fdl", 
			method = RequestMethod.GET)
	@ResponseBody
	public String sellerLoginDuplicateProc(
			String login) {
		// req.getParam과 타입맵핑을 자동으로 해줌
		if( login != null && !login.isEmpty() ) {
			if( selSvc.isDuplicatedSeller(login) ) {
				return "no";
			} else {
				return "yes";
			}
		} else {
			return "error";
		}
	}
	
//	seller/show_edit_form.fdl
	@RequestMapping(value = "/show_edit_form.fdl", method = RequestMethod.GET)
	public ModelAndView infomodify(HttpSession ses) { //정보수정
		ModelAndView mav = new ModelAndView();
		String login = (String)ses.getAttribute("LoginName");
		if( login == null || login.isEmpty() ) {
			mav.addObject("msg","회원조회 실패! - 파람에러");
			mav.setViewName("redirect:boss.fdl");
			return mav;
		}
		SellerVO sel = selSvc.selectOneSeller(login);
		if( sel != null ) {
			mav.addObject("msg","회원조회 성공 - "+ login);
			mav.addObject("seller", sel);
			mav.setViewName("boss/bossinfo/infomodify");
		} else {
			mav.addObject("msg","회원조회 실패 - "+ login);
			mav.setViewName("redirect:boss.fdl");
		}
		return mav;
	}
	
//	seller/pw_chagnge.fdl
	@RequestMapping(value = "/pw_chagnge.fdl", 
			method = RequestMethod.POST)
	public String memberPasswordChangeProc() {
		return null;
	}
	
//	seller/update.fdl (proc, post, 세션, dao, 회원)
	@RequestMapping(value = "/update.fdl", 
			method = RequestMethod.POST)
	public ModelAndView memberUpdateProc(
			String login, String password, String name, String gender, int age, String residentRn,
			String email, String phoneNumber, String address , String companyRn) {
			//HttpServletRequest request
			//) {
		// req params
		// id => name, age, email, password
		// pw => aes 암호화에서 login을 기준키로 사용하게 했음...
		
//		int id = Integer.parseInt(request.getParameter("id"));
//		String name = request.getParameter("name");
//		int age = Integer.parseInt(request.getParameter("age"));
//		String email = request.getParameter("email");
//		String password = request.getParameter("password");
//		String login = request.getParameter("login");
//		//
		SellerVO sel = new SellerVO(login, password, name, gender, age, residentRn, email, phoneNumber, address, companyRn);
		boolean b = selSvc.updateOneSeller(sel);
		ModelAndView mav = new ModelAndView();
		if( b ) {
			mav.setViewName("redirect:seller/show_edit_form.fdl?login="+login);
		} else {
			mav.addObject("msg", "회원 정보 갱신 실패!! "
						+ "<br>" + sel );
			mav.setViewName("boss/bossinfo/infomodify");
		}
		return mav;
	}
	
}