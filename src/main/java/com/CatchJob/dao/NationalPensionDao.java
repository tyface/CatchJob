package com.CatchJob.dao;

import java.util.List;

import com.CatchJob.model.NationalPension;

public interface NationalPensionDao {
	
	// 특정기업 국민연금 납입내역 리스트 찾기
	public List<NationalPension> selectListNP(int entIndex);

	// 국민연금 납입내역 찾기
	public NationalPension selectNP(int npnIndex);
}
