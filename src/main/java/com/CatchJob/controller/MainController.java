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
	

	
	@RequestMapping(value = "/companies", method = RequestMethod.GET)
	public String companies() {
		System.out.println("메인화면 접속");
		
		return "companies";
	}
	
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String main2() {
		
		return "test2_original";
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
