package com.fdl.foodlee.controller;

import java.util.logging.Logger;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.fdl.foodlee.service.inf.IReplySVC;

@Controller
public class ReplyController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="IReplySVC")
	private IReplySVC replyService;
}
