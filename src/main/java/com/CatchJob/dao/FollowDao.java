package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface FollowDao {
	public int insertFollows(Map<String, String> data);
	public int deleteFollows(Map<String, String> data);
	public List<Map<String, String>> selectFollowsByMember(int memberIndex);
	//회원 한 명당 팔로잉 할 수 있는 기업 제한 하기 위해 필요함 ex)10개
	public Map<String, Integer> selectFollowsCount(int memberIndex);
	
	//팔로잉 기업 보기
//	public List<Map<String, String>> selectListEntByMember(int memberIndex);
	
	public int confirmFollowEnt (Map<String, String> data);
}
