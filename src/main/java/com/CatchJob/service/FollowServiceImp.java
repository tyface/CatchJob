package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.FollowDao;
import com.CatchJob.model.Enterprise;

@Service
public class FollowServiceImp implements FollowService{
	
	@Autowired
	FollowDao followDao;

	/* 팔로우 기업 등록하기 */
	@Override
	public boolean regFollowEnt(Map<String, String> mapData) {
		boolean result = false;
		int confirm = Integer.parseInt(mapData.get("MBER_IDX"));
		try {
			if(getCount(confirm)) {
				followDao.insertFollows(mapData);	
				result =  true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/* 팔로우 기업 회원당 최대 10개 (Constants.Follow.LIMIT_NUMBER_OF_FOLLOW)*/ 
	@Override
	public boolean getCount(int memberIndex) {
		boolean result = false;
		int range = Constants.Follow.LIMIT_NUMBER_OF_FOLLOW;
		int  count = followDao.selectFollowsCount(memberIndex);
		if( count  <  range ) {
			result =  true;
		}
		return result;
	}
	/* 팔로우 기업 해지 */
	@Override
	public boolean revFollowEnt(Map<String, String> mapData) {
		boolean result = false;
		if (followDao.deleteFollows(mapData) > 0) {
			result =  true;
		} 
		return result;
	}
	/* 팔로우 기업 출력 */
	@Override
	public List<Map<String, String>> getFollowsEnt(int memberIndex) {
		return followDao.selectFollowsByMember(memberIndex);
	}
	@Override
	public List<Enterprise> getFollowsEntList(int memberIndex) {
		
		List<Enterprise> entList = followDao.selectListEntByMember(memberIndex);

		for (Enterprise ent : entList) {
			ent.setSalaryAvg(salaryCalculation(ent.getSalaryAvg()));
		}
		return entList;
	}
	public int salaryCalculation(int payAmtAvg) {
		return (int) (payAmtAvg / Constants.Config.NPN_PERCENT * 12 / 10000);
	}

}
