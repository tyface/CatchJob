package com.CatchJob.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.SalaryDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Service
public class SalaryServiceImp implements SalaryService {

	@Autowired
	SalaryDao salaryDao;
	
	@Test
	@Override
	public void getRankList() {
		System.out.println("test");
		System.out.println(Constants.Config.RANK_VIEW_COUNT);
		System.out.println(salaryDao.selectListSalayRank(Constants.Config.RANK_VIEW_COUNT));
		
		
	}
	
}
