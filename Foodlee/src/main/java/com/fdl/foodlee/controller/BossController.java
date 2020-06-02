package com.fdl.foodlee.controller;

import java.io.File;
import java.nio.file.Files;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.OrderVO;
import com.fdl.foodlee.model.vo.SellerVO;
import com.fdl.foodlee.service.inf.IBannerFileSVC;
import com.fdl.foodlee.service.inf.IBannerSVC;
import com.fdl.foodlee.service.inf.IFoodtruckFileSVC;
import com.fdl.foodlee.service.inf.IFoodtruckSVC;
import com.fdl.foodlee.service.inf.IOrderSVC;
import com.fdl.foodlee.service.inf.IQnaSVC;
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
	@Autowired
	private IOrderSVC ordSvc;

	@Autowired
	private IBannerFileSVC baFileSvc;
	
	@Autowired
	private IBannerSVC baSvc;
	
	@Autowired
	IQnaSVC qnaSvc;
	
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
	
	//차트를 보여 줄 수 있다.
	@RequestMapping(value = "boss.fdl", method = RequestMethod.GET)
	public String boss(HttpServletRequest request, HttpSession ses, Model model) {//시작화면
		String login = (String) ses.getAttribute("login"); // 주문한 사람의 아이디 <<FK>> o		
		SellerVO svo = this.selSvc.selectOneSeller(login);
		
		FoodtruckVO fvo = this.fdSvc.selectOneFoodtruck(svo.getSellerId()) ;
//		FoodtruckVO fvo = this.fdSvc.selectOneFoodtruck(11) ;
		
//		model.addAttribute("ovo",ovo); //orderVO
		model.addAttribute("fvo",fvo); //foodtruckVO
		model.addAttribute("svo",svo); //sellerVO
	//	boolean b = selSvc.insertNewSellerWithCrypto(svo);
	//order 리스트
		List<OrderVO> orList = ordSvc.sellerOrderList(svo.getSellerId());
//		List<OrderVO> orList = ordSvc.sellerOrderList(11);
		model.addAttribute("orSize", orList.size());
		model.addAttribute("orders", orList);
		
		int[] cntOPS =  new int[4];
		for (OrderVO od : orList) {
			if( od.getOrderPriceSum() < 10000 ) cntOPS[0]++;
			else if( od.getOrderPriceSum() < 30000 ) cntOPS[1]++;
			if( od.getOrderPriceSum() < 50000 ) cntOPS[2]++;
			else cntOPS[3]++;
		}
		System.out.println(cntOPS[0]);	System.out.println(cntOPS[1]);	System.out.println(cntOPS[2]);	System.out.println(cntOPS[3]);
		model.addAttribute("cntOPS", cntOPS);
		
		
		Calendar cal = Calendar.getInstance(Locale.KOREA);
		SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd");    
		Date today = new Date();
		String date =  formatter.format(today);
		
		Date dDate1 = new Date();
		Date dDate2 = new Date();
		Date dDate3 = new Date();
		Date dDate4 = new Date();
		Date dDate5 = new Date();
		Date dDate6 = new Date();
		
		dDate1 = new Date(dDate1.getTime()+(1000*60*60*24*-1));
		dDate2 = new Date(dDate2.getTime()+(1000*60*60*24*-2));
		dDate3 = new Date(dDate3.getTime()+(1000*60*60*24*-3));
		dDate4 = new Date(dDate4.getTime()+(1000*60*60*24*-4));
		dDate5 = new Date(dDate5.getTime()+(1000*60*60*24*-5));
		dDate6 = new Date(dDate6.getTime()+(1000*60*60*24*-6));
		SimpleDateFormat dSdf = new SimpleDateFormat("yyyy/MM/dd", Locale.KOREA);
		SimpleDateFormat ydt = new SimpleDateFormat("E", Locale.KOREA);
//		SimpleDateFormat dSdf = new SimpleDateFormat("MM/dd", Locale.KOREA);
		String ttday1 = dSdf.format(today);
		String yesterday1 = dSdf.format(dDate1);
		String yesterday2 = dSdf.format(dDate2);
		String yesterday3 = dSdf.format(dDate3);
		String yesterday4 = dSdf.format(dDate4);
		String yesterday5 = dSdf.format(dDate5);
		String yesterday6 = dSdf.format(dDate6);
		
		String[] ytday = {ydt.format(dDate1),ydt.format(dDate2),ydt.format(dDate3),
				ydt.format(dDate4),ydt.format(dDate5),ydt.format(dDate6)};
		System.out.println(ytday[0]);
		String[] week = {"일","월","화","수","목","금","토"};
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date1 = cal.get(Calendar.DATE);
		int weeks = cal.get(Calendar.DAY_OF_WEEK)-1;
		//cal.add(Calendar.DAY_OF_WEEK,-1);
		//String[] days = new String[14];
		int yesWeeks = 6;
		if( weeks > 0 ) yesWeeks = weeks - 1 ;
		String today1 = week[weeks];
		String yesterday = week[yesWeeks];
		//System.out.println(yesterday + "," + today1);	

		int wsel[] = new int[7];
		for (OrderVO od : orList) {
			String orderdate = dSdf.format(od.getOrderDate());
			if (orderdate == ttday1) {wsel[0] = wsel[0] + od.getOrderPriceSum();}
			if (orderdate == yesterday1) {wsel[1] = wsel[1] + od.getOrderPriceSum();}
			if (orderdate == yesterday2) {wsel[2] = wsel[2] + od.getOrderPriceSum();}
			if (orderdate == yesterday3) {wsel[3] = wsel[3] + od.getOrderPriceSum();}
			if (orderdate == yesterday4) {wsel[4] = wsel[4] + od.getOrderPriceSum();}
			if (orderdate == yesterday5) {wsel[5] = wsel[5] + od.getOrderPriceSum();}
			if (orderdate == yesterday6) {wsel[6] = wsel[6] + od.getOrderPriceSum();}
		}
		
		model.addAttribute("today", today1);
		model.addAttribute("ytday", ytday);
//		model.addAttribute("today1", yesterday1);
//		model.addAttribute("today2", yesterday2);
//		model.addAttribute("today3", yesterday3);
//		model.addAttribute("today4", yesterday4);
//		model.addAttribute("today5", yesterday5);
//		model.addAttribute("today6", yesterday6);
		model.addAttribute("wsel", wsel);

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
	// 배너 광고 신청
		// banner_apply.fdl
		@RequestMapping(value = "banner_apply.fdl", 
				method = RequestMethod.POST)
		@ResponseBody
		public String bannerApplyProc(HttpServletRequest req,
				 List<MultipartFile> upfiles,
				HttpSession ses) {
			System.out.println("banner_apply()");
//			System.out.println("multipart: " + upfile.getName());
			System.out.println("multipart size: " 
							+ upfiles.size());
			Timestamp adDate = Timestamp.valueOf(req.getParameter("adStartDate") + " 00:00:00");		
			System.out.println("upfiles = " + req.getParameter("upfiles"));
			System.out.println("adDate =" + adDate);
			String realPath =  
				ses.getServletContext()
				.getRealPath(IBannerFileSVC.DEF_UPLOAD_DEST)
						 + "/";
			baFileSvc.makeUserDir(ses, "aaa");
			System.out.println("realPath =" + realPath);
			System.out.println("adPrice =" + req.getParameter("adPrice"));
			int adPrice =  Integer.parseInt(req.getParameter("adPrice"));
//			String filePath 
//				= atFileSvc.writeUploadedFile(upfile, 
//					realPath, (String)ses
//						.getAttribute("mbLoginName"));
			System.out.println("upfiles = " + upfiles.get(0));
			//String filePath  // 다수개 처리
			Map<String, Object> rMap
			 = baFileSvc.writeUploadedMultipleFiles(upfiles, 
				realPath, "aaa");
//				(String)ses
//					.getAttribute("mbLoginName"));
			String filePath = (String)rMap.get("muliFPs");
			
			System.out.println("총 파일 수: " + rMap.get("fileCnt"));
			System.out.println("총 볼륨(MB): "+ rMap.get("totalMB") 
					+"MB");
			int selId = (int) ses.getAttribute("id");
			// public img src... 
			int baRtkey = this.baSvc.insertNewBannerReturnKey(filePath, adPrice, adDate, adDate, 0, selId);
			// 상세보기 => atId?
			if( baRtkey > 0 ) {
				System.out.println("배너 신청 성공: " + baRtkey);
				return "redirect:ad.fdl?id="+baRtkey; // 결제 
				//return "redirect:article_list.my"; // RD
			} else {
				System.out.println("배너 신청 실패: " + selId);
				return "boss/bossinfo/ad2"; // FW
			}
		}	
//	@RequestMapping(value = "storeinfo.fdl", method = RequestMethod.GET)
//	public String storeinfo() {//트럭정보
//		return "boss/bossmenu/storeinfo";
//	}
	
}





