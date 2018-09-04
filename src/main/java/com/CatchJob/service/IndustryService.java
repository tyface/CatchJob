package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.Industry;

public interface IndustryService {

	public Industry getIndustry(int largeCatagory);
	
	public boolean modifyIndustry(Industry industryCode);

	//largeCatagory, lclassName 출력
	public Map<String, Object> getIndustryList();
	//largeCatagory 선택시 induty code list를 가져와 출력
	public List<Industry> getIndustryCodeList(int largeCatagory);
	//industry code로 테이블 전체 출력
	public Map<String, Object> getIndustryDetailsList(int industryCode);
	//분류명, 분류코드 등록
	public boolean registCatagory(Industry industry);
}
