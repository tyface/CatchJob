package com.CatchJob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/admin")
	public String admin() {
		return "admin/admin-login";
	}
	
	
	@RequestMapping(value = "/admin/mngMber")
	public String mngMber() {
		return "admin/member-member-mng";
	}
	
	@RequestMapping(value = "/admin/mngAdmin")
	public String mngAdmin() {
		return "admin/member-admin-mng";
	}
	
	@RequestMapping(value = "/admin/mngReview")
	public String mngReview() {
		return "admin/ent-review-mng";
	}
	@RequestMapping(value = "/admin/mngEnt")
	public String mngEnt() {
		return "admin/ent-mng";
	}
}
