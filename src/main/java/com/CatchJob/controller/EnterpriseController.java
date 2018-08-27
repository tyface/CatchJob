package com.CatchJob.controller;

import java.io.IOException;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	SaraminService saraminService;
	@Autowired
	NaverNewsService naverNewsService;
	
	@RequestMapping("/saramin")
	public String saramin(@RequestParam(required = false , defaultValue="") String keyword, Model model) {
		System.out.println("컨트롤러 newsSearch");
		try {
			List<Saramin> saraminList = saraminService.searchSaramin(keyword);
			System.out.println("컨트롤러 사람인: "+saraminList);
			model.addAttribute("saraminList",new Gson().toJson(saraminList));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "saramin"; 
	}
	@RequestMapping("/news")
	public String news(@RequestParam(required = false , defaultValue="") String keyword, Model model) {
		
		return "news"; 
	}

	@RequestMapping(value = "/EnterpriseService", method = RequestMethod.GET)
	public String entListForm() {
		// 기업 리스트 출력화면
		return null;
	}

	@RequestMapping(value = "/search")
	public String getEntList(String keyword, Model model, HttpSession session) {
		System.out.println("진입!!!!=================");
		Map<String, String> data = new HashMap<String, String>();
		data.put("keyword", keyword);		
		try {
			data.put("MBER_IDX",  Integer.toString(((Member)session.getAttribute("member")).getMberIndex()));			
		}catch(NullPointerException e) {
		}		
		
		Gson gson = new GsonBuilder().create();
		JsonArray jsonEntList = gson.toJsonTree(entService.getEntList(data)).getAsJsonArray();
		model.addAttribute("entList", jsonEntList);
		System.out.println(jsonEntList);
		// 기업 리스트 출력
		return "enterprise-list";
	}
  
	@RequestMapping(value = "/view")
	public String entDetailsForm(int entIndex,@RequestParam(defaultValue = "1")int page, HttpServletRequest req, Model model, HttpSession session)  {
		// 기업정보 표출될때마다 viewCount올리는 부분
		Map<String, String> mapData = new HashMap<String, String>();
		mapData.put("ENT_IDX", Integer.toString(entIndex));
		mapData.put("BROWSER", req.getHeader("User-Agent"));
		try {
			mapData.put("CONN_IP", Inet4Address.getLocalHost().getHostAddress());
			mapData.put("MBER_IDX",  Integer.toString(((Member)session.getAttribute("member")).getMberIndex()));//0816인영추가					
		} catch (UnknownHostException e) {
			System.out.println("errer");
		} catch (NullPointerException e) {//비로그인 상태( session 없을 때 )에서 view 진입
			System.out.println("단지.. 로그인 안 되어 있을 뿐");
		}
		recordService.regViewRecord(mapData);
		//기업정보
		//System.out.println("기업이름ㅃ??"+ entService.getEntInfo(mapData).get("ENT_NM"));
		model.addAttribute("viewDataJson", new Gson().toJson(entService.empCountGraph(entIndex)));
		model.addAttribute("entInfo", entService.getEntInfo(mapData));
		model.addAttribute("personJson", new Gson().toJson(entService.selectEntPeopleInfo(entIndex)));
		model.addAttribute("interviewPieChartJson", new Gson().toJson(itvwService.interviewPieChart(mapData)));
		model.addAttribute("question", reviewService.question(mapData));
		// 페이징 처리 - 인터뷰
		int currentPage= page;
		Map<String, Integer> dataItvw = new HashMap<String, Integer>();
		dataItvw.put("ENT_IDX", entIndex);
		dataItvw.put("PAGE_NUM", currentPage);
		model.addAttribute("interview", itvwService.getInterviewList(dataItvw));
		//System.out.println("면점 :  "+itvwService.getInterviewList(dataItvw));
		model.addAttribute("interviewJson", new Gson().toJson(itvwService.getInterviewList(dataItvw)));
		model.addAttribute("interviewPageData", itvwService.interviewPageData(currentPage, entIndex));
		//뉴스
		try {
			List<News> newsList = naverNewsService.searchNews( entService.getEntInfo(mapData).get("ENT_NM") );	
			model.addAttribute("newsList", newsList);
			List<Saramin> saraminList = saraminService.searchSaramin( entService.getEntInfo(mapData).get("ENT_NM") );
			System.out.println("컨트롤러 사람인!!!!!!123123: "+saraminList);
			model.addAttribute("saraminList",new Gson().toJson(saraminList));
		} catch (Exception e) {
			e.printStackTrace();
		}	
		//리뷰코멘트 총 만족도
		System.out.println("항목별 만족도 : "+reviewService.valuesByItem(mapData));
		model.addAttribute("reviewTotalData", reviewService.gettotalSatisfaction(mapData));
		model.addAttribute("reviewValuesByItem",new Gson().toJson( reviewService.valuesByItem(mapData)));
		
		return "enterprise-view";
	}
	
	@ResponseBody
	@RequestMapping(value = "/regFollow")
	public boolean regFollow (String entIndex, HttpSession session) {
		Map<String, String> mapData = new HashMap<String, String>();
		mapData.put("MBER_IDX",  Integer.toString(((Member)session.getAttribute("member")).getMberIndex()));		
		mapData.put("ENT_IDX", entIndex );	
		return followService.regFollowEnt(mapData);
	}
	@ResponseBody
	@RequestMapping(value = "/revFollow")
	public boolean revFollow (String entIndex, HttpSession session) {
		Map<String, String> mapData = new HashMap<String, String>();
		mapData.put("MBER_IDX",  Integer.toString(((Member)session.getAttribute("member")).getMberIndex()));
		mapData.put("ENT_IDX", entIndex );
		return followService.revFollowEnt(mapData);
	}
	
	
//	@ResponseBody
//	@RequestMapping(value = "/reviewList/{entIndex}")
//	public ResponseEntity<List<Review>> list(
//			@PathVariable("entIndex") int entIndex){		
//		ResponseEntity<List<Review>> entity = null;		
//		try {
//			List<Review> replyList = reviewService.reviewList(entIndex);
//			entity = new ResponseEntity<List<Review>>(replyList,HttpStatus.OK);
//		}catch(Exception e) {
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
//	@ResponseBody
	@RequestMapping(value = "/reviewList")
	public void list( int entIndex, @RequestParam(defaultValue = "1")int questionNum, @RequestParam(defaultValue = "1")int pageNum, Model model, HttpServletResponse resp){
		//req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		System.out.println("컨트롤러 리뷰 entIndex: "+entIndex);
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
		System.out.println(reviewPageData);
		//model.addAttribute("reviewList", new Gson().toJson(reviewList) );
//		Gson gson = new GsonBuilder().create();
//		JsonArray myCustomArray = gson.toJsonTree(entService.getEntList(data)).getAsJsonArray();
		try {
//			resp.getWriter().println(new Gson().toJson(reviewList));
//			resp.getWriter().println(new Gson().toJson(reviewPageData));
			resp.getWriter().println(new Gson().toJson(mapData));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
//		System.out.println("리뷰: "+reviewList);
//		System.out.println("페이지 데이터: "+reviewPageData);
//		model.addAttribute("reviewPageData", reviewPageData);
		
		
		 
	}
	
	@RequestMapping(value = "/getInterviewList")
	public void getInterList(int entIndex, @RequestParam(defaultValue = "1")int pageNum, Model model, HttpServletResponse resp){
		resp.setCharacterEncoding("utf-8");
		Map<String, Integer> dataMap = new HashMap<String, Integer>();
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Gson gson = new GsonBuilder().create();
		
		int currentPage= pageNum;		
		
		dataMap.put("ENT_IDX", entIndex);
		dataMap.put("PAGE_NUM", currentPage);
		
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
	public boolean writeReview(Review review, HttpSession session) throws IOException {
		System.out.println(review);
		review.setMberIndex(((Member)session.getAttribute("member")).getMberIndex());
		//review.setQuestionNum(Integer.parseInt(req.getParameter("questionNum")));
//		review.setReviewFlag("1");
		//req.getParameter("contents");
		//req.getParameter("evaluationScore");

		//System.out.println("writeReview-컨트롤러2"+review);
		boolean result = reviewService.insertReview(review);
		
		if(result) {
			//System.out.println("컨트롤러: 리뷰 등록 성공"+result);
			return true;
		}else {
			//System.out.println("컨트롤러: 리뷰 등록 실패"+result);
			return false;			
		}				
	}
	
	@ResponseBody
	@RequestMapping(value = "/itvwDuplicationCheck")
	public boolean interviewDuplicationCheck(HttpSession session, String entIndex) {
		Map<String, String> data = new HashMap<String, String>();
		data.put("MBER_IDX",  Integer.toString(((Member)session.getAttribute("member")).getMberIndex()));
		data.put("ENT_IDX", entIndex );
		return itvwService.interviewDuplicationCheck(data);
	}
	
	//@ResponseBody
	@RequestMapping(value = "/writeInterview")
	public String writeInterview(Interview interview, HttpSession session) {
		//System.out.println("123456"+interview);
		interview.setMberIndex(((Member)session.getAttribute("member")).getMberIndex());
//		interview.setIntrvwFlag("1");
//		// boolean result = entService.insertInterview(interview);
		itvwService.insertInterview(interview);
//		if(result) {
//			System.out.println("컨트롤러: 리뷰 등록 성공"+result);
//			return true;
//		}else {
//			System.out.println("컨트롤러: 리뷰 등록 실패"+result);
//			return false;			
//		}	
		return "redirect:view?entIndex="+interview.getEntIndex();
	}
	


}
