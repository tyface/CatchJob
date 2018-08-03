package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.CatchJob.model.Enterprise;

@Repository
public interface EnterpriseDao {

	// 기업이름으로 찾기
	public List<Enterprise> selectListEnt(Map<String, String> data);

	// 기업 찾기
	public Enterprise selectEnt(int entIndex);

	public List<Map<String,String>> selectListEmpCntRank(int viewCount);
	
	// 기업정보의 그래프 만들기 위해 필요한 데이터 
	public  List<Map<String,String>>  selectGraphInf(int ent_idx);
	
	// public int insertEnt(Enterprise ent); TODO 기업정보를 따로 추가할경우가 아직 없음
	// public int updateEnt(Enterprise ent); TODO 기업정보를 따로 수정할경우가 아직 없음
	// public int deleteEnt(Enterprise ent); TODO 기업정보를 따로 삭제할경우가 아직 없음
	
}
