package com.CatchJob.service;

import java.util.List;
import java.util.Map;

public interface FollowService {
	public boolean regFollowEnt(Map<String, String> mapData);
	public boolean revFollowEnt(Map<String, String> mapData);
	public List<Map<String, String>> getFollowsEnt(int memberIndex); 
//	public Map<String, String> getCount(int memberIndex);
	
	//팔로잉 기업 보기
//	public List<Map<String, String>> getFollowsEntList(int memberIndex);
	public int confirmFollowEnt (Map<String, String> data);
}
