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

	@Override
	public Enterprise getEntInfo(int entIndex) {
		// TODO Auto-generated method stub
		return null;
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



}
