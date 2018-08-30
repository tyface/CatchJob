package com.CatchJob.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.CatchJob.model.Interview;
import com.CatchJob.model.Member;
import com.CatchJob.model.Review;
import com.CatchJob.service.EnterpriseService;
import com.CatchJob.service.FollowService;
import com.CatchJob.service.InterviewService;
import com.CatchJob.service.ReviewService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	private EnterpriseService entService;
	@Autowired
	private InterviewService itvwService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private FollowService followService;

	@RequestMapping(value = "/reviews")
	public String reviewsView(Model model, Authentication authentication) {		
		//System.out.println("세션:------------------------"+(   (Member)session.getAttribute("member")).getMberIndex()   );
		//회원번호로 조회해서 리뷰 데이터 가져오기 
		//System.out.println("진ㅇ입성공입니다 리뷰유리븁리"+session.getAttribute("mberIndex"));
		Map<String, String> data = new HashMap<String,String>();
		data.put("MBER_IDX", Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));
		model.addAttribute("reviewList", reviewService.reviewListByMember(data));
		//System.out.println(reviewService.reviewListByMember(((Member)session.getAttribute("member")).getMberIndex()));
		return "profile-reviews";
	}
	@ResponseBody
	@RequestMapping(value = "/reviewForm")
	public Review reviewsView( Model model,Authentication authentication, String entIndex, String questionNum,HttpServletResponse resp) {
		Map<String, String> data = new HashMap<String,String>();
		
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
		data.put("mberIndex", Integer.toString(memberIndex));
		data.put("entIndex", entIndex);
		data.put("questionNum", questionNum);

		System.out.println("컨트롤러 리뷰 폼 요청 - 받음 "+data);
		Review review = reviewService.review(data);
		System.out.println("review: "+review);
		return review;		
	}
	
	@RequestMapping(value = "/updateReview")
	public String updateReview(Review review,Authentication authentication) {
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
		review.setMberIndex(memberIndex);
		reviewService.updateReview(review);
//		System.out.println(review);		
		return "redirect:reviews";
	}     
	@ResponseBody
	@RequestMapping(value="/deleteReview")
	public boolean deleteReview (HttpServletRequest req,Authentication authentication) {		
		Map<String, String> data = new HashMap<String, String>();
		data.put("mberIndex", Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));
		data.put("entIndex", req.getParameter("entIndex"));
		data.put("questionNum", req.getParameter("questionNum"));
		System.out.println("리뷰 지울 데이터: "+data);
		boolean result = reviewService.deleteReview(data);

		
		return result;
	}
	
	
	/* 회원정보를 통해 작성한 인터뷰정보 가져오기....... */
	@RequestMapping(value = "/interviews")
	public String interviewView(Model model,Authentication authentication) {
		Map<String, String> data = new HashMap<String,String>();
		data.put("MBER_IDX", Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));
		model.addAttribute("viewData", itvwService.selectListByMemberIdx(data));
		return "profile-interviews";
	
	}
	 /*회원정보와, 기업정보 이용해서 해당 면접리뷰 수정 모달 열기 */
	
	@RequestMapping(value = "/interviewForm")
	public void form(Model model,Authentication authentication, HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("utf-8");
		//System.out.println("진입성공-------------------------");
		Map<String, String> data = new HashMap<String,String>();
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
		data.put("MBER_IDX", Integer.toString(memberIndex));
		data.put("ENT_IDX", req.getParameter("entIndex"));
	
	//	model.addAttribute("originalDataJson", new Gson().toJson(entService.selectListByIndex(data)));
		System.out.println("컨트롤러 데이터: "+data+"         "+itvwService.selectListByIndex(data));	
		
		try {
			resp.getWriter().println(new Gson().toJson(itvwService.selectListByIndex(data)));
		} catch (IOException e) {
			System.out.println("IOException ---------------------");
		}
	}
	
	@RequestMapping(value = "/updateInterview")
	public String updateInterview(Interview interview,Authentication authentication) {
		//interview.setMberIndex(((Member)session.getAttribute("member")).getMberIndex());
		//interview.setIntrvwFlag("1");
		//System.out.println("들어는왔니---");
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
		interview.setMberIndex(memberIndex);
		//System.out.println(interview);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("mberIndex", memberIndex);
		data.put("entIndex", interview.getEntIndex());
		//System.out.println("profileControllre의 updateInterview: "+data);
		itvwService.updateInterview(interview);
		
		return "redirect:interviews";
	}  
	@ResponseBody	
	@RequestMapping(value="/deleteInterview")
	public boolean deleteInterview (HttpServletRequest req, Authentication authentication, String entIndex) {
		
		Map<String, String> data = new HashMap<String, String>();
		data.put("mberIndex",  Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));
//		data.put("entIndex", req.getParameter("entIndex"));
		data.put("entIndex", entIndex);
		
		boolean result = itvwService.deleteInterview(data); 
			System.out.println("프로파일 컨트롤러: "+ result);
		return result;
	}
	

	@RequestMapping(value = "/follows")
	public String followView (Model model, Authentication authentication) {
//		System.out.println("gg");
//		System.out.println("컨트롤러: 팔로우 :"+entService.getFollowsEntList(((Member)session.getAttribute("member")).getMberIndex()));
		model.addAttribute("followView", entService.getFollowsEntList(((Member)authentication.getPrincipal()).getMberIndex()));
		
		
		return "profile-follows";
	}
	
	@RequestMapping(value = "/recent")
	public String recentView (Model model, Authentication authentication) {
		int MBER_IDX = ((Member)authentication.getPrincipal()).getMberIndex();
		System.out.println("프로파일 컨트롤러...."+(MBER_IDX));
		
		Map<String, Integer> mapData = new HashMap<String, Integer>();
		mapData.put("MBER_IDX", MBER_IDX);
		model.addAttribute("recentView", entService.getRecentEntList(mapData));
		model.addAttribute("recentViewJson", new Gson().toJson(entService.getRecentEntList(mapData)));
		return "profile-recent";
	}
	
}
