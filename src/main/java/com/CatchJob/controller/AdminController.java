package com.CatchJob.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.CatchJob.model.Admin;
import com.CatchJob.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;

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
			return "admin/member-member-mng";
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

	/* 회원 관리 */
	@RequestMapping(value = "/mngMber")
	public String mngMber() {
		
		
		return "admin/member-member-mng";
	}

	@RequestMapping(value = "/mngAdmin")
	public String mngAdmin() {
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
