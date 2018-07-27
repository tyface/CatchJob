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

	
	
}
