package com.CatchJob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.CatchJob.service.EnterpriseServiceImp;
import com.CatchJob.service.SalaryServiceImp;

@Controller
public class MainController {
	@Autowired
	SalaryServiceImp salarySvc;
	@Autowired
	EnterpriseServiceImp entSvc;
	
	@RequestMapping(value = "/")
	public String home(Model model) {
		System.out.println("메인화면 접속");
		model.addAttribute("salaryRankList",salarySvc.getSalayRankList());
		model.addAttribute("empCntRankList",entSvc.getEmpCntList());
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
