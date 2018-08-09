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
	@RequestMapping(value = "/interviews")
	public String profile() {
		return "forward:profile/interviews";
	}
//	@RequestMapping(value = "/profile")
//	public String profile(Model model, HttpSession session) {
//		Map<String, Object> data = new HashMap<String,Object>();
//		data.put("mberIndex", (int)(session.getAttribute("mberIndex")));
//		data.put("entIndex", 40263);
//		
//		//entService.updateInterview(interview);
//		System.out.println(data+"data-------------");
//		model.addAttribute("originalData", entService.selectListByIndex(data));
//		model.addAttribute("originalDataJson", new Gson().toJson(entService.selectListByIndex(data)));
//		
//		return "profile-interviews";
//	}

	
}
