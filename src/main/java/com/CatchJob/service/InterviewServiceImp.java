package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.InterviewDao;
import com.CatchJob.model.Interview;

@Service
public class InterviewServiceImp implements InterviewService{

	@Autowired
	private InterviewDao itvwDao;

	@Override
	public boolean insertInterview(Interview interview) {
//		int result = itvwDao.insertInterview(interview);
//		if (result > 0) {
//			return true;
//		} else {
//			return false;
//		}
		try{
			itvwDao.insertInterview(interview);
			return true;
		}catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}

	@Override
	public boolean updateInterview(Interview interview) {
		int result = itvwDao.updateInterview(interview);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public boolean deleteInterview(Map<String, String> data) {
		int result = itvwDao.deleteInterview(data);
		if (result > 0) {
			return true;
		} else {
			return false;
		}
	}

	// 면접정보 가져오기- 회원이 면접리뷰 수정할 때 필요 
	@Override
	public Interview selectListByIndex(Map<String, String> data) {  
		
		return itvwDao.selectListByIndex(data);
	}
	/* 면접후기 뿌려주기 */
	@Override
	public List<Interview> selectListByEntIdx(int entIndex) {
		List<Interview> result = itvwDao.selectListByEntIdx(entIndex);
//		System.out.println(result);
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
			//default : result.get(i).setIntrvwDifficulty("매우 쉬움");;
			//	break;
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
			//default : result.get(i).setIntrvwRoute("기타");;
			//break;
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
			try {
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
				//default : result.get(i).setIntrvwExperience("긍정적");;
				//break;
				}
			}catch(NullPointerException e) {
				System.out.println("널값임..");
			}
		}
		
		
		return result;
	}

	@Override
	public List<Map<String,String>> interviewPieChart(int entIndex) {
		return itvwDao.interviewPieChart(entIndex);
	}

	
	
	@Override
	public List<Interview> selectListByMemberIdx(int memberIndex) {
		
		return itvwDao.selectListByMemberIdx(memberIndex);
	}
	
}
