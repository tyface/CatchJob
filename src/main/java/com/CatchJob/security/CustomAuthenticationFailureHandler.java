package com.CatchJob.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authenticationException) throws IOException, ServletException {
		
		System.out.println("멤버 로그인 실패");
		if (authenticationException instanceof UsernameNotFoundException) {
			System.out.println("멤버 사용자 없음");
			response.getWriter().print("{\"result\" : \"CODE_03\"}");
		} else if (authenticationException instanceof DisabledException){
			System.out.println("메일 인증 안받음");
			response.getWriter().print("{\"result\" : \"CODE_04\"}");
		} else if (authenticationException instanceof BadCredentialsException) {
			System.out.println("멤버 비밀번호 일치 하지 않음");
			response.getWriter().print("{\"result\" : \"CODE_02\"}");
		} 

	}
}
