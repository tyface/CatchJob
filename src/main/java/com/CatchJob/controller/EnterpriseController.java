package com.CatchJob.controller;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.CatchJob.model.Interview;
import com.CatchJob.service.EnterpriseService;
import com.CatchJob.service.RecordService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/enterprise")
public class EnterpriseController {

	@Autowired
	private EnterpriseService entService;
	@Autowired
	private RecordService recordService;

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
		model.addAttribute("countList", entService.getEntList(data));
		// 기업 리스트 출력
		return "enterprise-list";
	}

	 @RequestMapping(value = "/view")
	 public String entDetailsForm(int entIndex,HttpServletRequest req, Model model) throws UnknownHostException {
		
		// 기업정보 표출될때마다 viewCount올리는 부분
		Map<String, String> mapData = new HashMap<String, String>();
		mapData.put("ENT_IDX", Integer.toString(entIndex));
		mapData.put("CONN_IP", Inet4Address.getLocalHost().getHostAddress());
		mapData.put("BROWSER", req.getHeader("User-Agent"));
		recordService.regViewRecord(mapData);
		// End
		
		model.addAttribute("viewDataJson",new Gson().toJson(entService.empCountGraph(entIndex)));
		model.addAttribute("entInfo",entService.getEntInfo(entIndex));
		model.addAttribute("personJson",new Gson().toJson(entService.selectEntPeopleInfo(entIndex)));

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
