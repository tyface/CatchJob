package com.CatchJob.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface RecodeDao {
	
	//기업 조회 기록
	public int insertViewRecode(Map<String, String> mapData);
	
	public List<Map<String, String>> selectListPopularSearches(int viewCount);
}
