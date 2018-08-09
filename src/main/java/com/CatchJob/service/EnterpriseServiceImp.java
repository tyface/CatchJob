package com.CatchJob.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.EnterpriseDao;
import com.CatchJob.model.Enterprise;
import com.CatchJob.model.Interview;
import com.CatchJob.model.Review;

@Service
public class EnterpriseServiceImp implements EnterpriseService {

	@Autowired
	private EnterpriseDao entDao;

	@Override
	public List<Enterprise> getEntList(Map<String, String> data) {
		List<Enterprise> entList = entDao.selectListEnt(data);

		for (Enterprise ent : entList) {
			ent.setSalaryAvg(salaryCalculation(ent.getSalaryAvg()));
		}

		return entList;
	}

	// @Override
	// public Enterprise getEntInfo(int entIndex) {
	// // TODO Auto-generated method stub
	// return null;
	// }
	// 기업식별 번호로 기업 정보 가져오기
	@Override
	public Map<String, String> getEntInfo(int entIndex) {
		Map<String, String> entInfo = entDao.selectEntInfo(entIndex);
		return entInfo;
	}

	// 그래프 - 인원
	@Override
	public List<Map<String, String>> empCountGraph(int ent_idx) {
		return entDao.selectGraphInf(ent_idx);
	}

	// 그래프 - 평균급여
	@Override
	public List<Map<String, String>> avgPayGraph(int entIndex) {
		return null;
	}

	@Override
	public List<Map<String, String>> getEmpCntList() {
		return entDao.selectListEmpCntRank(Constants.Config.RANK_VIEW_COUNT);
	}

	// 기업정보의 입사 퇴사 구하기 (최근 12개월 동안의 인원수 합)
	@Override
	public Map<String, String> selectEntPeopleInfo(int entIndex) {
		return entDao.selectEntPeopleInfo(entIndex);
	}

	@Override
	public boolean insertInterview(Interview interview) {
		int result = entDao.insertInterview(interview);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateInterview(Interview interview) {
		int result = entDao.updateInterview(interview);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public boolean deleteInterview(Map<String, String> data) {
		int result = entDao.deleteInterview(data);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	// 면접정보 가져오기- 회원이 면접리뷰 수정할 때 필요 
	@Override
	public Interview selectListByIndex(Map<String, String> data) {  
		
		return entDao.selectListByIndex(data);
	}
	/* 면접후기 뿌려주기 */
	@Override
	public List<Interview> selectListByEntIdx(int entIndex) {
		List<Interview> result = entDao.selectListByEntIdx(entIndex);
		System.out.println(result);
		/* 면접 난이도 */		
		for(int i = 0 ; i<result.size();i++) {			
			switch (result.get(i).getIntrvwDifficulty()) {
			case "1":
				result.get(i).setIntrvwDifficulty("매우 어려움");
				break;
			case "2":
				result.get(i).setIntrvwDifficulty("어려움");
				break;
			case "3":
				result.get(i).setIntrvwDifficulty("보통");
				break;
			case "4":
				result.get(i).setIntrvwDifficulty("쉬움");
				break;
			case "5":
				result.get(i).setIntrvwDifficulty("매우 쉬움");
				break;	
			}
		}
		/* 면접 경로 */		
		for(int i = 0 ; i<result.size();i++) {			
			switch (result.get(i).getIntrvwRoute()) {
			case "1":
				result.get(i).setIntrvwRoute("공채");
				break;
			case "2":
				result.get(i).setIntrvwRoute("온라인 지원");
				break;
			case "3":
				result.get(i).setIntrvwRoute("직원 추천");
				break;
			case "4":
				result.get(i).setIntrvwRoute("헤드헌터");
				break;
			case "5":
				result.get(i).setIntrvwRoute("학교 취업지원센터");
				break;	
			case "6":
				result.get(i).setIntrvwRoute("기타");
				break;	
			}
		}
		/* 면접 결과 */		
		for(int i = 0 ; i<result.size();i++) {			
			switch (result.get(i).getIntrvwResult()) {
			case "1":
				result.get(i).setIntrvwResult("합격");
				break;
			case "2":
				result.get(i).setIntrvwResult("불합격");
				break;
			case "3":
				result.get(i).setIntrvwResult("대기중");
				break;
			case "4":
				result.get(i).setIntrvwRoute("합격했으나 취업하지 않음");
				break;
			}
		}
		/* 면접  경험*/		
		for(int i = 0 ; i<result.size();i++) {			
			switch (result.get(i).getIntrvwExperience()) {
			case "1":
				result.get(i).setIntrvwExperience("부정적");
				break;
			case "2":
				result.get(i).setIntrvwExperience("보통");
				break;
			case "3":
				result.get(i).setIntrvwExperience("긍정적");
				break;		
			}
		}
		
		return result;
	}

	@Override
	public List<Map<String,String>> interviewPieChart(int entIndex) {
		return entDao.interviewPieChart(entIndex);
	}

	
	
	@Override
	public List<Interview> selectListByMemberIdx(int memberIndex) {
		
		return entDao.selectListByMemberIdx(memberIndex);
	}
	
	public int salaryCalculation(int payAmtAvg) {
		return (int) (payAmtAvg / Constants.Config.NPN_PERCENT * 12 / 10000);
	}




}
