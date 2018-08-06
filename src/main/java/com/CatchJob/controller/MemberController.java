package com.CatchJob.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public void login(HttpSession session, HttpServletResponse resp, String mberId, String mberPw) {
		boolean result = MemberService.login(mberId, mberPw);
		String data = "";
		if (result) {
			Member member = MemberService.getMemberById(mberId);
			session.setAttribute("mberIndex", member.getMberIndex());
	
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

	/* 회원가입  */
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public void join(HttpServletRequest request, HttpServletResponse resp, String signUpId, String signUpPw, String signUpPwCheck) {
		//"잘못된 형식의 이메일 주소입니다".					유효성 검사
		//"비밀번호는 00자리 이상 입력해 주세요					유효성 검사2
		String data = "";
		
		Date date = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String to = transFormat.format(date);
		System.out.println(to);

		Member member = new Member();
		member.setMberId(signUpId);
		member.setMberPw(signUpPw);
		member.setRegDate(to);
		member.setLastDate(to);

	
		if (MemberService.join(member)) {
			// 회원가입 성공
			//"가입 시 사용한 이메일로 인증해 주세요"
			data = "{\"result\" : true}";
		} 
		
		if(!signUpPw.equals(signUpPwCheck)) {
			data = "{\"result\" : false}";	
		}
			
		try {
			resp.getWriter().print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*  로그아웃  */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("mberIndex");
		return "redirect:/";
	}
	

	/* 탈퇴 
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Member member) {
		if (MemberService.updateMember(member)) {
			// 회원탈퇴 성공
			return null;
		} else {
			return null;
		}
	}
 */
	
	/*@RequestMapping("/naverlogin")
	public void naverLogin(HttpServletRequest request) {
		
			System.out.println("/naverlogin 요청 받았습니다.");

			
			//검색어를 이용해서 네이버에 요청하고 응답을 받는다. 
			//응답받은 데이터를 모델로 만들어서 jsp로 전달
			// CSRF 방지를 위한 상태 토큰 검증 검증
			// 세션 또는 별도의 저장 공간에 저장된 상태 토큰과 콜백으로 전달받은 state 파라미터의 값이 일치해야 함

			// 콜백 응답에서 state 파라미터의 값을 가져옴
			String state = request.queryParams(“state”);

			// 세션 또는 별도의 저장 공간에서 상태 토큰을 가져옴
			String storedState = request.session().attribute(“state”);

			if( !state.equals( storedState ) ) {
			    return RESPONSE_UNAUTHORIZED; //401 unauthorized
			} else {
			    Return RESPONSE_SUCCESS; //200 success
			}
	}*/
	
	  /*수정 
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
*/
}
