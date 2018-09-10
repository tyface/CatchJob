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
/*	@Autowired
	private MemberService memberService;*/
	
	@RequestMapping(value = "/reviews")
	public String reviewsView(Model model, Authentication authentication) {		
		//회원번호로 조회해서 리뷰 데이터 가져오기 
		Map<String, String> data = new HashMap<String, String>();
		System.out.println(authentication.getPrincipal());
		System.out.println(((Member)authentication.getPrincipal()).getMberIndex());
		System.out.println(Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));
		data.put("MBER_IDX", Integer.toString(((Member)authentication.getPrincipal()).getMberIndex()));
		model.addAttribute("reviewList", reviewService.reviewListByMember(data));
		return "profile-reviews";
	}
	
	@ResponseBody
	@RequestMapping(value = "/reviewForm")
	public Review reviewsView( Model model,Authentication authentication, String entIndex, String questionNum,HttpServletResponse resp) {
		Map<String, String> data = new HashMap<String,String>();
		int memberIndex = (((Member)authentication.getPrincipal()).getMberIndex());
		/*Member member = memberService.getMemberById((String)authentication.getPrincipal());	*/	
		data.put("mberIndex", Integer.toString(memberIndex));
		data.put("entIndex", entIndex);
		data.put("questionNum", questionNum);
		Review review = reviewService.review(data);
		return review;		
	}
	
	@RequestMapping(value = "/updateReview")
	public String updateReview(Review review,Authentication authentication) {
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
		/*Member member = memberService.getMemberById((String)authentication.getPrincipal());	*/	
		review.setMberIndex(memberIndex);
		reviewService.modifyReview(review);
		return "redirect:reviews";
	}     
	@ResponseBody
	@RequestMapping(value="/deleteReview")
	public boolean deleteReview (HttpServletRequest req,Authentication authentication) {		
		Map<String, String> data = new HashMap<String, String>();
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
		/*Member member = memberService.getMemberById((String)authentication.getPrincipal());	*/	
		data.put("mberIndex", String.valueOf(memberIndex));
		data.put("entIndex", req.getParameter("entIndex"));
		data.put("questionNum", req.getParameter("questionNum"));
		boolean result = reviewService.deleteReview(data);
		return result;
	}
	
	
	/* 회원정보를 통해 작성한 인터뷰정보 가져오기 */
	@RequestMapping(value = "/interviews")
	public String interviewView(Model model,Authentication authentication) {
		Map<String, String> data = new HashMap<String,String>();
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();	
		data.put("MBER_IDX", String.valueOf(memberIndex));
		model.addAttribute("viewData", itvwService.selectListByMemberIdx(data));
		return "profile-interviews";
	
	}
	 /*회원정보와, 기업정보 이용해서 해당 면접리뷰 수정 모달 열기 */
	@RequestMapping(value = "/interviewForm")
	public void form(Model model,Authentication authentication, HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("utf-8");
		Map<String, String> data = new HashMap<String,String>();
		/*Member member = memberService.getMemberById((String)authentication.getPrincipal());	*/
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
		data.put("MBER_IDX", String.valueOf(memberIndex));
		data.put("ENT_IDX", req.getParameter("entIndex"));
		try {
			resp.getWriter().println(new Gson().toJson(itvwService.selectListByIndex(data)));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/updateInterview")
	public String updateInterview(Interview interview,Authentication authentication) {
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
	/*	Member member = memberService.getMemberById((String)authentication.getPrincipal());	*/	
		interview.setMberIndex(memberIndex);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("mberIndex", memberIndex);
		data.put("entIndex", interview.getEntIndex());
		itvwService.updateInterview(interview);
		return "redirect:interviews";
	}  
	@ResponseBody	
	@RequestMapping(value="/deleteInterview")
	public boolean deleteInterview (HttpServletRequest req, Authentication authentication, String entIndex) {
		Map<String, String> data = new HashMap<String, String>();
		/*Member member = memberService.getMemberById((String)authentication.getPrincipal());*/
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
		data.put("mberIndex", String.valueOf(memberIndex));
		data.put("entIndex", entIndex);
		boolean result = itvwService.deleteInterview(data); 
		return result;
	}

	@RequestMapping(value = "/follows")
	public String followView (Model model, Authentication authentication) {
		/*Member member = memberService.getMemberById((String)authentication.getPrincipal());*/
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
		model.addAttribute("followView", followService.getFollowsEntList(memberIndex));
		return "profile-follows";
	}
	
	@RequestMapping(value = "/recent")
	public String recentView (Model model, Authentication authentication) {
		Map<String, Integer> mapData = new HashMap<String, Integer>();
		/*Member member = memberService.getMemberById((String)authentication.getPrincipal());*/
		int memberIndex = ((Member)authentication.getPrincipal()).getMberIndex();
		mapData.put("MBER_IDX",memberIndex);
		model.addAttribute("recentView", entService.getRecentEntList(mapData));
		model.addAttribute("recentViewJson", new Gson().toJson(entService.getRecentEntList(mapData)));
		return "profile-recent";
	}
	
}
