package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Industry;
@Repository
public interface IndustryDao {
	
	/*
	public int deleteIndustry(Industry industryCode);
	
	public Industry selectIndustry(String largeCatagory);
	*/
	public List<Map<String, Object>> selectIndustryList();
	
	public List<Industry> selectIndustryCodeList(int largeCatagory);

	public Map<String, Object> selectIndustryDetails(int industryCode);
	
	public int insertIndustry(Industry industry);
	
	public int updateIndustry(Industry industry);
	
	public Industry selectIndustry(int industryCode);
}
