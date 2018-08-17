package com.CatchJob.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.CatchJob.model.Admin;
import com.CatchJob.model.Member;
import com.CatchJob.service.AdminService;
import com.CatchJob.service.MemberService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;

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

	/* 수정, 탈퇴 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Admin admin) {
		if (adminService.updateAdmin(admin)) {
			return null;
		} else {
			return null;
		}
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
	
		
		Member memberOne = memberService.getMemberById(mberId);
		Member member = new Member();
		member.setMberId(mberId);
		member.setMberPw(mberPw);
		if(mberType==null) {
			member.setMberType(memberOne.getMberType());
		} else {
			member.setMberType(mberType);
		}
		member.setMberFlag(memberOne.getMberFlag());
		member.setRegDate(regDate);
		if(lastDate!=null) {
			member.setLastDate(lastDate);
		}
		member.setMberIndex(memberOne.getMberIndex());
		
		boolean result = memberService.modify(member);

		if(result) {
			System.out.println("update 정상 작동");			
		} else {
			System.out.println("update 작동 불가");
		}
		return "forward:mngMber";									
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
		Admin adminOne = adminService.getAdminById(adminId);	
		Admin admin = new Admin();
		admin.setAdminId(adminId);
		admin.setAdminPw(adminPw);
		admin.setAdminLv(adminLv);
		if(adminLv==null) {
			admin.setAdminLv(adminOne.getAdminLv());
		} else {
			admin.setAdminLv(adminLv);
		}
		admin.setRegDate(regDate);
		if(lastDate!=null) {
			admin.setLastDate(lastDate);
		}
		admin.setAdminIndex(adminOne.getAdminIndex());
		
		boolean result = adminService.updateAdmin(admin);
		if(result) {
			System.out.println("update 정상 작동");			
		} else {
			System.out.println("update 작동 불가");
		}
		return "forward:mngAdmin";	
									
	}
	

	@RequestMapping(value = "/mngReview")
	public String mngReview() {
		return "admin/company-review-mng";
	}

	@RequestMapping(value = "/mngEnt")
	public String mngEnt() {
		return "admin/company-mng";
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

	@RequestMapping(value = "/mngPopUp")
	public String mngPopUp() {
		return "admin/mng-popUp";
	}

}
