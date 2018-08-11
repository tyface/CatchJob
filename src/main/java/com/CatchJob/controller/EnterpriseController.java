package com.CatchJob.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;

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
		
		                            
		Gson gson = new GsonBuilder().create();
		JsonArray myCustomArray = gson.toJsonTree(entService.getEntList(data)).getAsJsonArray();
//			System.out.println(gson.toJson(entService.getEntList(data), type));
//		JSONArray js = JSONArray.formObject(entService.getEntList(data));
//		model.addAttribute("entList1",gson.toJson(entService.getEntList(data)));
		System.out.println(myCustomArray);
		model.addAttribute("entList1",myCustomArray);
		model.addAttribute("entList", entService.getEntList(data));
//		model.addAttribute("countList", entService.getEntList(data));
//		model.addAttribute("entList1", entService.getEntList(data));
		// 기업 리스트 출력
		return "enterprise-list";
	}

	@RequestMapping(value = "/view")
	public String entDetailsForm(int entIndex, HttpServletRequest req, Model model) throws UnknownHostException {

		// 기업정보 표출될때마다 viewCount올리는 부분
		Map<String, String> mapData = new HashMap<String, String>();
		mapData.put("ENT_IDX", Integer.toString(entIndex));
		mapData.put("CONN_IP", Inet4Address.getLocalHost().getHostAddress());
		mapData.put("BROWSER", req.getHeader("User-Agent"));
		recordService.regViewRecord(mapData);
		// End

		// 리뷰 표출될 때 필요한 정보 : 기업식별번호, 질문번호(1~5)
		Map<String, String> reviewMap = new HashMap<String, String>();
		reviewMap.put("entIndex", Integer.toString(entIndex));
		reviewMap.put("questionNum", "1");
		System.out.println(reviewMap);
		model.addAttribute("viewDataJson", new Gson().toJson(entService.empCountGraph(entIndex)));
		model.addAttribute("entInfo", entService.getEntInfo(entIndex));
		model.addAttribute("personJson", new Gson().toJson(entService.selectEntPeopleInfo(entIndex)));
		model.addAttribute("interview", entService.selectListByEntIdx(entIndex));
		model.addAttribute("interviewJson", new Gson().toJson(entService.selectListByEntIdx(entIndex)));
		model.addAttribute("interviewPieChartJson", new Gson().toJson(entService.interviewPieChart(entIndex)));
		model.addAttribute("reviewList", entService.reviewList(reviewMap));

		 //System.out.println("123==="+entService.reviewList(reviewMap));
		return "enterprise-view";
	}

	@RequestMapping(value = "/writeInterview")
	public void writeInterview(Interview interview, HttpSession session) {
		System.out.println("진입성공-------------------------123");
		interview.setMberIndex((int) (session.getAttribute("mberIndex")));
		interview.setIntrvwFlag("1");
		System.out.println(interview);
		// boolean result = entService.insertInterview(interview);
		entService.insertInterview(interview);
	}

	@RequestMapping(value = "/updateInterview")
	public void updateInterview(Interview interview, HttpSession session) {
		System.out.println("진입성공-------------------------");
		interview.setMberIndex((int) (session.getAttribute("mberIndex")));
		interview.setIntrvwFlag("1");
		System.out.println(interview);
		// boolean result = entService.insertInterview(interview);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("mberIndex", (int) (session.getAttribute("mberIndex")));
		data.put("entIndex", interview.getEntIndex());
		entService.updateInterview(interview);
	}

	@RequestMapping(value = "/test")
	public void updateInterview1(HttpServletRequest req,HttpServletResponse resp, Model model) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		System.out.println("진입성공-------------------------");
		String value = req.getParameter("d");
		String entIndex = req.getParameter("entIndex");

		Map<String, String> reviewMap = new HashMap<String, String>();
		reviewMap.put("entIndex", entIndex);
		reviewMap.put("questionNum", value);
		
		//List<Review> result = entService.reviewList(reviewMap);
		try {
			resp.getWriter().println(new Gson().toJson(entService.reviewList(reviewMap)));
		} catch (IOException e) {
			System.out.println("IOException ---------------------");
		}
		
		//model.addAttribute("review", entService.reviewList(reviewMap));
		

	}

}
