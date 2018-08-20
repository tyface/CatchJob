package com.CatchJob.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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

import com.CatchJob.model.Member;
import com.CatchJob.service.MailHandler;
import com.CatchJob.service.MemberService;
import com.CatchJob.service.TempKey;

@Controller
@RequestMapping("/member")
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
	    
	@Autowired
    private JavaMailSender mailSender;
	
	/* 로그인 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(HttpSession session, HttpServletResponse resp, String mberId, String mberPw) {
		boolean result = memberService.login(mberId, mberPw);
		String data = "";
		if (result) {
			Member member = memberService.getMemberById(mberId);
			memberService.visitUpdate(member.getMberIndex());
			session.setAttribute("member", member);
	
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
		String key = new TempKey().getKey(20,false);
		

		Member member = new Member();
		member.setMberId(signUpId);
		member.setMberPw(signUpPw);
		member.setOauthId(key);
		member.setMberFlag("2");
		
		
		if (memberService.getMemberById(signUpId) == null && signUpPw.equals(signUpPwCheck)) {
			memberService.join(member);
			// 회원가입 성공
			//"가입 시 사용한 이메일로 인증해 주세요"
				System.out.println("이메일 인증 시작");
			try {
				MailHandler mailHandler = new MailHandler(mailSender);
				
	        	mailHandler.setSubject("catch job 인증 이메일 입니다.");
				mailHandler.setText(new StringBuffer().append("<h1>메일인증</h1>").
				append("<a href='http://localhost:8090/catchjob/verify?memberId=").
				append(member.getMberId()).
				append("&oauthKey=").append(key).
				append("' target='_blank'>이메일 인증 확인</a>").toString());
				mailHandler.setFrom("catchjob33@gmail.com", "catchjob");
		        mailHandler.setTo(member.getMberId());
		        mailHandler.send();
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
	       
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

	/*  로그아웃  */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/";
	}
	
	 /*패스워드 수정*/
	@RequestMapping(value = "/pwModify", method = RequestMethod.POST)
	public void pwModify(Model model,String password, String passwordCheck, HttpSession session, HttpServletResponse resp) {
		String data = "";
		
		if(password.equals(passwordCheck)) {
			Member member = (Member)session.getAttribute("member");
			member.setMberPw(password);
			memberService.passwordModify(member);
			data = "{\"result\" : true}";	
		}else {
			data = "{\"result\" : false}";
		}
			
		try {
			resp.getWriter().print(data);
		} catch (IOException e) {
			e.printStackTrace();
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
		

		Member member = memberService.getMemberById(person.getAccountEmail());
		
		if(member == null) {
			member = new Member();
			member.setMberId(person.getAccountEmail());
			member.setOauthId(person.getId());
			member.setMberFlag("1");
			memberService.join(member);
		}else if(member.getOauthId() == null || member.getOauthId().equals("")){
			member.setOauthId(person.getId());
			memberService.socialJoin(member);
		}else if(!member.getOauthId().equals(person.getId())) {
			System.out.println("예외발생!!!!!!!!!!!!!!!!!!!!!!!!!!!");	
			System.out.println("이메일이 같은대 소셜 아이디가 다를경우 발생");	
			System.out.println("현실적으로 일어날일 없음");	
			System.out.println("예외발생!!!!!!!!!!!!!!!!!!!!!!!!!!!");	
		}
		memberService.visitUpdate(member.getMberIndex());
		session.setAttribute("member", member);
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
        
		Member member = memberService.getMemberById(userProfile.getEmail());
		
		if(member == null) {
			member = new Member();
			member.setMberId(userProfile.getEmail());
			member.setOauthId(userProfile.getId());
			member.setMberFlag("1");
			memberService.join(member);
		}else if(member.getOauthId() == null || member.getOauthId().equals("")){
			member.setOauthId(userProfile.getId());
			memberService.socialJoin(member);
		}else if(!member.getOauthId().equals(userProfile.getId())) {
			System.out.println("예외발생!!!!!!!!!!!!!!!!!!!!!!!!!!!");	
			System.out.println("이메일이 같은대 소셜 아이디가 다를경우 발생");	
			System.out.println("현실적으로 일어날일 없음");	
			System.out.println("예외발생!!!!!!!!!!!!!!!!!!!!!!!!!!!");	
		}
		
		memberService.visitUpdate(member.getMberIndex());
		session.setAttribute("member", member);
		
        return "redirect:http://localhost:8090/catchjob/";
    }
	
//    //이메일 인증 코드 검증
//    @RequestMapping(value = "/sendMail", method = RequestMethod.GET)
//    public String sendMail(Member user,Model model,RedirectAttributes rttr) throws Exception { 
//        
//        System.out.println("이메일 인증 시작");
//        MailHandler mailHandler = new MailHandler(mailSender);
//        String key = new TempKey().getKey(20,false);
//        
//        mailHandler.setSubject("catch job 인증 이메일 입니다.");
//        mailHandler.setText(new StringBuffer().append("<h1>메일인증</h1>").
//	    append("<a href='http://localhost:8090/catchjob/verify?userEmail=").
//		append(user.getMberId()).
//		append("&memberAuthKey=").append(key).
//		append("' target='_blank'>이메일 인증 확인</a>").toString());
//        mailHandler.setFrom("test@gmail.com", "catchjob");
//        mailHandler.setTo("zxuz34@gmail.com");
//        mailHandler.send();
//        
//        return "test";
//    }
	
    @RequestMapping(value = "/verify", method = RequestMethod.GET)
    public String signSuccess(String memberId, String oauthKey, HttpSession session) { 
        
    	System.out.println("이메일 인증 처리완료?");
    	System.out.println(memberId+"//"+oauthKey);
    	
    	Member member = memberService.getMemberByOauthId(memberId, oauthKey);
    	
    	if(member != null) {
    		member.setMberFlag("1");
    		member.setOauthId("");
    		memberService.modify(member);
    		memberService.visitUpdate(member.getMberIndex());
    		
    		session.setAttribute("member", member);
    	}
    	
        return "redirect:/";
    }
    
}
