package com.CatchJob.dao;

import java.util.List;

import com.CatchJob.model.Enterprise;

public interface EnterpriseDao {

	// 기업이름으로 찾기
	public List<Enterprise> selectListEnt(String entName);

	// 기업 찾기
	public Enterprise selectEnt(int entIndex);

	// public int insertEnt(Enterprise ent); TODO 기업정보를 따로 추가할경우가 아직 없음
	// public int updateEnt(Enterprise ent); TODO 기업정보를 따로 수정할경우가 아직 없음
	// public int deleteEnt(Enterprise ent); TODO 기업정보를 따로 삭제할경우가 아직 없음
	
}
