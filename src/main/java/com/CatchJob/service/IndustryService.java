package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.Industry;

public interface IndustryService {

	public Industry getIndustry(String largeCatagory);
	
	//largeCatagory, lclassName 출력
	public Map<String, Object> getIndustryList();
	//largeCatagory 선택시 induty code list를 가져와 출력
	public List<Industry> getIndustryCodeList(String largeCatagory);
	//industry code로 테이블 전체 출력
	public Map<String, Object> getIndustryDetailsList(String industryCode);
	//등록
	public boolean registIndustry(Industry industry);
	//수정
	public boolean modifyIndustry(Industry industry) ;
}
