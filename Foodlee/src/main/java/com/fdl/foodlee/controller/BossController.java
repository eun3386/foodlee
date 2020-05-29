package com.fdl.foodlee.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.IFoodtruckFileSVC;
import com.fdl.foodlee.service.inf.IFoodtruckSVC;
import com.fdl.foodlee.service.inf.IReviewFileSVC;
import com.fdl.foodlee.service.inf.ISellerSVC;

@Controller
public class BossController {
	
	@Autowired
	private ISellerSVC selSvc;
	
	@Autowired
	private IFoodtruckSVC fdSvc;
	
	@Autowired
	private IFoodtruckFileSVC fdfSvc;
	

	// 판매자의 새 푸드트럭을 등록 할 수 있다. 트럭 등록 성공시 트럭pk뽑아서 트럭 상세보기로 redi 한다
	@RequestMapping(value = "storeinfo.fdl", method = RequestMethod.GET) 
	public	String storeinfo() {//트럭등록 
		return "boss/bossmenu/storeinfo"; //form
		} 
	@RequestMapping(value = "store_new_form.fdl", method = RequestMethod.GET) 
	public	String storeNewForm() {//트럭등록 
		return "boss/bossmenu/store_new_form"; //form
		
		} 
	
	@RequestMapping(value = "store_add.fdl", method = RequestMethod.POST)
	// @ResponseBody
	public ModelAndView sellerStoreinfoProc(HttpServletRequest request, HttpSession ses, 
			List<MultipartFile> imgfiles, Model model) {// 데이터와 뷰를 동시에 설정이 가능  
		//트럭등록 FoodtruckVO ft
		//boolean sb = fodSvc.insertNewFoodtruck(ft);//
		
		String foodtruckName = request.getParameter("truckName"); //트럭이름
		int menuCategory = Integer.parseInt(request.getParameter("category"));//카테고리
		String foodtruckMainMenu = request.getParameter("MainMenu"); //대표메뉴
		String foodtruckMuni = request.getParameter("location").split(",")[1]; //트럭구이름 ftlocation
		String foodtruckLocation = request.getParameter("truckLoca"); //트럭위치
		int foodtruckGuCode = Integer.parseInt(request.getParameter("location").split(",")[0]); //구코드
		String foodtruckImgPath = request.getParameter("ImgPath"); //트럭이미지 미정
		String foodtruckOperationHour = request.getParameter("OperationHour1")+"~"+request.getParameter("OperationHour2");//영업시간
		String sellerFoodtruckCoordinate = request.getParameter("namp_lat")+","+request.getParameter("namp_lng"); //트럭좌표 죄표 
		System.out.println("파일값" + imgfiles);
		String login = "test";
		String login2 = ses.getId();
		String realPath = ses.getServletContext().getRealPath(IFoodtruckFileSVC.DEF_UPLOAD_DEST) + "/"; //+ login;
		
		File trFile = new File(realPath + login);
		trFile.mkdir();		
		
		//fdfSvc.makeUserDir(ses, "test");
		
		System.out.println("경로 : " + realPath);
		Map<String, Object> rMap = fdfSvc.writeUploadedMultipleFiles(imgfiles, realPath, login); //(String)ses.getAttribute("sellerId"));
				/*(String) ses.getAttribute("mbLoginName")*/
		
		String filePath = (String)rMap.get("muliFPs");
		System.out.println("총 파일 수: " + rMap.get("fileCnt"));
		System.out.println("총 볼륨(MB): " + rMap.get("totalMB") + "MB");
		System.out.println("login: "+login);
		System.out.println("imgfiles: "+imgfiles);
		
		FoodtruckVO ft = new FoodtruckVO(filePath, foodtruckName, foodtruckMainMenu, menuCategory,
				foodtruckLocation, foodtruckMuni, foodtruckGuCode, foodtruckOperationHour,
				 sellerFoodtruckCoordinate);
		model.addAttribute(ft);
		boolean b = fdSvc.insertNewFoodtruck(ft);
		ModelAndView mv = new ModelAndView();
//		System.out.println(menuCategory);
//		System.out.println(foodtruckGuCode);
		
		if( b ) {
			
			mv.setViewName("boss/bossmenu/storeinfo"); // 뷰의 이름 뷰의 경로 상세보기 readonly 실패시 ㄷ시 돌아가기
			mv.addObject("foodtruckOperationHour", foodtruckOperationHour); // 뷰로 보낼 데이터 값 영업시간
			mv.addObject("foodtruckMuni", foodtruckMuni); // 뷰로 보낼 데이터 값 구 이름 
			mv.addObject("foodtruckName", foodtruckName); // 뷰로 보낼 데이터 값 판매트럭 이름
			mv.addObject("sellerFoodtruckCoordinate", sellerFoodtruckCoordinate); // 뷰로 보낼 데이터 값 판매트럭 상세위치
			mv.addObject("realPath", realPath); // 뷰로 보낼 데이터 값 트럭사진 경로
			mv.addObject("menuCategory", menuCategory); // 뷰로 보낼 데이터 값 카테고리
			mv.addObject("foodtruckMainMenu", foodtruckMainMenu); // 뷰로 보낼 데이터 값 대표메뉴
			mv.addObject("foodtruckLocation", foodtruckLocation); // 뷰로 보낼 데이터 값 트럭위치
			mv.addObject("sellerId", login); // 뷰로 보낼 데이터 값 트럭위치 imgfiles
			mv.addObject("imgfiles", imgfiles); // 뷰로 보낼 데이터 값 트럭위치 realPath
			mv.addObject("realPath", filePath);

		} else {
			mv.addObject("msg", "푸드트럭 전송 실패"); // 뷰로 보낼 데이터 값
			mv.setViewName("boss/bossmenu/store_new_form"); // 뷰의 이름 뷰의 경로 상세보기 readonly 실패시 ㄷ시 돌아가기
		}		
		return mv; 
	}
	

//public interface IFoodtruckDAO {
	// 판매자의 새 푸드트럭을 등록 할 수 있다.
//	public boolean insertNewFoodtruck(FoodtruckVO ft);
	/*
	 * if( authResult == MyCode.SELLER_LOGIN_AUTH_OK ) {
	 * ses.setAttribute("LoginName", login); ses.setAttribute("LoginType",
	 * authResult); ses.setAttribute("LoginTime", System.currentTimeMillis() ); int
	 * id = selSvc.selectSellerIdbyLogin(login); ses.setAttribute("id", new
	 * Integer(id) ); selSvc.updateSellerLoginTime(id);
	 * mav.setViewName("redirect:/main.fdl"); 
	 * }else {
			return "푸드트럭 등록 실패";
		}
	 */

