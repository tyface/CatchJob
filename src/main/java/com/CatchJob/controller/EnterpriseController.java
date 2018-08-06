package com.CatchJob.controller;

import java.util.HashMap;

import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.CatchJob.model.Interview;
import com.CatchJob.service.EnterpriseService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/enterprise")
public class EnterpriseController {

	@Autowired
	private EnterpriseService entService;

	@RequestMapping(value = "/EnterpriseService", method = RequestMethod.GET)
	public String entListForm() {
		// 기업 리스트 출력화면
		return null;
	}

	@RequestMapping(value = "/search")
	public String getEntList(String keyword, Model model) {
		Map<String, String> data = new HashMap<String, String>();
		data.put("keyword", keyword);
		model.addAttribute("entList", entService.getEntList(data));

		// 기업 리스트 출력
		return "enterprise-list";
	}

	@RequestMapping(value = "/view")
	public String entDetailsForm(int entIndex, Model model) {		
		// model.addAttribute("viewDataSize", entService.empCountGraph(ent_idx).size());
		// model.addAttribute("viewData", viewData);
		model.addAttribute("viewDataJson", new Gson().toJson(entService.empCountGraph(entIndex)));
		// model.addAttribute("viewData",new Gson().toJson(viewData));
		// System.out.println("==================="+new Gson().toJson(viewData));
		model.addAttribute("entInfo", entService.getEntInfo(entIndex));
		model.addAttribute("personJson", new Gson().toJson(entService.selectEntPeopleInfo(entIndex)));

		return "enterprise-view";
	}

	@RequestMapping(value = "/writeInterview")
	public void writeInterview(Interview interview, HttpSession session) {
		System.out.println("진입성공-------------------------123");
		interview.setMberIndex((int) (session.getAttribute("mberIndex")));
		interview.setIntrvwFlag("1");
		System.out.println(interview);
//		boolean result = entService.insertInterview(interview);
		entService.insertInterview(interview);
		
		
	
	}
	
	@RequestMapping(value = "/updateInterview")
	public void updateInterview(Interview interview, HttpSession session) {
		System.out.println("진입성공-------------------------");
		interview.setMberIndex((int) (session.getAttribute("mberIndex")));
		interview.setIntrvwFlag("1");
		System.out.println(interview);
//		boolean result = entService.insertInterview(interview);
		Map<String, Object> data = new HashMap<String,Object>();
		data.put("mberIndex", (int)(session.getAttribute("mberIndex")));
		data.put("entIndex", interview.getEntIndex());
		entService.updateInterview(interview);
		

	}
	


}
