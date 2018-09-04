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
	public Industry getIndustry(int largeCatagory) {
		return industryDao.selectIndustry(largeCatagory);
	}

	@Override
	public boolean modifyIndustry(Industry industryCode) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Map<String, Object> getIndustryList() {
		List<Map<String, Object>> list  = industryDao.selectIndustryList();
		Map<String, Object> viewData = new HashMap<String,Object>();
		System.out.println("list : "+ list);		
		viewData.put("industryList",list);
		return viewData;
	}

	@Override
	public List<Industry> getIndustryCodeList(int largeCatagory) {
		System.out.println("getIndustryCodeList"+industryDao.selectIndustryCodeList(largeCatagory));
		return industryDao.selectIndustryCodeList(largeCatagory);
	}
	
	@Override	//TODO 에러난다-_-
	public Map<String, Object> getIndustryDetailsList(int industryCode) {
		Map<String, Object> industryDetailsMap = new HashMap<String,Object>();
		System.out.println(industryDao.selectIndustryDetails(industryCode));
		/*industryDetailsMap=industryDao.selectIndustryDetails(industryCode);*/
		
		System.out.println("industryDetailsMap:"+industryDetailsMap);
		return industryDetailsMap;
	}

	@Override
	public boolean registCatagory(Industry industry) {
		int rowCount = industryDao.insertIndustry(industry);
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
}