	//차트를 보여 줄 수 있다.
	@RequestMapping(value = "boss.fdl", method = RequestMethod.GET)
	public String boss() {//시작화면
		
		return "boss";
	}
	@RequestMapping(value = "menumodify.fdl", method = RequestMethod.GET)
	public ModelAndView menumodify(HttpSession ses) {//메뉴수정
		String login = (String)ses.getAttribute("LoginName");
		SellerVO sel = selSvc.selectOneSeller(login);
		ModelAndView mav = new ModelAndView();
		mav.addObject("seller", sel);
		mav.setViewName("boss/bossmenu/menumodify");
		return mav;
	}
	@RequestMapping(value = "infomodify.fdl", method = RequestMethod.GET)
	public ModelAndView infomodify(HttpSession ses) {//정보수정
		ModelAndView mav = new ModelAndView();
		String login = (String)ses.getAttribute("LoginName");
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
	@RequestMapping(value = "orderlist.fdl", method = RequestMethod.GET)
	public String orderlist() { //주문리스트
		return "boss/bossorder/orderlist";
	}
	@RequestMapping(value = "review.fdl", method = RequestMethod.GET)
	public String order() {//리뷰목록
		return "boss/bossreview/review";
	}
	@RequestMapping(value = "position.fdl", method = RequestMethod.GET)
	public String position() {//리뷰목록
		return "boss/bossinfo/position";
	}
	@RequestMapping(value = "ad.fdl", method = RequestMethod.GET)
	public String ad() {//광고
		return "boss/bossinfo/ad2";
	}
//	@RequestMapping(value = "storeinfo.fdl", method = RequestMethod.GET)
//	public String storeinfo() {//트럭정보
//		return "boss/bossmenu/storeinfo";
//	}
	
}





