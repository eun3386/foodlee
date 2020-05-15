package com.fdl.foodlee.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.vo.ReviewVO;
import com.fdl.foodlee.service.inf.IReviewSVC;

@Controller
public class TruckDetailController {
	@Autowired
	IReviewSVC rvSvc;

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
	
	@RequestMapping(value = "review_list.fdl", method = RequestMethod.GET)
	public List<ReviewVO> reviewList(Model model) {
		System.out.println(rvSvc.showAllReview());
		return rvSvc.showAllReview();
	}

	@RequestMapping(value = "new_review.fdl", method = RequestMethod.POST)
	public Map<String, Object> newReview(@RequestBody ReviewVO reviewVO) {
		System.out.println(reviewVO.getReviewContent());
		Map<String, Object> result = new HashMap<>();
		ReviewVO rv = new ReviewVO(0, "anna", 1, 0, reviewVO.getReviewContent(), null);
		try {
			rvSvc.insertNewReview(rv);
			result.put("status", "OK");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		return result;
	}
}
