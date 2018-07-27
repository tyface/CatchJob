package com.CatchJob.dao;

import java.util.List;

import com.CatchJob.model.Enterprise;
import com.CatchJob.model.NationalPension;

public interface NationalPensionDao {
	// 기업이름으로 찾기
	public List<NationalPension> selectListNP(String entIndex);

	// 기업 찾기
	public Enterprise selectEnt(int entIndex);
}
