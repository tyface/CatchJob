package com.CatchJob.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.CatchJob.model.Member;
import com.CatchJob.service.MemberService;
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserDetailsService userDetailService;
	@Autowired
	private MemberService memberService;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		UsernamePasswordAuthenticationToken authToken = null;
		String mberId = authentication.getName();
		String mberPw = (String) authentication.getCredentials();
		
		UserDetails member = userDetailService.loadUserByUsername(mberId);
		if (member == null) {
			throw new UsernameNotFoundException(mberId + "가 존재하지 않습니다");
		} else if(member != null && memberService.getMemberById(mberId).getMberFlag().equals("2")) {
			throw new DisabledException("메일 인증되지 않은 회원입니다");
		}
		
		if(!passwordEncoder.matches(mberPw, member.getPassword())) {
			
			throw new BadCredentialsException("사용자가 없거나 비밀번호가 일치하지 않습니다.");
		} else {
			authToken = new UsernamePasswordAuthenticationToken(member,mberPw,member.getAuthorities());
			System.out.println(authToken);
			return authToken;
		}
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(arg0);
	}
}
