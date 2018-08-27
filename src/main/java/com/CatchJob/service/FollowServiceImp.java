package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.CatchJob.commons.Constants;
import com.CatchJob.dao.FollowDao;

@Service
public class FollowServiceImp implements FollowService{
	
	@Autowired
	FollowDao followDao;

	/* 팔로우 기업 등록하기 */
	@Override
	public boolean regFollowEnt(Map<String, String> mapData) {
		try {
			int confirm = Integer.parseInt(mapData.get("MBER_IDX"));
			//System.out.println(confirm);
			if(getCount(confirm)) {
				followDao.insertFollows(mapData);	
				return true;
			}else {
				return false;				
			}

		}catch(Exception e) {
			System.out.println(e);
			return false;
		}
	}
	/* 팔로우 기업 회원당 최대 10개 (Constants.Follow.LIMIT_NUMBER_OF_FOLLOW)*/ 
	@Override
	public boolean getCount(int memberIndex) {
		int range = Constants.Follow.LIMIT_NUMBER_OF_FOLLOW;
		int  count = followDao.selectFollowsCount(memberIndex);
//		System.out.println("123123:  " + count);
		
		//System.out.println("범위: "+range);
		//long count =  followDao.selectFollowsCount(memberIndex).get("COUNT");
		
		
		if( count  <  range ) {
			return true;
		}else {
			return false;
		}
		
	}
	/* 팔로우 기업 해지 */
	@Override
	public boolean revFollowEnt(Map<String, String> mapData) {
		if (followDao.deleteFollows(mapData) > 0) {
			return true;
		} else {
			return false;
		}
	}
	/* 팔로우 기업 출력 */
	@Override
	public List<Map<String, String>> getFollowsEnt(int memberIndex) {
		//System.out.println("서비스: 팔로우 기업"+ memberIndex);
		return followDao.selectFollowsByMember(memberIndex);
	}
	
//	@Override
//	public List<Map<String, String>> getFollowsEntList(int memberIndex) {
//		
//		return followDao.selectListEntByMember(memberIndex);
//	}
	@Override
	public int confirmFollowEnt(Map<String, String> data) {
		
		return followDao.confirmFollowEnt(data);
	}
	

}
