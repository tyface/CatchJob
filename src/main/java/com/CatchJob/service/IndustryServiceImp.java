package com.CatchJob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.IndustryDao;
import com.CatchJob.model.IndustryCode;

@Service
public class IndustryServiceImp implements IndustryService {
	@Autowired
	IndustryDao industryDao;

	@Override
	public IndustryCode getIndustry(int largeCatagory) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modifyIndustry(IndustryCode industryCode) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<IndustryCode> getIndustryList() {
		return industryDao.selectIndustryList();
	}

}
