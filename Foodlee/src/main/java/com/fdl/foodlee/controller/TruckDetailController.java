package com.fdl.foodlee.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.dao.inf.IMemberLikeTruckDAO;
import com.fdl.foodlee.model.vo.FoodtruckVO;
import com.fdl.foodlee.model.vo.ReviewVO;
import com.fdl.foodlee.service.inf.IFoodtruckSVC;
import com.fdl.foodlee.service.inf.IMemberLikeTruckSVC;
import com.fdl.foodlee.service.inf.IReviewFileSVC;
import com.fdl.foodlee.service.inf.IReviewSVC;

@Controller
public class TruckDetailController {
	@Autowired
	IReviewSVC rvSvc;
	@Autowired
	private IReviewFileSVC rvFileSvc;
	@Autowired
	IFoodtruckSVC fdSvc;
	@Autowired
	IMemberLikeTruckSVC mltSvc;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "truckDetail.fdl", method = RequestMethod.GET)
	public String truckDetail(HttpSession ses, Model model) {
		ses.setAttribute("mbId", 1); // 멤버 아이디 임시 설정
		ses.setAttribute("login", "seller"); // 로그인 임시설정
		ses.setAttribute("sellerId", 1); // 판매자 번호 임시생성
		
		int isAlreadyLiked = mltSvc.isAlreadyLikedMember(1, (int) ses.getAttribute("mbId"));
		model.addAttribute("isAlreadyLiked", (isAlreadyLiked == IMemberLikeTruckSVC.LIKE_MB_FOUND_ONE
				|| isAlreadyLiked == IMemberLikeTruckSVC.LIKE_MB_FOUND_OTHERS));
		
		FoodtruckVO fd = this.fdSvc.selectOneFoodtruck(1);
		System.out.println(fd.getFoodtruckName());
		model.addAttribute("foodT", fd);
		model.addAttribute("cntLikes", fd.getMemberLikeCount());
		List<ReviewVO> rvList = rvSvc.showAllReview(1);
		if (rvList != null) {
			model.addAttribute("rvSize", rvList.size());
			model.addAttribute("review", rvList);
			System.out.println("리뷰 리스트 조회 성공: " + rvList.size());
		} else {
			System.out.println("조회 실패");
		}
		return "truckDetail";
	}
	
	@RequestMapping(value = "reivew_delete.fdl", method = RequestMethod.GET)
	public String reviewDelete(@RequestParam("id")int id, @RequestParam("depth")int depth) {
		rvSvc.deleteReview(id, depth);
		return "redirect:/truckDetail.fdl";
	}
	
	@RequestMapping(value = "reivew_update.fdl", method = RequestMethod.POST)
	@ResponseBody
	public String reviewUpdate(HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("id")); 
		String rvContent = req.getParameter("text");
		rvSvc.updateReview(id, rvContent);
		return null;
	}
	
	@RequestMapping(value = "review_reply_add.fdl", method = RequestMethod.POST)
	public String reviewReply(HttpServletRequest req) {
		String pnum = req.getParameter("pnum");
		int sellerId = Integer.parseInt(req.getParameter("sellerId"));
		String login = req.getParameter("login");
		String rvReply = req.getParameter("text");
		ReviewVO rv = new ReviewVO(0, login, sellerId, 1, pnum, rvReply, null, null);
		boolean r = rvSvc.reviewReply(rv);
		
		return "redirect:/truckDetail.fdl";
	}
	
	@RequestMapping(value = "review_list.fdl", method = RequestMethod.GET)
	public List<ReviewVO> reviewList(Model model) {
		return rvSvc.showAllReview(1);
	}

	@RequestMapping(value = "new_review.fdl", method = RequestMethod.POST)
	public String newReview(@ModelAttribute(value="rv") ReviewVO rv, List<MultipartFile> imgfiles, HttpSession ses, Model model) {
		System.out.println(rv.getReviewContent());
		System.out.println(imgfiles);
		Map<String, Object> result = new HashMap<>();
		
		String realPath = ses.getServletContext().getRealPath(IReviewFileSVC.DEF_UPLOAD_DEST) + "/";
		rvFileSvc.makeUserDir(ses, "poro");
		
		System.out.println("경로" + realPath);
		Map<String, Object> rMap = rvFileSvc.writeUploadedMultipleFiles(imgfiles, realPath, "poro"
				/*(String) ses.getAttribute("mbLoginName")*/);
		
		String filePath = (String)rMap.get("muliFPs");
		System.out.println("총 파일 수: " + rMap.get("fileCnt"));
		System.out.println("총 볼륨(MB): " + rMap.get("totalMB") + "MB");
		
		ReviewVO rvT = new ReviewVO(0, "poro", 1, 0, null, rv.getReviewContent(), filePath, null);
		
		int atRtkey = this.rvSvc.insertNewReviewReturnKey(rvT);

		// 상세보기 => atId?
		if (atRtkey > 0) {
			// System.out.println("게시글 등록 성공: " + title);
			System.out.println("리뷰 등록 성공: " + atRtkey);
			result.put("status", "OK");
			return "redirect:/truckDetail.fdl";
			// return "redirect:article_list.my"; // RD
		} else {
			System.out.println("리뷰 등록 실패: " + rv.getReviewContent());
			result.put("status", "False");
			return "redirect:/truckDetail.fdl";
		}
		
//		try {
//			rvSvc.insertNewReview(rvT);
//			result.put("status", "OK");
//		} catch (Exception e) {
//			e.printStackTrace();
//			result.put("status", "False");
//		}
		
	}
	
	@RequestMapping(value = "foodTruck_like.fdl", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> foodTruckLike(@RequestParam(value = "tgSr") int tgSr,
			@RequestParam(value = "sesMb") int sesMb, HttpSession ses) {
		ResponseEntity<Map<String, Object>> re = null;
		Map<String, Object> map = new HashMap<>();
		int sesMbId = 1; // (int) ses.getAttribute("mbId");
		if (sesMbId == sesMb) {
			Map<String, Object> lkMap = mltSvc.processMemberLike(tgSr, sesMb);
			int cntLikes = (int) lkMap.get("cntLikes");
			String typeLike = (String) lkMap.get("typeLike");
			if (cntLikes >= 0) {
				map.put("code", 1); // OK
				map.put("type", typeLike);
				map.put("msg", "좋아요 " + (typeLike.equals("add") ? "추가" : "취소") + " 완료");
				map.put("cntLikes", cntLikes);
				re = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			} else {
				map.put("code", 2); // OK. DAO/SVC error
				map.put("type", typeLike);
				map.put("msg", "좋아요 " + (typeLike.equals("add") ? "추가" : "취소") + " DAO/SVC error");
				re = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			}
		} else {
			// 세션 불일치..
			map.put("code", 3); // ERROR 3
			map.put("msg", "세션 불일치..");
			re = new ResponseEntity<Map<String, Object>>(map, HttpStatus.FORBIDDEN);
		}
		return re;
	}
	
}
