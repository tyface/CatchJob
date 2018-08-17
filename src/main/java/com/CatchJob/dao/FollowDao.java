package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface FollowDao {
	public int insertFollows(Map<String, String> data);
	public int deleteFollows(Map<String, String> data);
	public List<Map<String, String>> selectFollowsByMember(int memberIndex);
//	public Map<String, String> selectCount(int memberIndex);
	
	//팔로잉 기업 보기
//	public List<Map<String, String>> selectListEntByMember(int memberIndex);
	
	public int confirmFollowEnt (Map<String, String> data);
}
