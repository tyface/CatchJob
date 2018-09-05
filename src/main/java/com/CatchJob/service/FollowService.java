package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.Enterprise;

public interface FollowService {
	//팔로우 기업 등록하기 
	public boolean regFollowEnt(Map<String, String> mapData);
	//팔로우 기업 해지
	public boolean revFollowEnt(Map<String, String> mapData);
	//팔로우 기업 출력 
	public List<Map<String, String>> getFollowsEnt(int memberIndex); 
	//팔로우 기업 수 check
	public boolean getCount(int memberIndex);
	//팔로잉 기업 보기
	public List<Enterprise> getFollowsEntList(int memberIndex);
}
