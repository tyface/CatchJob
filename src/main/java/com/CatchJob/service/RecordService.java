package com.CatchJob.service;

import java.util.List;
import java.util.Map;


public interface RecordService {
	
	public boolean regViewRecord(Map<String, String> mapData);
	
	public List<Map<String, String>> getPopularSearcheList();
}
