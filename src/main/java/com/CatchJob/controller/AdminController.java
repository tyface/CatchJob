package com.CatchJob.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.CatchJob.model.Admin;
import com.CatchJob.model.Member;
import com.CatchJob.model.Review;
import com.CatchJob.service.AdminService;
import com.CatchJob.service.MemberService;
import com.CatchJob.service.ReviewService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;
	@Autowired
	ReviewService reviewService;
	
	/* 로그인폼 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String loginForm() {
		return "admin/admin-login";
	}

	/* 로그인 요청 */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String login(HttpSession session, Model model, String adminPw, String adminId) {
		boolean result = adminService.login(adminId, adminPw);
		if (result) {
			Admin admin = adminService.getAdminById(adminId);
			session.setAttribute("adminIndex", admin.getAdminIndex());
			session.setAttribute("adminId", adminId);
			return "redirect:/admin/mngMber";
		} else {
			return "admin/admin-login";
		}
	}

	/* 로그아웃 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("adminIndex");
		session.removeAttribute("adminId");
		return "redirect:/admin";
	}

	/* 회원 그룹 관리 */
	@RequestMapping("/mngMber")
	public String mngMber(Model model, String page, String msgPerPage, String num, String keyword) { 
		int pageNumber = 0;	
		if (page != null) {
			pageNumber = Integer.parseInt(page);
		} else {
			 pageNumber = 1;	
		}
		
		int numOfMsgPage = 0;
		if (msgPerPage != null) {
			numOfMsgPage = Integer.parseInt(msgPerPage);
		} else {
			numOfMsgPage = 10;	
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageNumber", pageNumber);
		data.put("numOfMsgPage", numOfMsgPage);
		
		if(keyword!=null) {
			data.put("keyword", keyword);
		}
		
		if(num!=null) {
			Member member=memberService.getMember(Integer.parseInt(num));
			model.addAttribute("member", member);
		}	
	
		Map<String, Object> viewData = memberService.getMessageList(data);
		model.addAttribute("viewData", viewData);	
		return "admin/member-member-mng";						
	}
	
	@RequestMapping(value="/modifyMber", method=RequestMethod.POST)
	public String modifyMber(Model model, String mberId, String mberPw, String mberType, String regDate, String lastDate) { 
		try {
			Member memberOne = memberService.getMemberById(mberId);
			Member member = new Member();
			member.setMberIndex(memberOne.getMberIndex());
			member.setMberId(mberId);
			member.setMberPw(mberPw);
			if(mberType==null) {
				member.setMberType(memberOne.getMberType());
			} else {
				member.setMberType(mberType);
			}
			member.setMberFlag(memberOne.getMberFlag());
			member.setRegDate(regDate);
			member.setLastDate(lastDate);
	/*		if(lastDate==null) {
				Date date = new Date();
				member.setLastDate(new SimpleDateFormat("YYYY-MM-dd hh:mm:ss").format(date));
			}*/
			boolean result = memberService.modify(member);
			if(result) {
				model.addAttribute("url", "mngMber");
				model.addAttribute("msg", "수정 완료되었습니다");
			} else {
				model.addAttribute("url", "mngMber");
				model.addAttribute("msg", "수정 실패했습니다");
			}
			return "admin/include/result";
		} catch(NullPointerException e) {
			model.addAttribute("url", "mngAdmin");
			model.addAttribute("msg", "수정 실패했습니다");
			return "admin/include/result";
		}
	
	}
	
	/* 관리자 그룹 관리 */
	@RequestMapping(value = "/mngAdmin")
	public String mngAdmin(Model model, String page, String msgPerPage, String num, String keyword) {
		int pageNumber = 0;	
		if (page != null) {
			pageNumber = Integer.parseInt(page);
		} else {
			 pageNumber = 1;	
		}
		
		int numOfMsgPage = 0;
		if (msgPerPage != null) {
			numOfMsgPage = Integer.parseInt(msgPerPage);
		} else {
			numOfMsgPage = 10;	
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageNumber", pageNumber);
		data.put("numOfMsgPage", numOfMsgPage);
		
		if(keyword!=null) {
			data.put("keyword", keyword);
		}
		
		if(num!=null) {
			Admin admin = adminService.getAdmin(Integer.parseInt(num));
			model.addAttribute("admin", admin);
		}
	
		Map<String, Object> viewData = adminService.getMessageList(data);
		model.addAttribute("viewData", viewData);
		return "admin/member-admin-mng";
	}
	
	@RequestMapping(value="/modifyAdmin", method=RequestMethod.POST)
	public String modifyAdmin(Model model, String adminId, String adminPw, String adminLv, String regDate, String lastDate) { 
		try {
			Admin adminOne = adminService.getAdminById(adminId);	
			Admin admin = new Admin();
			admin.setAdminId(adminId);
			admin.setAdminPw(adminPw);		
			if(adminLv==null) {
				admin.setAdminLv(adminOne.getAdminLv());
			} else {
				admin.setAdminLv(adminLv);			
			}
			admin.setRegDate(regDate);
			admin.setLastDate(lastDate);
			/*if(lastDate==null) {
				Date date = new Date();
				admin.setLastDate(new SimpleDateFormat("YYYY-MM-dd hh:mm:ss").format(date));
			}*/
			admin.setAdminIndex(adminOne.getAdminIndex());	
			boolean result = adminService.modify(admin);
	
			if(result) {
				model.addAttribute("url", "mngAdmin");
				model.addAttribute("msg", "수정 완료되었습니다");
			} else {
				model.addAttribute("url", "mngAdmin");
				model.addAttribute("msg", "수정 실패했습니다");
			}
			return "admin/include/result";
		
		} catch(NullPointerException e) {
			model.addAttribute("url", "mngAdmin");
			model.addAttribute("msg", "수정 실패했습니다");
			return "admin/include/result";
		}
									
	}
	
	/* 리뷰 관리*/
	@RequestMapping(value = "/mngReview")
	public String mngReview(Model model, String page, String msgPerPage, String keyword, String mberIndex,
		String entIndex, String questionNum, String entName, String keywordOption) {
		
		System.out.println("keyword : "+ keyword);
		System.out.println("mberIndex : "+ mberIndex);
		System.out.println("entIndex : "+ entIndex);
		System.out.println("questionNum : "+ questionNum);
		System.out.println("entName : "+ entName);
		System.out.println("keywordOption: "+keywordOption);
		
		int pageNumber = 0;	
		if (page != null) {
			pageNumber = Integer.parseInt(page);
		} else {
			 pageNumber = 1;	
		}
		
		int numOfMsgPage = 0;
		if (msgPerPage != null) {
			numOfMsgPage = Integer.parseInt(msgPerPage);
		} else {
			numOfMsgPage = 10;	
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageNumber", pageNumber);
		data.put("numOfMsgPage", numOfMsgPage);
		
		if(keyword!=null) {
			data.put("keyword", keyword);
			data.put("keywordOption", keywordOption);
		}
		
		//내용보기 클릭시 출력용
/*			Map<String, String> reviewMap = new HashMap<String, String>();	
			reviewMap.put("mberIndex", mberIndex);
			reviewMap.put("entIndex", entIndex);
			reviewMap.put("questionNum", questionNum);
			Review review = reviewService.review(reviewMap);
			model.addAttribute("review", review);*/
		
		Map<String, Object> viewData = reviewService.getMessageList(data);
		model.addAttribute("viewData", viewData);

		return "admin/review-mng";
	}

	@RequestMapping(value = "/mngEnt")
	public String mngEnt() {
		return "admin/enterprise-mng";
	}

	@RequestMapping(value = "/mngInduty")
	public String mngInduty() {
		
		return "admin/mng-industry";
	}
	
	@RequestMapping(value = "/mngMain")
	public String mngMain() {
		return "admin/mng-main";
	}

	@RequestMapping(value = "/mngQnA")
	public String mngQnA() {
		return "admin/mng-QnA";
	}


}
