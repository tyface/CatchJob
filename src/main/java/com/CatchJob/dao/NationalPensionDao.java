package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.HumanResource;
import com.CatchJob.model.NationalPension;
import com.CatchJob.model.Salary;

@Repository
public interface NationalPensionDao {
	
	// 특정기업 국민연금 납입내역 리스트 출력
	public List<NationalPension> selectListNP(Map<String, String> map);

	// 특정기업 인사정보 리스트 출력
	public List<HumanResource> selectListHR(Map<String, String> map);
	
	// 특정기업 연봉정보 리스트 출력
	public List<Salary> selectListSalary(Map<String, String> map);
}
