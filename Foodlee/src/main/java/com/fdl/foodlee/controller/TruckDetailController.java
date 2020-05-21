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

import com.fdl.foodlee.model.vo.ReviewVO;
import com.fdl.foodlee.service.inf.IReviewFileSVC;
import com.fdl.foodlee.service.inf.IReviewSVC;

@Controller
public class TruckDetailController {
	@Autowired
	IReviewSVC rvSvc;
	@Autowired
	private IReviewFileSVC rvFileSvc;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "truckDetail.fdl", method = RequestMethod.GET)
	public String truckDetail(Model model) {
		List<ReviewVO> rvList = rvSvc.showAllReview();
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
	public String reviewDelete(@RequestParam("id")int id) {
		rvSvc.deleteReview(id);
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
	
	@RequestMapping(value = "review_list.fdl", method = RequestMethod.GET)
	public List<ReviewVO> reviewList(Model model) {
		return rvSvc.showAllReview();
	}

	@RequestMapping(value = "new_review.fdl", method = RequestMethod.POST)
	public String newReview(@ModelAttribute(value="rv") ReviewVO rv, List<MultipartFile> imgfiles, HttpSession ses, Model model) {
		System.out.println(rv.getReviewContent());
		System.out.println(imgfiles);
		Map<String, Object> result = new HashMap<>();
		
		String realPath = ses.getServletContext().getRealPath(IReviewFileSVC.DEF_UPLOAD_DEST) + "/";
		rvFileSvc.makeUserDir(ses, "poro");
		Map<String, Object> rMap = rvFileSvc.writeUploadedMultipleFiles(imgfiles, realPath, "poro"
				/*(String) ses.getAttribute("mbLoginName")*/);
		
		String filePath = (String)rMap.get("muliFPs");
		System.out.println("총 파일 수: " + rMap.get("fileCnt"));
		System.out.println("총 볼륨(MB): " + rMap.get("totalMB") + "MB");
		
		ReviewVO rvT = new ReviewVO(0, "poro", 0, 0, rv.getReviewContent(), filePath, null);
		
		int atRtkey = this.rvSvc.insertNewArticleReturnKey(rvT);

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
	
}
