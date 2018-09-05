package com.CatchJob.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.IndustryDao;
import com.CatchJob.model.Industry;

@Service
public class IndustryServiceImp implements IndustryService {
	@Autowired
	IndustryDao industryDao;

	@Override
	public Industry getIndustry(String largeCatagory) {
		return industryDao.selectIndustry(largeCatagory);
	}

	@Override
	public Map<String, Object> getIndustryList() {
		List<Map<String, Object>> list  = industryDao.selectIndustryList();
		Map<String, Object> viewData = new HashMap<String,Object>();
		viewData.put("industryList",list);
		return viewData;
	}

	@Override
	public List<Industry> getIndustryCodeList(String largeCatagory) {
		return industryDao.selectIndustryCodeList(largeCatagory);
	}
	
	@Override
	public Map<String, Object> getIndustryDetailsList(String industryCode) {
		Map<String, Object> industryDetailsMap = new HashMap<String,Object>();
		return industryDetailsMap;
	}

	@Override
	public boolean registIndustry(Industry industry) {
		int rowCount = industryDao.insertIndustry(industry);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean modifyIndustry(Industry industry) {
		int rowCount = industryDao.updateIndustry(industry);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	
}