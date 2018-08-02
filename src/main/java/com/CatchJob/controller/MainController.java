package com.CatchJob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.CatchJob.service.SalaryServiceImp;

@Controller
public class MainController {
	@Autowired
	SalaryServiceImp svc;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("메인화면 접속");
		
		svc.getRankList();
		
		
		return "main";
	}
	
	@RequestMapping(value = "/search")
	public String search(String keyword) {
		return "forward:enterprise/search";
	}
	
	
	@RequestMapping(value = "/enterprise-view", method = RequestMethod.GET)
	public String enterpriseView() {
		System.out.println("메인화면 접속");
		
		return "enterprise-view";
	}
	

	
}
