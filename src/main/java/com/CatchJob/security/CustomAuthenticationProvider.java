package com.CatchJob.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserDetailsService userDetailService;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		UsernamePasswordAuthenticationToken authToken = null;
		// 사용자가 입력한 비밀번호와 service가 가져다 준 사용자 정보의 비밀번호가 같으면 권한 제공
		// 사용자가 입력한 이름 가져오기
		String mberid = authentication.getName();
		String mberPw = (String) authentication.getCredentials();
		
		
		UserDetails member = userDetailService.loadUserByUsername(mberid);
		System.out.println(1);
		if (member == null) {
			System.out.println(2);
			throw new UsernameNotFoundException(mberid + "가 존재하지 않습니다");
		} 
		
		
		System.out.println("password:" + mberPw);
		System.out.println(!mberPw.equals(""));
		System.out.println(mberPw.equals(""));
		System.out.println("-======");
		System.out.println(passwordEncoder.matches(mberPw, member.getPassword()));		
		if (!passwordEncoder.matches(mberPw, member.getPassword())) {
			System.out.println( member.getPassword());
			System.out.println( mberPw);
			System.out.println("비밀번호 일치// member : " + member.getAuthorities());
			
			authToken = new UsernamePasswordAuthenticationToken(member, mberPw, member.getAuthorities());
			System.out.println(authToken);
			return authToken;
		} else {
			System.out.println("password:" + mberPw);
			System.out.println("member.getPassword():" + member.getPassword());
			System.out.println("비밀번호 불일치// member : " + member.getAuthorities());
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
		}
	}

	@Override
	public boolean supports(Class<?> arg0) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(arg0);
	}
}
