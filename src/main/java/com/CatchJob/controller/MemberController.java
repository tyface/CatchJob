package com.CatchJob.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.CatchJob.model.Member;
import com.CatchJob.service.MemberService;

@Controller
@RequestMapping("/catchjob")
public class MemberController {

	@Autowired
	private MemberService MemberService;

	/* 로그인 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpSession session, Member member, RedirectAttributes ra) {
		System.out.println("1");
		boolean result = MemberService.login(member.getMberId(), member.getMberPw());
		System.out.println("2");
		if (result) {
			// 세션에 아이디를 담고 메인으로 이동
			session.setAttribute("mberId", member.getMberId());
			return "redirect:/catchjob";
		} else {
			 return "redirect:/catchjob";
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
