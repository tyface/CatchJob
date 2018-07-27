package com.CatchJob.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.CatchJob.model.Member;
import com.CatchJob.service.MemberService;

@Controller
@RequestMapping
public class MemberController {

	@Autowired
	private MemberService MemberService;

	/* 로그인 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(HttpSession session, HttpServletResponse resp, HttpServletRequest req) {
		boolean result = MemberService.login(req.getParameter("mberId"), req.getParameter("mberPw"));
		String data = "";
		
		System.out.println(req.getParameter("mberId") + req.getParameter("mberPw"));
		
		if (result) {
			session.setAttribute("mberId", req.getParameter("mberId"));
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

	/* 회원가입 
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return null;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(HttpServletRequest request, Member member) {

		if (MemberService.join(member)) {
			// 회원가입 성공
			return null;
		} else {
			return null;
		}
	}

	 로그아웃 
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userid");
		return null;
	}

	 수정 
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateForm(HttpSession session, Model model) {
		String id = (String) session.getAttribute("userid");
		model.addAttribute("member", MemberService.getMemberById(id));

		return null;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Member member) {
		if (MemberService.updateMember(member)) {
			// 회원수정 성공
			return null;
		} else {
			return null;
		}
	}

	 탈퇴 
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteForm(HttpSession session, Model model) {
		String id = (String) session.getAttribute("userid");
		model.addAttribute("member", MemberService.getMemberById(id));

		return null;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Member member) {
		if (MemberService.updateMember(member)) {
			// 회원탈퇴 성공
			return null;
		} else {
			return null;
		}
	}*/
}
