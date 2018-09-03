package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.IndustryCode;

public interface IndustryService {

	public IndustryCode getIndustry(int largeCatagory);
	
	public boolean modifyIndustry(IndustryCode industryCode);

	//largeCatagory 선택시 induty code list를 가져와 출력
	public List<IndustryCode> getIndustryList();

}
