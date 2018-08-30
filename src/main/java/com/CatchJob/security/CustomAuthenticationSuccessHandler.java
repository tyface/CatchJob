package com.CatchJob.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("로그인 성공");
			
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
	       
		if (roles.contains("ROLE_ADMIN")) {
            	response.sendRedirect("mngMber");
        } else {
        	response.getWriter().print("{\"result\" : \"CODE_01\"}");
        }
	}
}