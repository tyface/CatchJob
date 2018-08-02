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
	
	
	@RequestMapping(value = "/companies", method = RequestMethod.GET)
	public String companies() {
		System.out.println("메인화면 접속");
		
		return "companies";
	}
	
	@RequestMapping(value = "/ex", method = RequestMethod.GET)
	public String ex() {
		
		return "ex";
	}

	@RequestMapping(value = "/modals", method = RequestMethod.GET)
	public String modals() {
		
		return "source/modals";
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input() {
		
		return "source/input";
	}
	
	@RequestMapping(value = "/button", method = RequestMethod.GET)
	public String button() {
		
		return "source/button";
	}
	
	@RequestMapping(value = "/follow", method = RequestMethod.GET)
	public String follow() {
		
		return "source/follow";
	}
	
	@RequestMapping(value = "/star", method = RequestMethod.GET)
	public String star() {
		
		return "source/star";
	}
	
	@RequestMapping(value = "/enterprise", method = RequestMethod.GET)
	public String enterprise() {
		
		return "enterprise";
	}
	
	@RequestMapping(value = "/a", method = RequestMethod.GET)
	public String interview() {
		
		return "a";
	}
	
	
}
