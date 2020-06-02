package com.fdl.foodlee.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.MemberVO;
import com.fdl.foodlee.service.inf.IMemberFileSVC;
import com.fdl.foodlee.service.inf.IMemberSVC;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private IMemberSVC mbSvc;
	@Autowired
	private IMemberFileSVC mbFileSvc;
	
//	member/join_form.fdl (form; get; 비회원)
	@RequestMapping(value = "/join_form.fdl", 
			method = RequestMethod.GET)
	public String memberJoinForm() {
		return "member/join_form";
	}
	
//	member/join.fdl (proc; post; dao; 비회원)
	@RequestMapping(value = "/join.fdl", 
			method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView memberJoinProc(List<MultipartFile> upfiles,
			HttpServletRequest request, HttpSession ses) {
		
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
		
		String realPath = ses.getServletContext().getRealPath(IMemberFileSVC.DEF_UPLOAD_DEST) + "/";
		
		mbFileSvc.makeUserDir(ses, login);
		
		Map<String, Object> rMap
		 = mbFileSvc.writeUploadedMultipleFiles(upfiles, realPath, login);
		String filePath = (String)rMap.get("muliFPs");
		
		System.out.println("총 파일 수: " + rMap.get("fileCnt"));
		System.out.println("총 볼륨(MB): "+ rMap.get("totalMB") +"MB");
		
		// 암호화 적용 (aes 알고리즘)
		MemberVO mb = new MemberVO(login, password, name, gender, age, residentRN, email, phoneNumber, address, filePath);
//		int key = mbSvc.insertNewMemberWithCryptoReturnKey(mb);
		boolean b = mbSvc.insertNewMemberWithCrypto(mb);

		// 응답 성공유무에 따라 view 분기/ mav 리턴
		// dao 응답을 통해 model 데이터를 생성
		ModelAndView mav = new ModelAndView();		
//		if( key > 0 ) {
		if( b ) {
			mav.addObject("msg", login+"님 일반 회원 가입 성공!!");
			mav.setViewName("redirect:/main.fdl");
		} else {
			mav.addObject("msg", "일반 회원 가입 실패~");
			mav.setViewName("member/join_form"); // fw?
		}
		return mav;
	}
	
//	member/dupcheck.fdl (proc; get; dao; 비회원)
	@RequestMapping(value = "/dupcheck.fdl", 
			method = RequestMethod.GET)
	@ResponseBody
	public String memberLoginDuplicateProc(
			String login) {
		// req.getParam과 타입맵핑을 자동으로 해줌
		if( login != null && !login.isEmpty() ) {
			if( mbSvc.isDuplicatedMember(login) ) {
				return "no";
			} else {
				return "yes";
			}
		} else {
			return "error";
		}
	}
	
}