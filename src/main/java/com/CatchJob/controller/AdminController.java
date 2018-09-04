package com.CatchJob.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.CatchJob.model.Enterprise;
import com.CatchJob.model.Industry;
import com.CatchJob.model.Member;
import com.CatchJob.model.Review;
import com.CatchJob.model.UniversalDomain;
import com.CatchJob.service.EnterpriseService;
import com.CatchJob.service.IndustryService;
import com.CatchJob.service.MemberService;
import com.CatchJob.service.ReviewService;
import com.CatchJob.service.UniversalDomainService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	MemberService memberService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	EnterpriseService enterpriseService;
	@Autowired
	UniversalDomainService domainService;
	@Autowired
	IndustryService industryService;
	
	
	/* ROLE_ADMIN이 ROLE_MASTER 권한 요구할 때 */
	@RequestMapping(value ="/403", method = {RequestMethod.GET,RequestMethod.POST})
	public String error403(HttpServletRequest request,HttpServletResponse response,Model model) {
		model.addAttribute("msg", "권한이 없습니다");
		return "admin/include/historyBack";
	}
	
	/* 확인창 */
	@RequestMapping("/result")
	public String result() {
		return "admin/include/result";
	}
	
	/* 로그인폼 */
	@RequestMapping("")
	public String loginForm() {
		return "admin/admin-login";
	}

	/* 로그아웃 */
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
	}

	/* 회원 그룹 관리 */
	@RequestMapping(value="/mngMber", method = RequestMethod.GET)
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
	
		Map<String, Object> viewData = memberService.getMemberMessageList(data);
		model.addAttribute("viewData", viewData);	
		return "admin/member-member-mng";						
	}
	
	@RequestMapping(value="/modifyMber", method=RequestMethod.POST)
	public String modifyAuthenticatedMber(Model model, String mberId, String mberPw, 
			@RequestParam(required=false, value="mberType")String mberType, String regDate, 
			@RequestParam(required=false, value="mberFlag")String mberFlag, String lastDate) { 
		try {					
			Member memberOne = memberService.getMemberById(mberId);
			
			Member member = new Member();
			member.setMberIndex(memberOne.getMberIndex());
			member.setMberId(mberId);

			PasswordEncoder encoder = new BCryptPasswordEncoder();
			member.setMberPw(encoder.encode(mberPw));

			if(mberType==null) {
				member.setMberType(memberOne.getMberType());
			} else {
				member.setMberType(mberType);
			}
			
			if(mberFlag==null) {
				member.setMberFlag(memberOne.getMberFlag());
			} else {
				member.setMberFlag(mberFlag);
			}
			
			member.setRegDate(regDate);
			member.setLastDate(lastDate);
					
			boolean result = memberService.modify(member);
				
			System.out.println(result);
			
			if(result) {				
				model.addAttribute("msg", "수정 완료되었습니다");
			} else {
				model.addAttribute("msg", "수정 실패했습니다");
			}
		
			model.addAttribute("url", "mngMber");
			return "admin/include/result";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("url", "mngMber");
			model.addAttribute("msg", "수정 실패했습니다");
			return "admin/include/result";
		}
	
	}
	
	/* 관리자 그룹 관리 */
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
			Member member = memberService.getMember(Integer.parseInt(num));
			model.addAttribute("admin", member);
			
			System.out.println(member);
		}
	
		Map<String, Object> viewData = memberService.getAdminMessageList(data);
		
		System.out.println(viewData);
		model.addAttribute("viewData", viewData);
		return "admin/member-admin-mng";
	}
	
	@RequestMapping(value="/modifyAdmin", method=RequestMethod.POST)
	public String modifyAdmin(Model model, String mberId, String mberPw, @RequestParam(required=false, value="mberType")String mberType, 
			 @RequestParam(required=false, value="regDate")String regDate, @RequestParam(required=false, value="lastDate")String lastDate) { 
		try {		
			Member memberOne = memberService.getMemberById(mberId);
			Member member = new Member();
			member.setMberIndex(memberOne.getMberIndex());
			member.setMberId(mberId);
			
			PasswordEncoder encoder = new BCryptPasswordEncoder();
			member.setMberPw(encoder.encode(mberPw));

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
	
	/* 리뷰 관리*/
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
	public String modifyComment(Model model, String reviewIndex, String entIndex, String mberId, 
			String questionNum, String contents, String regDate, String evaluation) {
			
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
				model.addAttribute("msg", "수정 완료되었습니다");
			} else {
				model.addAttribute("msg", "수정 실패했습니다");
			}
			model.addAttribute("url", "mngReview");
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
			Enterprise ent=enterpriseService.getEnt(Integer.parseInt(arrayParams.get(i)));
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
			Enterprise ent= enterpriseService.getEnt(Integer.parseInt(arrayParams.get(i)));
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
			Enterprise ent = enterpriseService.getEnt(Integer.parseInt(entIndex));
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
	public String mngDomain(Model model, String page, String msgPerPage, String keyword,String keywordOption) { 
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
		
		Map<String, Object> viewData = domainService.getMessageList(data);
		model.addAttribute("viewData", viewData);

		return "admin/domain-mng";						
	}
	
	@RequestMapping(value="/registDomain", method=RequestMethod.POST)
	public String registDomain(Model model, String domainAddress, String domainName) {			
		try {
			UniversalDomain domain = new UniversalDomain();
			domain.setDomainAddress(domainAddress);
			domain.setDomainName(domainName);
			
			boolean result = domainService.registDomain(domain);
			
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
	
	@RequestMapping(value="/updateDomain", method=RequestMethod.POST)
	public String updateDomain(Model model, String domainAddress, String domainName, int domainIndex) {			
		try {
			UniversalDomain domain = new UniversalDomain();
			domain.setDomainAddress(domainAddress);
			domain.setDomainName(domainName);
			domain.setDomainIndex(domainIndex);
			boolean result = domainService.modifyDomain(domain);
			
			if(result) {
				model.addAttribute("url", "mngDomain");
				model.addAttribute("msg", "수정 완료되었습니다");
			} else {
				model.addAttribute("url", "mngDomain");
				model.addAttribute("msg", "수정 실패했습니다");
			}
			return "admin/include/result";
			
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("url", "mngDomain");
			model.addAttribute("msg", "등록 실패했습니다");
			return "admin/include/result";
		}	
	}
	
	@RequestMapping("/deleteDomain")
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
	
	@RequestMapping("/mngInduty")
	public String mngInduty(Model model) {
		Map<String, Object> viewData = industryService.getIndustryList();
		
		model.addAttribute("viewData", viewData.get("industryList"));
		return "admin/mng-industry";
	}
	

	@RequestMapping("/mngIndustryCode")
	public String mngIndustryCode(Model model,int largeCatagory) {	
		Map<String, Object> viewData = industryService.getIndustryList();		
		model.addAttribute("viewData", viewData.get("industryList"));
		
		List<Industry> data=new ArrayList<>();
		data = industryService.getIndustryCodeList(largeCatagory);
		model.addAttribute("industryCode", data);
	
		return "admin/mng-industry";
	}
	
	@RequestMapping("/mngIndustryCodeDetails")
	public String mngIndustryCodeDetails(Model model, int largeCatagory, int industryCode) {
		Map<String, Object> viewData = industryService.getIndustryList();	
		model.addAttribute("viewData", viewData.get("industryList"));
		
		List<Industry> data=new ArrayList<>(); 
		data = industryService.getIndustryCodeList(largeCatagory);
		System.out.println("data:"+data);
		model.addAttribute("industryCode", data);
		
	/*	Industry industry=industryService.getIndustry(industryCode);
		model.addAttribute("industry", industry);	*/
		return "admin/mng-industry";
	}
	
	@RequestMapping(value="/registCatagory", method=RequestMethod.POST)
	public String registCatagory(Model model,String largeCatagory,String largeCatagoryName) {			
		try {
			Industry industry=new Industry();
			industry.setLargeCatagory(largeCatagory);
			industry.setLargeCatagoryName(largeCatagoryName);
			
			boolean result = industryService.registCatagory(industry);
			
			if(result) {
				model.addAttribute("url", "mngInduty");
				model.addAttribute("msg", "등록 완료되었습니다");
			} else {
				model.addAttribute("url", "mngInduty");
				model.addAttribute("msg", "등록 실패했습니다");
			}
			return "admin/include/result";
			
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("url", "mngInduty");
			model.addAttribute("msg", "등록 실패했습니다");
			return "admin/include/result";
		}	
	}
	@RequestMapping(value="/modifyInduty", method=RequestMethod.POST)
	public String modifyInduty(Model model,String largeCatagory,String largeCatagoryName, String industryCode, String regDate) {			
		try {
			Industry industry=new Industry();
			industry.setLargeCatagory(largeCatagory);
			industry.setLargeCatagoryName(largeCatagoryName);
			industry.setIndustryCode(industryCode);
			industry.setRegDate(regDate);
			
			boolean result = industryService.registCatagory(industry);
			
			if(result) {
				model.addAttribute("url", "mngInduty");
				model.addAttribute("msg", "수정 완료되었습니다");
			} else {
				model.addAttribute("url", "mngInduty");
				model.addAttribute("msg", "수정 실패했습니다");
			}
			return "admin/include/result";
			
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("url", "mngInduty");
			model.addAttribute("msg", "수정 실패했습니다");
			return "admin/include/result";
		}	
	}
}
