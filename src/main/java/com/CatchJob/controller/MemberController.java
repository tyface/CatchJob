package com.CatchJob.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.CatchJob.commons.Constants;
import com.CatchJob.model.Member;
import com.CatchJob.model.Role;
import com.CatchJob.service.MailHandler;
import com.CatchJob.service.MailService;
import com.CatchJob.service.MemberService;
import com.CatchJob.service.TempKey;
import com.CatchJob.service.UniversalDomainService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private UniversalDomainService domainService;
	@Autowired
	private MailService mailService;

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
	@Autowired
	private ResourceLoader resourceLoader;

	/*
	 * /* 로그인
	 */  //TODO 삭제 대기중
	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public void
	 * login(HttpSession session, HttpServletResponse resp, String mberId, String
	 * mberPw) { String data = ""; Member member =
	 * memberService.getMemberById(mberId);
	 * 
	 * System.out.println(
	 * "진입=============================================================================="
	 * ); if (member != null) { System.out.println(
	 * "logib=============================================================================="
	 * ); boolean result = memberService.login(mberId, mberPw); System.out
	 * .println("login end=============================================================================="
	 * ); if (result) { memberService.visitUpdate(member.getMberIndex());
	 * session.setAttribute("member", member);
	 * 
	 * data = "{\"result\" : \"CODE_01\"}"; //로그인 성공
	 * 
	 * } else { System.out .println(
	 * "else=============================================================================="
	 * );
	 * 
	 * data = "{\"result\" : \"CODE_02\"}"; //비밀번호 불일치, 인증되지 않은 회원 }
	 * 
	 * } else { data = "{\"result\" : \"CODE_03\"}"; // 사용자가 존재하지 않습니다. }
	 * 
	 * System.out.println(
	 * "종료=============================================================================="
	 * ); try { resp.getWriter().print(data); } catch (IOException e) {
	 * e.printStackTrace(); } }
	 */

	@RequestMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

	}

	/* 회원가입 */
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public void join(HttpServletResponse resp, String signUpId, String signUpPw,
			String signUpPwCheck) {
		// "잘못된 형식의 이메일 주소입니다". 유효성 검사
		// "비밀번호는 00자리 이상 입력해 주세요 유효성 검사2
		String data = "";
		String key = new TempKey().getKey(20, false);

		Member member = new Member();
		member.setMberId(signUpId);
		// 비밀번호 암호화
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		member.setMberPw(encoder.encode(signUpPw));

		member.setOauthId(key);
		member.setMberFlag("2");

		try {
			if (memberService.getMemberById(signUpId) == null && signUpPw.equals(signUpPwCheck)) {
				memberService.join(member);
				// 회원가입 성공
				// "가입 시 사용한 이메일로 인증해 주세요"
				System.out.println("이메일 인증 시작");

				MailHandler mailHandler = new MailHandler(mailSender);

				mailHandler.setSubject("catch job 인증 이메일 입니다.");
				mailHandler.setText(new StringBuffer().append("<h1>메일인증</h1>")
						.append("<a href='" + Constants.Config.HOST + "/member/verify?memberId=")
						.append(member.getMberId()).append("&oauthKey=").append(key)
						.append("' target='_blank'>이메일 인증 확인</a>").toString());
				mailHandler.setFrom(Constants.Config.ADMIN_EMAIL, Constants.Config.ADMIN_NAME);
				mailHandler.setTo(member.getMberId());
				mailHandler.send();
				
				
				
				mailHandler.setSubject("catch job 인증 이메일 입니다.");
				mailHandler.setText(mailService.getMailTemplate(signUpId, Constants.File.PW_RESET));

				FileSystemResource fsr = new FileSystemResource(
						resourceLoader.getResource(Constants.File.IMG_SUCSSES).getFile());
				mailHandler.addInline("image-1", fsr);
				fsr = new FileSystemResource(resourceLoader.getResource(Constants.File.IMG_LOGO_1).getFile());
				mailHandler.addInline("logo", fsr);

				mailHandler.setFrom(Constants.Config.ADMIN_EMAIL, Constants.Config.ADMIN_NAME);
				mailHandler.setTo(signUpId);
				mailHandler.send();

				
				

				data = "{\"result\" : true}";
			} else {
				data = "{\"result\" : false}";
			}

		} catch (Exception e) {
			e.printStackTrace();
			data = "{\"result\" : false}";
		} finally {
			try {
				resp.getWriter().print(data);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/* 로그아웃 */
	/*
	 * @RequestMapping("/logout") public String logout(HttpSession session) {
	 * session.removeAttribute("member"); return "redirect:/"; }
	 */

	/* 패스워드 수정 */
	@RequestMapping(value = "/passwordModify", method = RequestMethod.POST)
	public void pwModify(String password, String passwordCheck, HttpSession session, HttpServletResponse resp,Authentication authentication) {
		String data = "";

		if (password.equals(passwordCheck)) {
			System.out.println(authentication.getPrincipal());
			Member member = (Member)authentication.getPrincipal();
			PasswordEncoder encoder = new BCryptPasswordEncoder();
			member.setMberPw(encoder.encode(password));
			memberService.passwordModify(member);
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

	/* 정회원 인증 메일 보내기 */
	@RequestMapping(value = "/regularMemberMail")
	public void regularMemberMail(String email, HttpSession session, HttpServletResponse resp,Authentication authentication) {
		String data = "";
		String domain;
		Member member = (Member)authentication.getPrincipal();

		String memberId = member.getMberId();

		int index = email.indexOf("@");
		domain = email.substring(index + 1);

		try {
			if (domainService.findUniDomain(domain) == null) {
				FileSystemResource fsr;
				MailHandler mailHandler = new MailHandler(mailSender);

				mailHandler.setSubject("CatchJob 정회원인증 메일 입니다.");
				mailHandler.setText(mailService.getMailTemplate(memberId, Constants.File.VERIFY_REGULAR));

				fsr = new FileSystemResource(resourceLoader.getResource(Constants.File.IMG_SUCSSES).getFile());
				mailHandler.addInline("image-1", fsr);
				fsr = new FileSystemResource(resourceLoader.getResource(Constants.File.IMG_LOGO_1).getFile());
				mailHandler.addInline("logo", fsr);

				mailHandler.setFrom(Constants.Config.ADMIN_EMAIL, Constants.Config.ADMIN_NAME);
				mailHandler.setTo(email);
				mailHandler.send();
				data = "{\"result\" : \"CODE_01\"}"; // 이메일 전송 완료

			} else {
				data = "{\"result\" : \"CODE_02\"}"; // 범용 이메일 일경우
			}
		} catch (Exception e) {
			data = "{\"result\" : \"CODE_03\"}"; // 이메일 전송 실패
			e.printStackTrace();
		} finally {
			try {
				resp.getWriter().print(data);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/* 정회원 인증 하기 */

	@RequestMapping(value = "/verifyRegularMember")
	public String verifyRegularMember(String memberId, String oauthId, HttpSession session, HttpServletResponse resp) {
		String data = "";
		try {
			Member member = memberService.getMemberByOauthId(memberId, oauthId);

			if (member != null) {
				member.setMberType("2");
				System.out.println(member);
				memberService.memberTypeModify(member);
				data = "{\"result\" : \"CODE_01\"}"; // 정회원 업데이트 완료
			} else {
				data = "{\"result\" : \"CODE_02\"}"; // 회원 ID 와 인증 ID 불일치
			}

		} catch (Exception e) {
			data = "{\"result\" : \"CODE_03\"}"; // TODO 알수업는 오류
			e.printStackTrace();
		} finally {
			try {
				resp.getWriter().print(data);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/";
	}

	/* 비밀번호 재설정 메일보내기 */
	@RequestMapping(value = "/findPasswordMail")
	public void findPasswordMail(String email, HttpServletResponse resp) {
		String data = "";

		try {
			MailHandler mailHandler = new MailHandler(mailSender);
			mailHandler.setSubject("catch job 비밀번호 재설정 메일 입니다.");
			mailHandler.setText(mailService.getMailTemplate(email, Constants.File.PW_RESET));

			FileSystemResource fsr = new FileSystemResource(
					resourceLoader.getResource(Constants.File.IMG_SUCSSES).getFile());
			mailHandler.addInline("image-1", fsr);
			fsr = new FileSystemResource(resourceLoader.getResource(Constants.File.IMG_LOGO_1).getFile());
			mailHandler.addInline("logo", fsr);

			mailHandler.setFrom(Constants.Config.ADMIN_EMAIL, Constants.Config.ADMIN_NAME);
			mailHandler.setTo(email);
			mailHandler.send();

			data = "{\"result\" : true}";

		} catch (Exception e) {
			e.printStackTrace();
			data = "{\"result\" : false}";
		} finally {
			try {
				resp.getWriter().print(data);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/* 비밀번호 재설정 페이지 뷰 */
	@RequestMapping(value = "/passwordModifyView")
	public String passwordModifyView(Model model, String memberId, String oauthId) {
		model.addAttribute("memberId", memberId);
		model.addAttribute("oauthId", oauthId);
		return "password-modify";
	}

	/* 패스워드 재설정2 */
	@RequestMapping(value = "/passwordModify2", method = RequestMethod.POST)
	public void pwModify2(String password, String memberId, String oauthId,HttpServletResponse resp) {
		String data = "";
		Member member = memberService.getMemberByOauthId(memberId, oauthId);
		
		if (member != null) {
			PasswordEncoder encoder = new BCryptPasswordEncoder();
			member.setMberId(memberId);
			member.setMberPw(encoder.encode(password));
			member.setOauthId(oauthId);
			memberService.passwordModify(member);
			data = "{\"result\" : true}";
		} else {
			System.out.println("실패");
			data = "{\"result\" : false}";
		}

		try {
			resp.getWriter().print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// google login
	@RequestMapping(value = "/googleLogin")
	public String googleLogin() {
		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		return "redirect:" + url;
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/googleSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(@RequestParam String code, HttpSession session,HttpServletResponse resp, RedirectAttributes redirectAttributes) throws IOException {

		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
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

		if (member == null) {
			member = new Member();
			member.setMberId(person.getAccountEmail());
			member.setOauthId(person.getId());
			member.setMberFlag("1");
			memberService.join(member);
		} else if (member.getOauthId() == null || member.getOauthId().equals("")) {
			member.setOauthId(person.getId());
			memberService.socialJoin(member);
		} else if (!member.getOauthId().equals(person.getId())) {
			System.out.println("예외발생!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			System.out.println("이메일이 같은대 소셜 아이디가 다를경우 발생");
			System.out.println("현실적으로 일어날일 없음");
			System.out.println("예외발생!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}
		memberService.visitUpdate(member.getMberIndex());
		member.addAuthority(new Role(member.getMberType()));
		SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(member, null,member.getAuthorities()));
		return "redirect:/";
	}

	// google login
	@RequestMapping(value = "/facebookLogin")
	public String facebookLogin(HttpServletResponse response, Model model) {
		/* 구글code 발행 */
		OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
		System.out.println("URL : " + url);
		return "redirect:" + url;
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
		}
		;

		Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
		Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();

		String[] fields = { "id", "email", "name" };
		User userProfile = facebook.fetchObject("me", User.class, fields);

		Member member = memberService.getMemberById(userProfile.getEmail());

		if (member == null) {
			member = new Member();
			member.setMberId(userProfile.getEmail());
			member.setOauthId(userProfile.getId());
			member.setMberFlag("1");
			memberService.join(member);
		} else if (member.getOauthId() == null || member.getOauthId().equals("")) {
			member.setOauthId(userProfile.getId());
			memberService.socialJoin(member);
		} else if (!member.getOauthId().equals(userProfile.getId())) {
			System.out.println("예외발생!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			System.out.println("이메일이 같은대 소셜 아이디가 다를경우 발생");
			System.out.println("현실적으로 일어날일 없음");
			System.out.println("예외발생!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		}

		memberService.visitUpdate(member.getMberIndex());
		member.addAuthority(new Role(member.getMberType()));
		SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(member, null,member.getAuthorities()));

		return "redirect:http://localhost:8090/catchjob/";
	}

	// //이메일 인증 코드 검증
	// @RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	// public String sendMail(Member user,Model model,RedirectAttributes rttr)
	// throws Exception {
	//
	// System.out.println("이메일 인증 시작");
	// MailHandler mailHandler = new MailHandler(mailSender);
	// String key = new TempKey().getKey(20,false);
	//
	// mailHandler.setSubject("catch job 인증 이메일 입니다.");
	// mailHandler.setText(new StringBuffer().append("<h1>메일인증</h1>").
	// append("<a href='http://localhost:8090/catchjob/verify?userEmail=").
	// append(user.getMberId()).
	// append("&memberAuthKey=").append(key).
	// append("' target='_blank'>이메일 인증 확인</a>").toString());
	// mailHandler.setFrom("test@gmail.com", "catchjob");
	// mailHandler.setTo("zxuz34@gmail.com");
	// mailHandler.send();
	//
	// return "test";
	// }

	@RequestMapping(value = "/verify", method = RequestMethod.GET)
	public String signSuccess(String memberId, String oauthKey, HttpSession session) {

		System.out.println("이메일 인증 처리완료?");
		System.out.println(memberId + "//" + oauthKey);

		Member member = memberService.getMemberByOauthId(memberId, oauthKey);

		if (member != null) {
			member.setMberFlag("1");
			memberService.modify(member);
			memberService.visitUpdate(member.getMberIndex());

			session.setAttribute("member", member);
		}

		return "redirect:/";
	}

}
