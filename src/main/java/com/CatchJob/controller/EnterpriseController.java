package com.CatchJob.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.CatchJob.service.EnterpriseService;

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
	public String viewEntList(String keyword, Model model) {
		System.out.println("검색 키워드:" + keyword);
		Map<String, String> data = new HashMap<String, String>();
		data.put("keyword", keyword);
		model.addAttribute("entList", entService.searchEntList(data));
		
		// 기업 리스트 출력
		return "main";
	}

	//// @RequestMapping(value = "/EnterpriseService", method = RequestMethod.GET)
	// public String entDetailsForm(int entIndex, Model model) {
	// // 기업 상세페이지 출력화면
	// model.addAttribute("ent", entService.selectEnt(entIndex));
	// return null;
	// }
	//
	//// @RequestMapping(value = "/EnterpriseService", method = RequestMethod.POST)
	// public String empCountGraph(int entIndex, Model model) {
	// // 그래프 - 인원(국민연금 총 가입자수,국민연금 신규가입자수,국민연금 가입해지자수 반환)
	// model.addAttribute("empCountGraph", entService.empCountGraph(entIndex));
	// return null;
	// }
	//
	//// @RequestMapping(value = "/EnterpriseService", method = RequestMethod.POST)
	// public String avgPayGraph(int entIndex, Model model) {
	// // 그래프 - 평균급여(납입날짜, 납입금액 반환)
	// model.addAttribute("avgPayGraph", entService.avgPayGraph(entIndex));
	// return null;
	// }

}