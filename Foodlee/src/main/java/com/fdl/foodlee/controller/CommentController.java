package com.fdl.foodlee.controller;

import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.service.inf.ICommentSVC;

@Controller
public class CommentController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ICommentSVC")
	private ICommentSVC replyService;
	
	@RequestMapping(value="/mypage/commentList")
	public ModelAndView openCommentList() {
		
	}
}
