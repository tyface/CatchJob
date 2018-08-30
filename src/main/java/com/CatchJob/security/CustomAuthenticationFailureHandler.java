package com.CatchJob.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authenticationException) throws IOException, ServletException {
		
		if (authenticationException instanceof UsernameNotFoundException) {
			System.out.println("사용자 없음");
			response.getWriter().print("{\"result\" : \"CODE_03\"}");
		} else if (authenticationException instanceof BadCredentialsException) {
			System.out.println("비밀번호 일치 하지 않음");
			response.getWriter().print("{\"result\" : \"CODE_02\"}");
		} 
	}
}
