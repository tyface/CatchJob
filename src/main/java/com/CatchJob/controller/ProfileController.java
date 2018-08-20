package com.CatchJob.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	public String reviewsView(Model model, HttpSession session) {
		//회원번호로 조회해서 리뷰 데이터 가져오기 
		//System.out.println("진ㅇ입성공입니다 리뷰유리븁리"+session.getAttribute("mberIndex"));
		model.addAttribute("reviewList", reviewService.reviewListByMember(((Member)session.getAttribute("member")).getMberIndex()));
		//System.out.println(reviewService.reviewListByMember(((Member)session.getAttribute("member")).getMberIndex()));
		return "profile-reviews";
	}
	@ResponseBody
	@RequestMapping(value = "/reviewForm")
	public Review reviewsView( Model model,HttpSession session, String entIndex, String questionNum,HttpServletResponse resp) {
		Map<String, String> data = new HashMap<String,String>();
		int memberIndex = ((Member)session.getAttribute("member")).getMberIndex();
		data.put("mberIndex", Integer.toString(memberIndex));
		data.put("entIndex", entIndex);
		data.put("questionNum", questionNum);
//		System.out.println("data: "+data);
//		System.out.println(reviewService.review(data));
//		model.addAttribute("reviewForm", reviewService.review(data));
//		try {
//			resp.getWriter().print(new Gson().toJson(reviewService.review(data)));
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		Review review = reviewService.review(data);
		return review;		
	}
	
	@RequestMapping(value = "/updateReview")
	public String updateReview(Review review, HttpSession session) {
		int memberIndex = (int) (session.getAttribute("mberIndex"));
		review.setMberIndex(memberIndex);
		reviewService.updateReview(review);
//		System.out.println(review);		
		return "redirect:reviews";
	}     
	@ResponseBody
	@RequestMapping(value="/deleteReview")
	public boolean deleteReview (HttpServletRequest req, HttpSession session) {		
		Map<String, String> data = new HashMap<String, String>();
		data.put("mberIndex",  Integer.toString(((Member)session.getAttribute("member")).getMberIndex()));
		data.put("entIndex", req.getParameter("entIndex"));
		data.put("questionNum", req.getParameter("questionNum"));
		System.out.println("리뷰 지울 데이터: "+data);
	//	reviewService.deleteReview(data);
		//return "redirect:reviews";
		
		return reviewService.deleteReview(data);
	}
	
	
	/* 회원정보를 통해 작성한 인터뷰정보 가져오기....... */
	@RequestMapping(value = "/interviews")
	public String interviewView(Model model, HttpSession session) {
	
		model.addAttribute("viewData", itvwService.selectListByMemberIdx(((Member)session.getAttribute("member")).getMberIndex()));
		return "profile-interviews";
	
	}
	 /*회원정보와, 기업정보 이용해서 해당 면접리뷰 수정 모달 열기 */
	
	@RequestMapping(value = "/interviewForm")
	public void form(Model model,HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("utf-8");
		//System.out.println("진입성공-------------------------");
		Map<String, String> data = new HashMap<String,String>();
		int memberIndex = ((Member)session.getAttribute("member")).getMberIndex();
		data.put("mberIndex", Integer.toString(memberIndex));
		data.put("entIndex", req.getParameter("entIndex"));
		//System.out.println("받아온 파라미터 값: "+req.getParameter("entIndex"));
	
	//	model.addAttribute("originalDataJson", new Gson().toJson(entService.selectListByIndex(data)));
	//	System.out.println(entService.selectListByIndex(data));	
		
		try {
			resp.getWriter().println(new Gson().toJson(itvwService.selectListByIndex(data)));
		} catch (IOException e) {
			System.out.println("IOException ---------------------");
		}
	}
	
	@RequestMapping(value = "/updateInterview")
	public String updateInterview(Interview interview, HttpSession session) {
		//interview.setMberIndex(((Member)session.getAttribute("member")).getMberIndex());
		//interview.setIntrvwFlag("1");
		//System.out.println("들어는왔니---");
		int memberIndex = ((Member)session.getAttribute("member")).getMberIndex();
		interview.setMberIndex(memberIndex);
		//System.out.println(interview);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("mberIndex", memberIndex);
		data.put("entIndex", interview.getEntIndex());
		//System.out.println("profileControllre의 updateInterview: "+data);
		itvwService.updateInterview(interview);
		
		return "redirect:interviews";
	}         
	@RequestMapping(value="/deleteInterview")
	public String deleteInterview (HttpServletRequest req, HttpSession session) {
		
		Map<String, String> data = new HashMap<String, String>();
		data.put("mberIndex",  Integer.toString(((Member)session.getAttribute("member")).getMberIndex()));
		data.put("entIndex", req.getParameter("entIndex"));
		itvwService.deleteInterview(data);
		return "redirect:interviews";
	}
	

	@RequestMapping(value = "/follows")
	public String followView (Model model, HttpSession session) {
//		System.out.println("gg");
		System.out.println("컨트롤러: 팔로우 :"+entService.getFollowsEntList(((Member)session.getAttribute("member")).getMberIndex()));
		model.addAttribute("followView", entService.getFollowsEntList(((Member)session.getAttribute("member")).getMberIndex()));
		
		
		return "profile-follows";
	}
	
	@RequestMapping(value = "/recent")
	public String recentView (Model model, HttpSession session) {
		System.out.println("컨트롤러:최신본거:"+entService.getRecentsEntList(((Member)session.getAttribute("member")).getMberIndex()));
		model.addAttribute("recentView", entService.getRecentsEntList(((Member)session.getAttribute("member")).getMberIndex()));
		model.addAttribute("recentViewJson", new Gson().toJson(entService.getRecentsEntList(((Member)session.getAttribute("member")).getMberIndex())));
		return "profile-recent";
	}
	
}
