package com.CatchJob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("메인화면 접속");
		
		return "main";
	}
	
	@RequestMapping(value = "/search")
	public String search(String keyword) {
		return "forward:enterprise/search";
	}
	
	
	@RequestMapping(value = "/companies", method = RequestMethod.GET)
	public String companies() {
		System.out.println("메인화면 접속");
		
		return "companies";
	}
	
	
	@RequestMapping(value = "/nav", method = RequestMethod.GET)
	public String nav() {
		
		return "nav";
	}

	@RequestMapping(value = "/modals", method = RequestMethod.GET)
	public String modals() {
		
		return "source/modals";
	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String input() {
		
		return "source/input";
	}
	
	@RequestMapping(value = "/button", method = RequestMethod.GET)
	public String button() {
		
		return "source/button";
	}
	
	@RequestMapping(value = "/follow", method = RequestMethod.GET)
	public String follow() {
		
		return "source/follow";
	}
	
	@RequestMapping(value = "/star", method = RequestMethod.GET)
	public String star() {
		
		return "source/star";
	}
	
	@RequestMapping(value = "/table", method = RequestMethod.GET)
	public String table() {
		
		return "source/table";
	}
	
	@RequestMapping(value = "/interview", method = RequestMethod.GET)
	public String interview() {
		
		return "interview";
	}
	
	
}
