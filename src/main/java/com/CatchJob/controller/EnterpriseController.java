package com.CatchJob.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CatchJob.model.Interview;
import com.CatchJob.model.Member;
import com.CatchJob.model.News;
import com.CatchJob.model.Review;
import com.CatchJob.model.Saramin;
import com.CatchJob.service.EnterpriseService;
import com.CatchJob.service.FollowService;
import com.CatchJob.service.InterviewService;
import com.CatchJob.service.NaverNewsService;
import com.CatchJob.service.RecordService;
import com.CatchJob.service.ReviewService;
import com.CatchJob.service.SaraminService;
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
	@Autowired
	private FollowService followService;
	@Autowired
	private SaraminService saraminService;
	@Autowired
	private NaverNewsService naverNewsService;

	@RequestMapping(value = "/EnterpriseService", method = RequestMethod.GET)
	public String entListForm() {
		// 기업 리스트 출력화면
		return null;
	}

	@RequestMapping(value = "/search")
	public String getEntList(String keyword, Model model, Authentication authentication) {
		Map<String, String> data = new HashMap<String, String>();
		data.put("keyword", keyword);		
		
		if(authentication != null) {
			data.put("MBER_IDX", Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));		
		}else {
			data.put("MBER_IDX", null);	
		}
			
		Gson gson = new GsonBuilder().create();
		JsonArray jsonEntList = gson.toJsonTree(entService.getEntList(data)).getAsJsonArray();
		model.addAttribute("entList", jsonEntList);
		model.addAttribute("keyword2", keyword);
		// 기업 리스트 출력
		return "enterprise-list";
	}
  
	@RequestMapping(value = "/view")
	public String entDetailsForm(int entIndex,HttpServletRequest req, Model model, Authentication authentication)  {
		// 기업정보 표출될때마다 viewCount올리는 부분
		Map<String, String> mapData = new HashMap<String, String>();
		try {
			req.setCharacterEncoding("UTF-8");
			mapData.put("ENT_IDX", Integer.toString(entIndex));
			mapData.put("BROWSER", req.getHeader("User-Agent"));
			
			mapData.put("CONN_IP", Inet4Address.getLocalHost().getHostAddress());
			if(authentication != null) {
				mapData.put("MBER_IDX", Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));
			}
			recordService.regViewRecord(mapData);
			//기업정보
			model.addAttribute("empCount", new Gson().toJson(entService.empCountGraph(entIndex)));
			model.addAttribute("entInfo", entService.getEntInfo(mapData));
			model.addAttribute("industryAvgInfo", new Gson().toJson(entService.getIndustryAvgInfo(entIndex)));
			model.addAttribute("interviewDiffChart",  new Gson().toJson(itvwService.getDiffChart(mapData)) );
			model.addAttribute("interviewExperienceChart", new Gson().toJson(itvwService.getExperienceChart(mapData)));
			model.addAttribute("interviewResultChart", new Gson().toJson(itvwService.getResultChart(mapData)));
			model.addAttribute("questionList", reviewService.question(mapData));
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (NullPointerException e) {//비로그인 상태( session 없을 때 )에서 view 진입
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		//뉴스
		try {
			List<News> newsList = naverNewsService.searchNews( entService.getEntInfo(mapData).get("ENT_NM") );	
			model.addAttribute("newsList",newsList);
			System.out.println(newsList);
			List<Saramin> saraminList = saraminService.searchSaramin( entService.getEntInfo(mapData).get("ENT_NM") );
			model.addAttribute("saraminList",new Gson().toJson(saraminList));
		} catch (Exception e) {
			e.printStackTrace();
		}	
		//리뷰코멘트 총 만족도
		model.addAttribute("reviewTotalData", reviewService.getTotalSatisfaction(mapData));
		List<Map<String, String>> reviewValuesByItem =  reviewService.valuesByItem(mapData);
		model.addAttribute("reviewValuesByItem",new Gson().toJson( reviewValuesByItem));
		model.addAttribute("numOfValuesByItem",reviewService.numOfValuesByItem(reviewValuesByItem));
		return "enterprise-view";
	}
	
	@ResponseBody
	@RequestMapping(value = "/regFollow")
	public boolean regFollow (String entIndex, Authentication authentication) {
		Map<String, String> mapData = new HashMap<String, String>();
		mapData.put("MBER_IDX", Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));	
		mapData.put("ENT_IDX", entIndex );	
		return followService.regFollowEnt(mapData);
	}
	
	@ResponseBody
	@RequestMapping(value = "/revFollow")
	public boolean revFollow (String entIndex, Authentication authentication) {
		Map<String, String> mapData = new HashMap<String, String>();
		mapData.put("MBER_IDX", Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));
		mapData.put("ENT_IDX", entIndex );
		return followService.revFollowEnt(mapData);
	}
	
	@RequestMapping(value = "/reviewList")
	public void list( int entIndex, @RequestParam(defaultValue = "1")int questionNum, @RequestParam(defaultValue = "1")int pageNum, Model model, HttpServletResponse resp){
		resp.setCharacterEncoding("utf-8");
		Map<String, Integer> dataRvw = new HashMap<String, Integer>();
		int currentPage= pageNum;		
		dataRvw.put("PAGE_NUM", currentPage);
		dataRvw.put("ENT_IDX", entIndex);		
		dataRvw.put("QESTN_NO", questionNum);
		
		Map<String, Object> mapData = new HashMap<String, Object>();
		List<Review> reviewList = reviewService.getReviewsList(dataRvw);
		Map<String, Integer> reviewPageData = reviewService.reviewPageData(currentPage, entIndex, questionNum);
		
		mapData.put("reviewList", reviewList);
		mapData.put("reviewPageData", reviewPageData);
		try {
			resp.getWriter().println(new Gson().toJson(mapData));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/getInterviewList", method = RequestMethod.POST)
	public void getInterviewList(int entIndex, @RequestParam(defaultValue = "1")int pageNum, Model model, HttpServletResponse resp){
		resp.setCharacterEncoding("utf-8");
		Map<String, Integer> dataMap = new HashMap<String, Integer>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Gson gson = new GsonBuilder().create();
		
		int currentPage = (pageNum < 1)?1:pageNum;
		dataMap.put("ENT_IDX", entIndex);
		dataMap.put("PAGE_NUM", currentPage);
		dataMap.put("INTRVW_FL", 1);
		
		List<Interview> interviewList = itvwService.getInterviewList(dataMap);
		
		resultMap.put("interviewList", gson.toJsonTree(interviewList).getAsJsonArray());
		resultMap.put("interviewPageData", itvwService.interviewPageData(currentPage, entIndex));
		
		try {
			resp.getWriter().println(new Gson().toJson(resultMap));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/writeReview", method = RequestMethod.POST)
	public boolean writeReview(Review review, Authentication authentication) throws IOException {
		review.setMberIndex(((Member)authentication.getPrincipal()).getMberIndex());
		boolean result = reviewService.insertReview(review);
		if(result) {
			return true;
		}else {
			return false;			
		}				
	}
	
	@ResponseBody
	@RequestMapping(value = "/itvwDuplicationCheck")
	public boolean interviewDuplicationCheck(Authentication authentication, String entIndex) {
		Map<String, String> data = new HashMap<String, String>();
		data.put("MBER_IDX", Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));
		data.put("ENT_IDX", entIndex );
		return itvwService.interviewDuplicationCheck(data);
	}
	
	@RequestMapping(value = "/writeInterview")
	public String writeInterview(Interview interview,Authentication authentication) {
		interview.setMberIndex(((Member)authentication.getPrincipal()).getMberIndex());
		System.out.println("----------------------------------1111"+interview);
		itvwService.insertInterview(interview);
		return "redirect:view?entIndex="+interview.getEntIndex()+"#section3";
	}
	


}
