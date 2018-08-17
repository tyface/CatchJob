package com.CatchJob.controller;


import java.io.IOException;
import java.net.URI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.CatchJob.model.Member;
import com.CatchJob.service.MemberService;

@Controller
@RequestMapping
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	@Autowired
	private FacebookConnectionFactory connectionFactory;
	@Autowired
	private OAuth2Parameters oAuth2Parameters;
	    
	/* 로그인 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(HttpSession session, HttpServletResponse resp, String mberId, String mberPw) {
		boolean result = memberService.login(mberId, mberPw);
		String data = "";
		if (result) {
			Member member = memberService.getMemberById(mberId);
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
		

		Member member = new Member();
		member.setMberId(signUpId);
		member.setMberPw(signUpPw);

	
		if (memberService.join(member)) {
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
	
	 /*수정, 탈퇴 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Member member) {
		if (memberService.updateMember(member)) {
			// 회원수정 성공
			return null;
		} else {
			return null;
		}
	}
	
	//google login
	@RequestMapping(value = "/googleLogin")
	public String googleLogin() {
		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		return "redirect:"+url;
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/googleSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(@RequestParam String code, HttpSession session) throws IOException {
		
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
				null);

		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			System.out.printf("accessToken is expired. refresh token = {}", accessToken);
		}
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		
		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();
		

		Member member = new Member();
		member.setMberId(person.getAccountEmail());
		member.setOauthId(person.getId());
		
		if(memberService.getOauthId(member.getMberId(), member.getOauthId()) != null) {
			session.setAttribute("mberIndex", member.getMberIndex());
		}else if(memberService.getMemberById(member.getMberId()) != null){
			memberService.socialJoin(member);
		}else{
			memberService.join(member);
		}
		
		return "redirect:/";
	}
	
	//google login
	@RequestMapping(value = "/facebookLogin")
	public String facebookLogin(HttpServletResponse response, Model model) {
		/* 구글code 발행 */
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
	    String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
	    System.out.println("URL : " + url);
		return "redirect:"+url;
	}
	
	@RequestMapping(value = "/oAuth2Callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String facebookSignInCallback(@RequestParam String code, HttpSession session) throws Exception {
 
        String redirectUri = oAuth2Parameters.getRedirectUri();
 
        OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
        String accessToken = accessGrant.getAccessToken();
        Long expireTime = accessGrant.getExpireTime();
    
        
        if (expireTime != null && expireTime < System.currentTimeMillis()) {
            accessToken = accessGrant.getRefreshToken();
            System.out.printf("accessToken is expired. refresh token = {}", accessToken);
        };
            
        Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
        Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
            
    	String [] fields = { "id", "email",  "name"};
        User userProfile = facebook.fetchObject("me", User.class, fields);
        
        Member member = new Member();
		member.setMberId(userProfile.getEmail());
		member.setOauthId(userProfile.getId());
		
		if(memberService.getOauthId(member.getMberId(), member.getOauthId()) != null) {
			session.setAttribute("mberIndex", member.getMberIndex());
		}else if(memberService.getMemberById(member.getMberId()) != null){
			memberService.socialJoin(member);
		}else{
			memberService.join(member);
		}
		
        return "redirect:http://localhost:8090/catchjob/";
    }
	
}
