package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface RecodeDao {
	
	//기업 조회 기록
	public int insertViewRecode(Map<String, String> mapData);
	
	//기업 조회 중복체크(당일기중)
	public Map<String, Integer> selectViewRecode(Map<String, String> mapData);
	
	//당일 조회기록 있을시 회원기준 기록 갱신
	public int updateViewRecode(int viewIndex);
	
	public List<Map<String, String>> selectListPopularSearches(int viewCount);
}
