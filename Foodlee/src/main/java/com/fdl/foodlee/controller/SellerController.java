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

import com.fdl.foodlee.model.vo.MenuVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.IMemberFileSVC;
import com.fdl.foodlee.service.inf.IMenuSVC;
import com.fdl.foodlee.service.inf.ISellerFileSVC;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private ISellerSVC selSvc;
	
	@Autowired
	private IMenuSVC mnSvc;
	
	@Autowired
	private ISellerFileSVC selFileSvc;
	
//	seller/join_form.fdl (form; get; 鍮꾪쉶�썝)
	@RequestMapping(value = "/join_form.fdl", 
			method = RequestMethod.GET)
	public String sellerJoinForm() {
		return "seller/join_form";
	}
	
//	seller/join.fdl (proc; post; dao; 鍮꾪쉶�썝)
	@RequestMapping(value = "/join.fdl", 
			method = RequestMethod.POST)
	public ModelAndView sellerJoinProc(List<MultipartFile> upfiles,
			HttpServletRequest request, HttpSession ses) {
		// �슂泥� �뙆�씪誘명꽣 戮묎린
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
		
		selFileSvc.makeUserDir(ses, login);
		
		String realPath = ses.getServletContext().getRealPath(ISellerFileSVC.DEF_UPLOAD_DEST) + "/";
		
		Map<String, Object> rMap
		 = selFileSvc.writeUploadedMultipleFiles(upfiles, realPath, login);
		String filePath = (String)rMap.get("muliFPs");
		
		System.out.println("珥� �뙆�씪 �닔: " + rMap.get("fileCnt"));
		System.out.println("珥� 蹂쇰ⅷ(MB): "+ rMap.get("totalMB") +"MB");
		
		// �븫�샇�솕 �쟻�슜 (aes �븣怨좊━利�)
		SellerVO sel = new SellerVO(login, password, name, gender, age, residentRN, email, phoneNumber, address, companyRN, filePath);
//		int key = seSvc.insertNewSellerWithCryptoReturnKey(sel);
		boolean b = selSvc.insertNewSellerWithCrypto(sel);

		// �쓳�떟 �꽦怨듭쑀臾댁뿉 �뵲�씪 view 遺꾧린/ mav 由ы꽩
		// dao �쓳�떟�쓣 �넻�빐 model �뜲�씠�꽣瑜� �깮�꽦
		ModelAndView mav = new ModelAndView();		
//		if( key > 0 ) {
		if( b ) {
			mav.addObject("msg", login+"�떂 �뙋留ㅼ옄 �쉶�썝 媛��엯 �꽦怨�!!");
			mav.setViewName("redirect:/main.fdl");	
		} else {
			mav.addObject("msg", "�뙋留ㅼ옄 �쉶�썝 媛��엯 �떎�뙣~");
			mav.setViewName("seller/join_form"); // fw?
		}		
		return mav;
	}
	
//	seller/dupcheck.fdl (proc; get; dao; 鍮꾪쉶�썝)
	@RequestMapping(value = "/dupcheck.fdl", 
			method = RequestMethod.GET)
	@ResponseBody
	public String sellerLoginDuplicateProc(
			String login) {
		// req.getParam怨� ���엯留듯븨�쓣 �옄�룞�쑝濡� �빐以�
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
	
//	seller/show_form.fdl
	@RequestMapping(value = "/show_form.fdl", method = RequestMethod.GET)
	public ModelAndView sellerShowForm(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String login = (String)ses.getAttribute("LoginName");
		SellerVO sel = selSvc.selectOneSeller(login);
		if( sel != null ) {
			mav.addObject("seller", sel);
			mav.setViewName("seller/show_form");
		} else {
			mav.setViewName("redirect:boss.fdl");
		}
		return mav;
	}
	
//	seller/edit_form.fdl
	@RequestMapping(value = "/edit_form.fdl", method = RequestMethod.GET)
	public ModelAndView sellerEditForm(HttpSession ses) {
		ModelAndView mav = new ModelAndView();
		String login = (String)ses.getAttribute("LoginName");
		SellerVO sel = selSvc.selectOneSeller(login);
		if( sel != null ) {
			mav.addObject("seller", sel);
			mav.setViewName("seller/edit_form");
		} else {
			mav.setViewName("redirect:boss.fdl");
		}
		return mav;
	}
	
//	seller/pw_chagnge.fdl
	@RequestMapping(value = "/pw_change.fdl", 
			method = RequestMethod.POST)
	public ModelAndView sellerPasswordChangeProc(HttpServletRequest request, HttpSession ses) {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String login = request.getParameter("login");		
		String password = request.getParameter("password");
		
		boolean b = selSvc.updateOneSellerPW(id, login, password);
		ModelAndView mav = new ModelAndView();
		if( b ) {
			mav.setViewName("redirect:/seller/show_form.fdl?login="+login);
		} else {
			mav.setViewName("boss/bossinfo/infomodify");
		}
		return mav;
	}
	
//	seller/update.fdl (proc, post, �꽭�뀡, dao, �쉶�썝)
	@RequestMapping(value = "/update.fdl", 
			method = RequestMethod.POST)
	public ModelAndView sellerUpdateProc(List<MultipartFile> upfiles, HttpServletRequest request, HttpSession ses) {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String residentRn = request.getParameter("residentRn1")+"-"+request.getParameter("residentRn2");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String companyRn = request.getParameter("companyRn1")+"-"+request.getParameter("companyRn2")+"-"+request.getParameter("companyRn3");
		
		SellerVO sel = new SellerVO(id, "seller", login, password, name, gender, age, residentRn, email, phoneNumber, address, null, null, companyRn, null, null, null);
		boolean b = selSvc.updateOneSeller(sel);
		ModelAndView mav = new ModelAndView();
		if( b ) {
			mav.setViewName("redirect:/seller/show_form.fdl?login="+login);
		} else {
			mav.setViewName("seller/edit_form");
		}
		return mav;
	}
	
//	seller/menu_add_form.fdl
	@RequestMapping(value = "/menu_add_form.fdl", method = RequestMethod.GET)
	public ModelAndView menuAddForm(HttpSession ses) {
		String login = (String)ses.getAttribute("LoginName");
		SellerVO sel = selSvc.selectOneSeller(login);
		ModelAndView mav = new ModelAndView();
		mav.addObject("seller", sel);
		mav.setViewName("seller/menu_add_form");
		return mav;
	}
	
//	seller/menu_add.fdl
	@RequestMapping(value = "/menu_add.fdl", method = RequestMethod.POST)
	public ModelAndView menuAddProc(String menuName, String menuType, int menuPrice, String menuPic, String menuInfor, String rawMaterials) {
		MenuVO mn = new MenuVO(0, menuName, menuType, menuPrice, menuPic, menuInfor, rawMaterials);
		boolean b = mnSvc.insertNewMenu(mn);
		ModelAndView mav = new ModelAndView();
		if( b ) {
			mav.setViewName("redirect:/boss.fdl");
		} else {
			mav.setViewName("boss/bossmenu/menumodify");
		}
		return mav;
	}
	
}