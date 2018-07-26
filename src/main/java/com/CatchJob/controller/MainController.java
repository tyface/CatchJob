package com.CatchJob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.CatchJob.dao.TestDao;

@Controller
public class MainController {
	
	@Autowired
	TestDao testDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		System.out.println("메인화면 접속");
		
		return "main";
	}
	
	@RequestMapping(value = "/home_", method = RequestMethod.GET)
	public String home_() {
		System.out.println("메인화면 접속");
		
		return "home_";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		System.out.println("메인화면 접속");
		
		return "test";
	}
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public String test2() {
		System.out.println("메인화면 접속");
		
		return "test2";
	}
}
