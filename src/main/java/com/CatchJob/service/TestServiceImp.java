package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.TestDao;

/*@Service*/
public class TestServiceImp implements TestService{
	
	@Autowired
	private TestDao dao;

	@Override
	public List<Map<String, Object>> selectAll() {
		
		return dao.selectAll();
	}
	
	
	
}
