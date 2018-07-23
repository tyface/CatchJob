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
	public String index() {
		System.out.println("메인화면 접속");
		
		System.out.println(testDao.selectOne());
		return "index";
	}

}
