package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.EnterpriseDao;
import com.CatchJob.model.Enterprise;

@Service
public class EnterpriseServiceImp implements EnterpriseService {


	@Autowired
	private EnterpriseDao entDao;
	
	@Override
	public List<Enterprise> getEntList(Map<String, String> data) {
		return entDao.selectListEnt(data);
	}

//	@Override
//	public Enterprise getEntInfo(int entIndex) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	// 기업식별 번호로  기업 정보 가져오기 
	@Override
	public Map<String,String> getEntInfo(int entIndex) {		
		return entDao.selectEntInfo(entIndex);
	}

	// 그래프 - 인원
	@Override
	public List<Map<String,String>> empCountGraph(int ent_idx) {		
		return entDao.selectGraphInf(ent_idx);
	}

	// 그래프 - 평균급여
	@Override
	public List<Map<String,String>> avgPayGraph(int entIndex) {
		return null;
	}

	@Override
	public List<Map<String, String>> getEmpCntList() {
		return entDao.selectListEmpCntRank(Constants.Config.RANK_VIEW_COUNT);
	}
	//기업정보의 입사 퇴사 구하기 (최근 12개월 동안의  인원수 합)
	@Override
	public Map<String, String> selectEntPeopleInfo(int entIndex) {
		return entDao.selectEntPeopleInfo(entIndex);
	}



}
