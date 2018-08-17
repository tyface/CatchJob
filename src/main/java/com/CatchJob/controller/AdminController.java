package com.CatchJob.controller;

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
	public String mngMber(Model model, String page, String msgPerPage, String num) { 
		System.out.println("*1");
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
		Map<String, Object> viewData = memberService.getMessageList(pageNumber,numOfMsgPage);
		model.addAttribute("viewData", viewData);
		System.out.println("*2");
		if(num!=null) {
			Member member = memberService.getMember(Integer.parseInt(num));
			model.addAttribute("member", member);
		}
		
		return "admin/member-member-mng";						
	}
	
	@RequestMapping(value="/modifyMber", method=RequestMethod.POST)
	public String mngMber(Model model, String mberId, String mberPw, String mberType, String regDate, String lastDate) { 
		System.out.println("hhhhhhhhhh");
		Member member = new Member();
		member.setMberId(mberId);
		member.setMberPw(mberPw);
		member.setMberType(mberType);
		member.setRegDate(regDate);
		member.setLastDate(lastDate);
		
		boolean result = memberService.modify(member);

		if(result) {
			System.out.println("1");
		} else {
			System.out.println("2");
		}
		return "admin/member-member-mng";	
									
	}

	/* 관리자 그룹 관리 */
	@RequestMapping(value = "/mngAdmin")
	public String mngAdmin(Model model, String page, String msgPerPage, String num) {
		int pageNumber = 1;	
		if (page != null) {
			pageNumber = Integer.parseInt(page);
		} 
		int numOfMsgPage = 10;
		if (msgPerPage != null) {
			numOfMsgPage = Integer.parseInt(msgPerPage);
		}
		Map<String, Object> viewData = adminService.getMessageList(pageNumber,numOfMsgPage);
		model.addAttribute("viewData", viewData);
		
		if(num!=null) {
			Admin admin = adminService.getAdmin(Integer.parseInt(num));
			model.addAttribute("admin", admin);
		}
		
		return "admin/member-admin-mng";
	}

	@RequestMapping(value = "/mngReview")
	public String mngReview() {
		return "admin/company-review-mng";
	}

	@RequestMapping(value = "/mngEnt")
	public String mngEnt() {
		return "admin/company-mng";
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
