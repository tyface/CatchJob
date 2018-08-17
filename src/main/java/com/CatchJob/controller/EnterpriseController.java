package com.CatchJob.controller;

import java.io.IOException;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CatchJob.model.Interview;
import com.CatchJob.model.Review;
import com.CatchJob.service.EnterpriseService;
import com.CatchJob.service.InterviewService;
import com.CatchJob.service.RecordService;
import com.CatchJob.service.ReviewService;
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
	@Autowired
	private InterviewService itvwService;
	@Autowired
	private ReviewService reviewService;

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
		model.addAttribute("entList1",myCustomArray);
		// 기업 리스트 출력
		return "enterprise-list";
	}
  
	@RequestMapping(value = "/view")
	public String entDetailsForm(int entIndex, HttpServletRequest req, Model model)  {
		// 기업정보 표출될때마다 viewCount올리는 부분
		Map<String, String> mapData = new HashMap<String, String>();
		mapData.put("ENT_IDX", Integer.toString(entIndex));
		try {
			mapData.put("CONN_IP", Inet4Address.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			System.out.println("errer");
		}
		mapData.put("BROWSER", req.getHeader("User-Agent"));
		recordService.regViewRecord(mapData);
		// End

		// 리뷰 표출될 때 필요한 정보 : 기업식별번호, 질문번호(1~5)
		Map<String, String> reviewMap = new HashMap<String, String>();
		reviewMap.put("entIndex", Integer.toString(entIndex));
		reviewMap.put("questionNum", "1");
		//System.out.println(reviewMap);
		model.addAttribute("viewDataJson", new Gson().toJson(entService.empCountGraph(entIndex)));
		model.addAttribute("entInfo", entService.getEntInfo(entIndex));
		model.addAttribute("personJson", new Gson().toJson(entService.selectEntPeopleInfo(entIndex)));
		model.addAttribute("interview", itvwService.selectListByEntIdx(entIndex));
		model.addAttribute("interviewJson", new Gson().toJson(itvwService.selectListByEntIdx(entIndex)));
		model.addAttribute("interviewPieChartJson", new Gson().toJson(itvwService.interviewPieChart(entIndex)));
		//model.addAttribute("reviewList", reviewService.reviewList(entIndex));
		//model.addAttribute("reviewListJson", new Gson().toJson(reviewService.reviewList(entIndex)));
		//model.addAttribute("review", reviewService.reviewListByQNum(reviewMap));
		model.addAttribute("question", reviewService.question(entIndex));
		//System.out.println(reviewService.question(entIndex));
		return "enterprise-view";
	}

	
	@ResponseBody
	@RequestMapping(value = "/reviewList/{entIndex}")
	public ResponseEntity<List<Review>> list(
			@PathVariable("entIndex") int entIndex){		
		ResponseEntity<List<Review>> entity = null;		
		try {
			List<Review> replyList = reviewService.reviewList(entIndex);
			entity = new ResponseEntity<List<Review>>(replyList,HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/writeReview")
	public boolean test(HttpSession session, Review review) throws IOException {
		
		//Review review = new Review();
		//review.setContents(req.getParameter("contents"));
		//review.setEntIndex(Integer.parseInt((req.getParameter("entIndex"))));
		//review.setEvaluationScore(Integer.parseInt(req.getParameter("evaluationScore")));
		review.setMberIndex((int) (session.getAttribute("mberIndex")));
		//review.setQuestionNum(Integer.parseInt(req.getParameter("questionNum")));
		review.setReviewFlag("1");
		//System.out.println("진입성공~!789");
		//req.getParameter("contents");
		//req.getParameter("evaluationScore");
		//System.out.println(req.getParameter("questionNum"));
		//System.out.println(req.getParameter("evaluationScore"));

		//System.out.println("review: "+review);
		System.out.println("review:"+review);
		boolean result = reviewService.insertReview(review);
		
		if(result) {
			return true;
		}else {
			return false;			
		}				
	}
	
	@RequestMapping(value = "/writeInterview")
	public String writeInterview(Interview interview, HttpSession session) {
		interview.setMberIndex((int) (session.getAttribute("mberIndex")));
		interview.setIntrvwFlag("1");
		// boolean result = entService.insertInterview(interview);
		itvwService.insertInterview(interview);
		
		return "redirect:view?entIndex="+interview.getEntIndex();
	}


}
