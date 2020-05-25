package com.fdl.foodlee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fdl.foodlee.model.dao.inf.IMemberDAO;
import com.fdl.foodlee.model.vo.MemberVO;

@Controller
public class MemberShowController {

	private static final Logger logger = LoggerFactory.getLogger(MemberShowController.class);
	
	IMemberDAO mbDao;
	
	public void setMbDao(IMemberDAO mbDao) {
		this.mbDao = mbDao;
	}

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String login = request.getParameter("login");
		
		MemberVO mb = mbDao.selectOneMember(login);
		
		if(mb != null ) {
			
		} else {
			
		}
		return null;
	}
	
}
