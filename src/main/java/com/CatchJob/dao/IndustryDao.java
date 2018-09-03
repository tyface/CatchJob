package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.IndustryCode;
@Repository
public interface IndustryDao {
	
	public int updateIndustry(IndustryCode industryCode);
	
	public int deleteIndustry(IndustryCode industryCode);
	
	public IndustryCode selectIndustry(int largeCatagory);
	
	public List<IndustryCode> selectIndustryList();

}
