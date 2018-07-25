package com.CatchJob.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
			response.sendRedirect(request.getContextPath() + "/main/login");
			return false;
		} else {
			return true; // 요청 계속 진행
		}
	}
}