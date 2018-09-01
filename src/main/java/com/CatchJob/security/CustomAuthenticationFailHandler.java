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
public class CustomAuthenticationFailHandler implements AuthenticationFailureHandler {

	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException authenticationException) throws ServletException, IOException {

		System.out.println("어드민 로그인 실패");
		if (authenticationException instanceof UsernameNotFoundException) {
			request.setAttribute("msg", "사용자가 존재하지 않습니다");
		} else if (authenticationException instanceof BadCredentialsException) {
			request.setAttribute("msg", "사용자가 없거나 비밀번호가 일치하지 않습니다");
		} else if (authenticationException instanceof Exception) {
			request.setAttribute("msg", "올바른 아이디 혹은 비밀번호를 입력해 주세요");
		}
		request.setAttribute("url", "admin");
		request.getRequestDispatcher("result").forward(request, response);

	}
}
