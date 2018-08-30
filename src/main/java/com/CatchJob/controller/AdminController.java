/*package com.CatchJob.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.CatchJob.model.Admin;
import com.CatchJob.model.Enterprise;
import com.CatchJob.model.Member;
import com.CatchJob.model.Review;
import com.CatchJob.model.UniversalDomain;
import com.CatchJob.service.AdminService;
import com.CatchJob.service.EnterpriseService;
import com.CatchJob.service.MemberService;
import com.CatchJob.service.ReviewService;
import com.CatchJob.service.UniversalDomainService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	EnterpriseService enterpriseService;
	@Autowired
	UniversalDomainService domainService;
	
	 로그인폼 
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String loginForm() {
		return "admin/admin-login";
	}

	 로그아웃 
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
	}

	 회원 그룹 관리 
	@RequestMapping("/mngMber")
	public String mngMber(Model model, String page, String msgPerPage, String num, String keyword) { 
		int pageNumber = 1;	
		if (page != null) {
			pageNumber = Integer.parseInt(page);
		}
		
		int numOfMsgPage = 10;
		if (msgPerPage != null) {
			numOfMsgPage = Integer.parseInt(msgPerPage);
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

			boolean result = memberService.modify(member);
			if(result) {
				model.addAttribute("url", "mngMber");
				model.addAttribute("msg", "수정 완료되었습니다");
			} else {
				model.addAttribute("url", "mngMber");
				model.addAttribute("msg", "수정 실패했습니다");
			}
			return "admin/include/result";
		} catch(Exception e) {
			model.addAttribute("url", "mngAdmin");
			model.addAttribute("msg", "수정 실패했습니다");
			return "admin/include/result";
		}
	
	}
	
	 관리자 그룹 관리 
	@RequestMapping(value = "/mngAdmin")
	public String mngAdmin(Model model, String page, String msgPerPage, String num, String keyword) {
		int pageNumber = 1;	
		if (page != null) {
			pageNumber = Integer.parseInt(page);
		}
		
		int numOfMsgPage = 10;
		if (msgPerPage != null) {
			numOfMsgPage = Integer.parseInt(msgPerPage);
		} 
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageNumber", pageNumber);
		data.put("numOfMsgPage", numOfMsgPage);
		
		if(keyword!=null) {
			data.put("keyword", keyword);
		}
		
		if(num!=null) {
			Member member=memberService.getMember(Integer.parseInt(num));
			model.addAttribute("admin", member);
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
		
		} catch(Exception e) {
			model.addAttribute("url", "mngAdmin");
			model.addAttribute("msg", "수정 실패했습니다");
			return "admin/include/result";
		}
									
	}
	
	 리뷰 관리
	@RequestMapping(value = "/mngReview")
	public String mngReview(Model model, String page, String msgPerPage, String keyword, String keywordOption) {
		
		int pageNumber = 1;	
		if (page != null) {
			pageNumber = Integer.parseInt(page);
		}
		
		int numOfMsgPage = 10;
		if (msgPerPage != null) {
			numOfMsgPage = Integer.parseInt(msgPerPage);
		} 
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageNumber", pageNumber);
		data.put("numOfMsgPage", numOfMsgPage);
		
		if(keyword != null) {
			data.put("keyword", keyword);
			data.put("keywordOption", keywordOption);
		}
	
		Map<String, Object> viewData = reviewService.getMessageList(data);
		model.addAttribute("viewData", viewData);
		
		return "admin/review-mng";
	}

	@RequestMapping(value="/modifyReviewFlag", method=RequestMethod.POST)
	public void modifyReview(@RequestParam(value="valueArr[]") ArrayList<String> arrayParams, Model model,HttpServletResponse resp) {
		System.out.println(arrayParams);
		boolean result=false;
		for(int i=0; i<arrayParams.size(); i++) {
			Review review = reviewService.selectReview(arrayParams.get(i));
			review.setReviewFlag("1");
			result = reviewService.modifyReview(review);
		}

		String data = "";
		if (result) {
			data = "{\"result\" : true}";
		} else {
			data = "{\"result\" : false}";
		}
		try {
			resp.getWriter().print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/deleteReviewFlag", method=RequestMethod.POST)
	public void deleteReview(@RequestParam(value="valueArr[]") ArrayList<String> arrayParams, Model model,HttpServletResponse resp) {
		System.out.println(arrayParams);
		boolean result=false;
		for(int i=0; i<arrayParams.size(); i++) {
			Review review = reviewService.selectReview(arrayParams.get(i));
			review.setReviewFlag("2");
			result = reviewService.modifyReview(review);
		}
		
		String data = "";
		if (result) {
			data = "{\"result\" : true}";
		} else {
			data = "{\"result\" : false}";
		}
		try {
			resp.getWriter().print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/modifyComment", method=RequestMethod.POST)
	public String modifyComment(Model model, String reviewIndex, 
			String entIndex, String mberId, String questionNum, String contents, String regDate, String evaluation) {
			
		try {
			Review review = reviewService.selectReview(reviewIndex);
			String qNum = questionNum.substring(0, 1);
			review.setEntIndex(Integer.parseInt(entIndex));
			review.setMberId(mberId);
			review.setQuestionNum(Integer.parseInt(qNum));
			review.setContents(contents);
			review.setEvaluationScore(Integer.parseInt(evaluation));
			boolean result = reviewService.modifyReview(review);
					
			if(result) {
				model.addAttribute("url", "mngReview");
				model.addAttribute("msg", "수정 완료되었습니다");
			} else {
				model.addAttribute("url", "mngReview");
				model.addAttribute("msg", "수정 실패했습니다");
			}
			return "admin/include/result";
			
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("url", "mngReview");
			model.addAttribute("msg", "수정 실패했습니다");
			return "admin/include/result";
		}
	
	}
			//기업 관리 
	@RequestMapping(value = "/mngEnt")
	public String mngEnt(Model model, String page, String msgPerPage, String keyword, String keywordOption) {
		int pageNumber = 1;	
		if (page != null) {
			pageNumber = Integer.parseInt(page);
		}
		
		int numOfMsgPage = 10;
		if (msgPerPage != null) {
			numOfMsgPage = Integer.parseInt(msgPerPage);
		} 

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageNumber", pageNumber);
		data.put("numOfMsgPage", numOfMsgPage);

		if (keyword != null) {
			data.put("keyword", keyword);
			data.put("keywordOption", keywordOption);
		}

		Map<String, Object> viewData = enterpriseService.getMessageList(data);
		model.addAttribute("viewData", viewData);

		return "admin/enterprise-mng";
	}
	
	@RequestMapping(value="/modifyEntFlag", method=RequestMethod.POST)
	public void modifyEntFlag(@RequestParam(value="valueArr[]") ArrayList<String> arrayParams, Model model,HttpServletResponse resp) {
		System.out.println(arrayParams);
		boolean result=false;
		for(int i=0; i<arrayParams.size(); i++) {
			Enterprise ent=enterpriseService.selectEnt(Integer.parseInt(arrayParams.get(i)));
			ent.setEntFlag("1");
			result = enterpriseService.modifyEnt(ent);
		}

		String data = "";
		if (result) {
			data = "{\"result\" : true}";
		} else {
			data = "{\"result\" : false}";
		}
		try {
			resp.getWriter().print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/deleteEntFlag", method=RequestMethod.POST)
	public void deleteEntFlag(@RequestParam(value="valueArr[]") ArrayList<String> arrayParams, Model model,HttpServletResponse resp) {
		System.out.println(arrayParams);
		boolean result=false;
		for(int i=0; i<arrayParams.size(); i++) {
			Enterprise ent= enterpriseService.selectEnt(Integer.parseInt(arrayParams.get(i)));
			ent.setEntFlag("2");
			result = enterpriseService.modifyEnt(ent);
		}
		
		String data = "";
		if (result) {
			data = "{\"result\" : true}";
		} else {
			data = "{\"result\" : false}";
		}
		try {
			resp.getWriter().print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/modifyEnt", method=RequestMethod.POST)
	public String modifyEnt(Model model, String entIndex, String entName, String entBizRegNum, String entFlag, 
			String entSubscriberFlag) {
			
		try {
			Enterprise ent = enterpriseService.selectEnt(Integer.parseInt(entIndex));
			ent.setEntName(entName);
			ent.setEntBizRegNum(entBizRegNum);
			ent.setEntFlag(entFlag);
			ent.setEntSubscriberFlag(entSubscriberFlag);
			
			boolean result = enterpriseService.modifyEnt(ent);
					
			if(result) {
				model.addAttribute("url", "mngEnt");
				model.addAttribute("msg", "수정 완료되었습니다");
			} else {
				model.addAttribute("url", "mngEnt");
				model.addAttribute("msg", "수정 실패했습니다");
			}
			return "admin/include/result";
			
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("url", "mngEnt");
			model.addAttribute("msg", "수정 실패했습니다");
			return "admin/include/result";
		}
	
	}
	//도메인 관리
	@RequestMapping("/mngDomain")
	public String mngDomain(Model model, String page, String msgPerPage, String keyword, String keywordOption) { 
		int pageNumber = 1;	
		if (page != null) {
			pageNumber = Integer.parseInt(page);
		}	
		
		int numOfMsgPage = 10;
		if (msgPerPage != null) {
			numOfMsgPage = Integer.parseInt(msgPerPage);
		} 
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("pageNumber", pageNumber);
		data.put("numOfMsgPage", numOfMsgPage);

		if (keyword != null) {
			data.put("keyword", keyword);
			data.put("keywordOption", keywordOption);
		}
		System.out.println("**************");
		System.out.println(pageNumber);
		System.out.println(numOfMsgPage);
		System.out.println(keyword);

		System.out.println(keywordOption);
		System.out.println("**************");
		
		Map<String, Object> viewData = domainService.getMessageList(data);
		model.addAttribute("viewData", viewData);

		return "admin/domain-mng";						
	}
	
	@RequestMapping(value="/registerDomain", method=RequestMethod.POST)
	public String registerDomain(Model model, String domainAddress, String domainName) {			
		try {
			UniversalDomain domain = new UniversalDomain();
			domain.setDomainAddress(domainAddress);
			domain.setDomainName(domainName);
			
			boolean result = domainService.insertDomain(domain);
			
			if(result) {
				model.addAttribute("url", "mngDomain");
				model.addAttribute("msg", "등록 완료되었습니다");
			} else {
				model.addAttribute("url", "mngDomain");
				model.addAttribute("msg", "등록 실패했습니다");
			}
			return "admin/include/result";
			
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("url", "mngDomain");
			model.addAttribute("msg", "등록 실패했습니다");
			return "admin/include/result";
		}	
	}
	
	@RequestMapping(value="/deleteDomain")
	public String deleteDomain(Model model, String domainIndex) {	
		try {	
			boolean result = domainService.deleteDomain(Integer.parseInt(domainIndex));
			if(result) {
				model.addAttribute("url", "mngDomain");
				model.addAttribute("msg", "삭제 완료되었습니다");
			} else {
				model.addAttribute("url", "mngDomain");
				model.addAttribute("msg", "삭제 실패했습니다");
			}
			return "admin/include/result";
			
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("url", "mngDomain");
			model.addAttribute("msg", "삭제 실패했습니다");
			return "admin/include/result";
		}	
	}
	
	@RequestMapping(value = "/mngInduty")
	public String mngInduty() {
		
		return "admin/mng-industry";
	}
	
	@RequestMapping(value = "/mngMain")
	public String mngMain() {
		return "admin/mng-main";
	}

	@RequestMapping(value = "/mngFAQ")
	public String mngQnA() {
		return "admin/mng-FAQ";
	}


}
*/