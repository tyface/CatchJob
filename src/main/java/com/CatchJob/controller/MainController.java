package com.CatchJob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.CatchJob.service.EnterpriseService;
import com.CatchJob.service.RecordService;
import com.CatchJob.service.SalaryService;

@Controller
public class MainController {
	@Autowired
	SalaryService salaryService;
	@Autowired
	EnterpriseService entService;
	@Autowired
	RecordService recordService;
	
	@RequestMapping(value = "/")
	public String home(Model model) {
		System.out.println("메인화면 접속");
		model.addAttribute("salaryRankList",salaryService.getSalayRankList());
		model.addAttribute("empCntRankList",entService.getEmpCntList());
		model.addAttribute("popularSearcheList",recordService.getPopularSearcheList());
		return "main";
	}
	
	@RequestMapping(value = "/search")
	public String search(String keyword) {
		return "forward:enterprise/search";
	}
	
	@RequestMapping(value = "/admin")
	public String admin() {
		return "admin/admin-main";
	}
	

	
}
