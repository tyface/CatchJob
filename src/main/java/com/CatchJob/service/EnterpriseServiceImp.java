package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.EnterpriseDao;
import com.CatchJob.model.Enterprise;
import com.CatchJob.model.Interview;

@Service
public class EnterpriseServiceImp implements EnterpriseService {


	@Autowired
	private EnterpriseDao entDao;
	
	@Override
	public List<Enterprise> getEntList(Map<String, String> data) {
		for(Enterprise ent : entDao.selectListEnt(data)) {
			ent.getSalaryAvg();
		}
		 
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
		Map<String,String> entInfo = entDao.selectEntInfo(entIndex);
		return entInfo;
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

	public double salaryCalculation(int payAmtAvg) {
		return payAmtAvg / 0.09 * 12;
	}

	@Override
	public boolean  insertInterview(Interview interview) {
		int result = entDao.insertInterview(interview);
		if(result > 0) {
			return true;
		}else {			
			return false;
		}
	}

	@Override
	public boolean  updateInterview(Interview interview) {
		int result = entDao.updateInterview(interview);
		if(result > 0) {
			return true;
		}else {			
			return false;
		}
	}
	//면접정보 가져오기 
	@Override
	public Map<String,String> selectListByIndex(Map<String, Object> data) {
		System.out.println("서비스-------------------------------------123");
		return entDao.selectListByIndex(data);
	}

	
}
